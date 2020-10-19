function summary_AddDeficiencyClick() {
	console.log("summary_AddDeficiencyClick id=" + this.id);

	node = findTreeNode(GLOBAL_data.root, this.id);
	if (node != null) {
		console.log(node);
		addDeficiency_Display(node);
	}
}

function summary_AddAcceptanceClick() {
	console.log("summary_AddAcceptanceClick id=" + this.id);

	node = findTreeNode(GLOBAL_data.root, this.id);
	if (node != null) {
		console.log(node);
		addAcceptance_Display(node);
	}
}
function summary_tableClick() {
	console.log(this.id);

	node = findTreeNode(GLOBAL_data.root, this.id);
	if (node != null) {
		console.log(node);
		if (node.treeNodeType == "Deficiency") {
			deficiency_Display(node);
		} else if (node.treeNodeType == "Acceptance") {
			acceptance_Display(node);
		} else {

			if (node.parameters._expanded == null)
				node.parameters._expanded = true;
			else
				node.parameters._expanded = !node.parameters._expanded;
			summary_display();
		}
	} else {
		console.log("Node not found:" + this.id);

		summary_display();
	}
};

function summary_TotalizeTypeStatusCriticality(node, type, status, criticality) {
	var count = 0;
	for (q in node.children) {
		if (type == null || type == node.children[q].treeNodeType) {
			if (status == null || status == node.children[q].parameters.Status) {
				if (criticality == null || criticality == node.children[q].parameters.Criticality) {
					count++;
				}
			}
		}
		count += summary_TotalizeTypeStatusCriticality(node.children[q], type, status, criticality);

	}
	return count;
}

