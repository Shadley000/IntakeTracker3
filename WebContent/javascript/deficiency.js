function clickCloseDeficiency() {
	console.log("clickClosedeficiency");
	var data = {
		"command" : "deficiencyClose",
		"nodeId" : $("#input_nodeId").val(),
		"title" : $("#input_title").val(),
		"details" : $("#input_details").val()
	};
	$.post(servletURL, data, deficiency_DisplayId);
}

function changeCriticality() {
	console.log("changeCriticality");
	var data = {
			"command" : "deficiencyCriticalityEdit",
			"nodeId" : $("#input_nodeId").val(),
			"criticality" : $("#input_Criticality option:selected").text()
	};
	$.post(servletURL, data, deficiency_DisplayId);
}

function clickAddDeficiencyComment() {
	console.log("clickAddDeficiencyComment");

	var data = {
		"command" : "deficiencyEdit",
		"nodeId" : $("#input_nodeId").val(),
		"title" : $("#input_title").val(),
		"details" : $("#input_details").val(),
		"po" : $("input_po").val(),
		"referenceInfo" : $("input_referenceInfo").val(),
		"deliveryDate" : $("input_deliveryDate").val(),
		"completionDate" : $("input_completionDate").val()
	};
	$.post(servletURL, data, deficiency_DisplayId);
}

function deficiency_DisplayId(data, status) {
	GLOBAL_data = data;
	var text = "";
	if (GLOBAL_data.isAuthorized != 'true') {
		text = "<h1>Not isAuthorized err4.0</h1>";
		$("#div_report").html(text);
	} else if (GLOBAL_data.message != null) {
		text += "<h1>Deficiency Page Error</h1>";
		text += "<h2>" + data.message + "</h2>";
		$("#div_report").html(text);
	} else
		deficiency_Display(findTreeNode(GLOBAL_data.root, GLOBAL_data.selectedNode));
}

function deficiency_Display(node) {
	console.log("deficiency_Display");
	console.log(node);
	var text = "";

	if (GLOBAL_data.isAuthorized != 'true') {
		text = "<h1>Not isAuthorized err2.0</h1>";
	} else if (GLOBAL_data.message != null) {
		text += "<h1>Deficiency Page Error</h1>";
		text += "<h2>" + data.message + "</h2>";
	} else if (node == null) {
		text += "<h1>Deficiency</h1>";
		text += "<P>no node</P>";
	} else {

		var parentNode = findTreeNode(GLOBAL_data.root, node.treeNodeParentId);
		console.log("parentnode");
		console.log(parentNode);
		text += "<h1>Deficiency</h1>";
		text += "<TABLE border=1 width='100%'>";
		if (parentNode != null)
			text += "<TR><TH>Equipment</TH><TD>" + parentNode.treeNodeName + "</TD></TR>";
		else
			text += "<TR><TH>Equipment</TH><TD>parentNode missing for " + node.treeNodeParentId + "</TD></TR>";
		text += "<TR><TH>Title</TH><TD>" + node.treeNodeName + "  <input type='hidden' id='input_nodeId' value=" + node.treeNodeId + "></input></TD></TR>";
		text += "<TR><TH>User</TH><TD>" + node.parameters.Details + "</TD></TR>";
		text += "<TR><TH>Date</TH><TD>" + node.parameters.Date + "</TD></TR>";
		text += "<TR><TH>Status</TH><TD>" + node.parameters.Status + "</TD></TR>";
		// text += "<TR><TH>Criticality</TH><TD>" + node.parameters.Criticality
		// + "</TD></TR>";
		text += "<TR><TH>Criticality</TH><TD>";
		text += criticalitySelect(node.parameters.Criticality);
		text += "</TD></TR>";
		text += "<TR><TH>Reference Info</TH><TD>" + node.parameters.Reference + "</TD></TR>";
		text += "<TR><TH>Details</TH><TD>" + node.parameters.Details + "</TD></TR>";

		node.children.sort(comparetreeNodeDate);
		for (k in node.children) {
			var child = node.children[k]
			if (child.treeNodeType == "Status") {
				var title = child.treeNodeName;
				var date = child.parameters.Date;
				var user = child.parameters.User;
				var details = child.parameters.Details;

				text += "<TR><TH colspan=2>Update</TH></TR>";
				text += "<TR><TD>" + user + "</TD><TD>" + date + "</TD></TR>";
				text += "<TR><TD colspan=2>" + title + "</TD></TR>";
				text += "<TR><TD colspan=2>" + details + "</TD></TR>";
			} else {
				text += "<TR><TH>Error</TH><TD>" + child.treeNodeType + "</TD></TR>";
			}
		}
		if (GLOBAL_data.roles.includes("Inspector") || GLOBAL_data.roles.includes("Contractor") || GLOBAL_data.roles.includes("Operator")) {
			text += "<TR><TH colspan=2>Update</TH></TR>";
			text += "<TR><TD>" + GLOBAL_data.userName + "</TD><TD>" + (new Date()) + "</TD></TR>";
			text += "<TR><TH>Title</TH><TD><input type='text' id='input_title' maxlength='64'></input></TD></TR>";
			text += "<TR><TH>PO Number</TH><TD><input type='text' id='input_po' maxlength='64'></input></TD></TR>";
			text += "<TR><TH>Reference Info</TH><TD><input type='text' id='input_referenceInfo' maxlength='64'></input></TD></TR>";
			text += "<TR><TH>Delivery Date</TH><TD><input type='text' id='input_deliveryDate' maxlength='64'></input></TD></TR>";
			text += "<TR><TH>Completion Date</TH><TD><input type='text' id='input_completionDate' maxlength='64'></input></TD></TR>";

			text += "<TR><TH>Details</TH><TD><textarea id='input_details' rows='8' cols='64'  maxlength='512'></textarea></TD></TR>";
			text += "<TR><TH>Action</TH><TD>";
			if (GLOBAL_data.roles.includes("Inspector")) {
				text += "<button id='button_CloseDeficiency'>Close Deficiency Item</button>";
			}
			text += "<button id='button_AddDeficiencyComment'>Add Comment</button>";
			text += "</TD></TR>";
		}
		text += "</Table>";
	}

	$("#div_report").html(text);

	$("#button_CloseDeficiency").click(clickCloseDeficiency);
	$("#button_AddDeficiencyComment").click(clickAddDeficiencyComment);
	$("#input_Criticality").change(changeCriticality);
}
