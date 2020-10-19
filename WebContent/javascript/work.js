
function summary_TotalizeTypeClosed(node, type) {
	var count = 0;
	for (k in node.children) {
		if (type == node.children[k].treeNodeType) {

			if ("Closed" == node.children[k].parameters.Status)
				count++;
		}
		count += summary_TotalizeTypeClosed(node.children[k], type);

	}
	return count;
}

function summary_TotalizeType(node, type) {
	var count = 0;
	for (k in node.children) {
		if (type == node.children[k].treeNodeType) {
			count++;
		}
		count += summary_TotalizeType(node.children[k], type);

	}
	return count;
}

function work_DisplayStatus(node) {
	// console.log("work_DisplayStatus " + node.treeNodeName);
	var text = "";
	text += "<TABLE border=1 width='100%'>";
	text += "<TR><TH width='15%'>Update</TH><TD>" + node.treeNodeName
			+ "</TD></TR>";
	for (k in node.parameters) {
		text += "<TR>";
		text += "<TH>" + k + "</TH>";
		text += "<TD>" + node.parameters[k] + "</TD>";
		text += "</TR>";
	}
	for (s in node.children) {
		text += "<TR><TH>Error unrecognized Type</TH><TD>"
				+ node.children[s].treeNodeType + "</TD></TR>";
	}
	text += "</TABLE>";
	return text;
}

function worky_DisplayDeficiency(node) {
	// console.log("work_DisplayDeficiency " + node.treeNodeName);
	var text = "";
	text += "<TABLE border=1 width='100%'>";
	text += "<TR><TH width='15%'>Deficiency</TH><TD>" + node.treeNodeName
			+ "</TD></TR>";
	for (k in node.parameters) {
		text += "<TR>";
		text += "<TH>" + k + "</TH>";
		text += "<TD>" + node.parameters[k] + "</TD>";
		text += "</TR>";
	}
	for (d in node.children) {
		if ("Status" == node.children[d].treeNodeType) {
			text += "<TR>";
			text += work_DisplayStatus(node.children[d]);
			text += "</TR>";
		} else {
			text += "<TR><TH>Error unrecognized Type</TH><TD>"
					+ node.children[d].treeNodeType + "</TD></TR>";
		}
	}

	text += "</TABLE>";
	return text;
}
function work_DisplayAcceptance(node) {
	// console.log("work_DisplayAcceptance " + node.treeNodeName);
	var text = "";
	text += "<TABLE border=1 width='100%'>";
	text += "<TR><TH width='15%'>Acceptance</TH><TD>" + node.treeNodeName
			+ "</TD></TR>";
	for (k in node.parameters) {
		text += "<TR>";
		text += "<TH>" + k + "</TH>";
		text += "<TD>" + node.parameters[k] + "</TD>";
		text += "</TR>";
	}
	for (d in node.children) {
		text += "<TR>";
		if ("Status" == node.children[d].treeNodeType) {
			text += "<TD colspan=2>";
			text += work_DisplayStatus(node.children[d]);
			text += "</TD>";
		} else {
			text += "<TH>Error unrecognized Type</TH><TD>"
					+ node.children[d].treeNodeType + "</TD>";
		}
		text += "</TR>";
	}

	text += "</TABLE>";
	return text;
}

function work_DisplayEquipment(node) {
	// console.log("work_DisplayEquipment " + node.treeNodeName);
	var text = "";
	text += "<TABLE border=1 width='100%'>";
	text += "<TR><TH width='15%'>Equipment</TD><TD>" + node.treeNodeName
			+ "</TD></TR>";

	for (k in node.parameters) {
		text += "<TR>";
		text += "<TH>" + k + "</TH>";
		text += "<TD>" + node.parameters[k] + "</TD>";
		text += "</TR>";
	}
	for (k in node.children) {
		text += "<TR>";
		if ("Deficiency" == node.children[k].treeNodeType) {
			text += "<TD colspan=2>";
			text += worky_DisplayDeficiency(node.children[k]);
			text += "</TD>";
		} else if ("Acceptance" == node.children[k].treeNodeType) {
			text += "<TD colspan=2>";
			text += work_DisplayAcceptance(node.children[k]);
			text += "</TD>";
		} else {
			text += "<TH>Error unrecognized Type</TH><TD>"
					+ node.children[k].treeNodeType + "</TD>";
		}
		text += "</TR>";
	}
	text += "</TABLE>";
	return text;
}

function work_DisplayOrganization(node) {
	// console.log("work_DisplayOrganization " + node.treeNodeName);
	var text = "";

	if (node.children.length > 0) {
		text += "<UL>";
		text += "<LI>";
		text += node.treeNodeName;
		text += "</LI>";
		for (j in node.children) {
			text += "<LI>";
			if ("Organization" == node.children[j].treeNodeType) {

				text += work_DisplayOrganization(node.children[j]);

			} else if ("Equipment" == node.children[j].treeNodeType) {

				text += work_DisplayEquipment(node.children[j]);

			} else {
				text += "Error, unrecognized Type:"
						+ node.children[j].treeNodeType;
			}
			text += "</LI>";
		}
		text += "</UL>";
	}

	return text;
}

function work_display() {
	console.log("work_display");
	var text = "";

	if (GLOBAL_data.isAuthorized != 'true') {
		text = "<h1>Not isAuthorized err2.0</h1>";
	} else if (GLOBAL_data.message != null) {
		text += "<h1>Work Page Error</h1>";
		text += "<h2>" + data.message + "</h2>";
	} else if (GLOBAL_data.root == null) {
		text += "<h1>Work</h1>";
		text += "<P>no root</P>";
	} else {
		text += "<h1>Summary</h1>";
		text += work_DisplayOrganization(GLOBAL_data.root);
	}

	$("#div_report").html(text);
}