function summary_Row(node, depth) {
	if (node.parameters.Status == "Open" || !$("#checkbox_filterClosed").is(":checked")  || node.treeNodeType != "Deficiency") {

		var equipmentCount = summary_TotalizeTypeStatusCriticality(node, "Equipment", null, null);

		var deficiencyCount = summary_TotalizeTypeStatusCriticality(node, "Deficiency", null, null);
		var deficiencyCountOpen = summary_TotalizeTypeStatusCriticality(node, "Deficiency", "Open", null);
		var deficiencyCountOpenCritical = summary_TotalizeTypeStatusCriticality(node, "Deficiency", "Open", "Critical");
		var deficiencyCountOpenMajor = summary_TotalizeTypeStatusCriticality(node, "Deficiency", "Open", "Major");
		var deficiencyCountOpenMinor = summary_TotalizeTypeStatusCriticality(node, "Deficiency", "Open", "Minor");
		var acceptanceCount = summary_TotalizeTypeStatusCriticality(node, "Acceptance", null, null);
		var acceptanceCountOpen = summary_TotalizeTypeStatusCriticality(node, "Acceptance", "Open", null);
		var acceptancePercent = 0;

		if (acceptanceCount > 0)
			acceptancePercent = (100 * (acceptanceCountOpen)) / (acceptanceCount)
		else
			acceptancePercent = "n/a";
		var text = "";
		text += "<TR"
		if (node.parameters.Status == "Closed") {
			text += " bgcolor='grey' ";
		} else if (node.parameters.Status == "N/A") {
			text += " bgcolor='lightgrey' ";
		} else if (node.treeNodeType == "Deficiency") {
			if (node.parameters.Criticality == "Critical")
				text += " bgcolor='red' ";
			else
				text += " bgcolor='lightpink' ";
		} else if (node.treeNodeType == "Acceptance") {
			text += " bgcolor='lightblue' ";
		}
		text += ">";
		text += "<TD class=treeNodeId id='" + node.treeNodeId + "'>";

		for (j = 0; j < depth - 1; j++) {
			text += "___";
		}

		text += node.treeNodeName + " </TD>";

		if (node.treeNodeType == "Organization" || node.treeNodeType == "Equipment") {
			if (acceptanceCount > 0)
				text += "<TD>" + (acceptanceCount - acceptanceCountOpen) + "/" + acceptanceCount + "</TD>";
			else
				text += "<TD></TD>";

			if (deficiencyCount > 0)
				text += "<TD>" + deficiencyCount + "</TD>";
			else
				text += "<TD></TD>";
			if (deficiencyCountOpenCritical > 0)
				text += "<TD>" + deficiencyCountOpenCritical + "</TD>";
			else
				text += "<TD></TD>";
			if (deficiencyCountOpenMajor > 0)
				text += "<TD>" + deficiencyCountOpenMajor + "</TD>";
			else
				text += "<TD></TD>";
			if (deficiencyCountOpenMinor > 0)
				text += "<TD>" + deficiencyCountOpenMinor + "</TD>";
			else
				text += "<TD></TD>";
		} else if (node.treeNodeType == "Acceptance") {
			text += "<TD>";
			if (node.parameters.Status == "Open")
				text += "0";
			else
				text += "1";
			text += "/1";

			text += "</TD>";
			text += "<TD bgcolor='grey'></TD>";
			text += "<TD bgcolor='grey'></TD>";
			text += "<TD bgcolor='grey'></TD>";
			text += "<TD bgcolor='grey'></TD>";
		} else if (node.treeNodeType == "Deficiency") {
			text += "<TD bgcolor='grey'></TD>";

			text += "<TD>";
			if (node.parameters.Status == "Open")
				text += "1";
			text += "</TD>";

			text += "<TD>";
			if (node.parameters.Criticality == "Critical" && node.parameters.Status == "Open")
				text += "1";
			text += "</TD>";

			text += "<TD>";
			if (node.parameters.Criticality == "Major" && node.parameters.Status == "Open")
				text += "1";

			text += "</TD>";

			text += "<TD>";
			if (node.parameters.Criticality == "Minor" && node.parameters.Status == "Open")
				text += "1";

			text += "</TD>";
		} else {
			text += "<TD bgcolor='lightgrey'></TD>";
			text += "<TD bgcolor='lightgrey'></TD>";
			text += "<TD bgcolor='lightgrey'></TD>";
			text += "<TD bgcolor='lightgrey'></TD>";
		}

		text += "</TR>";
		node.children.sort(comparetreeNodeName);
		if (node.parameters._expanded) {
			for (k in node.children) {
				text += summary_Row(node.children[k], depth + 1);

			}
		}
		if (node.treeNodeType == "Equipment") {

			if (GLOBAL_data.roles.includes("Inspector") || GLOBAL_data.roles.includes("Operator")) {

				text += "<TR><TD colspan=6 class=td_addDeficiency id='" + node.treeNodeId + "' value='Deficiency' >Add Deficiency Item</TD></TR>"
			}
			if (GLOBAL_data.roles.includes("Administrator")) {

				text += "<TR><TD colspan=6 class=td_addAcceptance id='" + node.treeNodeId + "' value='Acceptance'>Add Acceptance Item</TD></TR>"
			}
		}
		return text;
	} else {
		return "";
	}
}

function summary_display() {
	console.log("summary_display");
	var text = "";

	if (GLOBAL_data.isAuthorized != 'true') {
		text = "<h1>Not isAuthorized err2.0</h1>";
	} else if (GLOBAL_data.message != null) {
		text += "<h1>Summary Page Error</h1>";
		text += "<h2>" + data.message + "</h2>";
	} else if (GLOBAL_data.root == null) {
		text += "<h1>Summary</h1>";
		text += "<P>no root</P>";
	} else {
		text += "<h1>Summary</h1>";
		text += "<TABLE border=1 width='100%'>";
		text += "<TR>";
		text += "<TH>Organization</TH>";
		text += "<TH>Acceptance</TH><TH>Deficiencies</TH><TH>Critical</TH><TH>Major</TH><TH>Minor</TH></TR>";
		GLOBAL_data.root.children.sort(comparetreeNodeName);
		for (j in GLOBAL_data.root.children) {
			text += summary_Row(GLOBAL_data.root.children[j], 1);
		}
		text += "</Table>";
	}

	$("#div_report").html(text);
	$(".treeNodeId").click(summary_tableClick);

	$(".td_addAcceptance").click(summary_AddAcceptanceClick);
	$(".td_addDeficiency").click(summary_AddDeficiencyClick);
}