function clickAddDeficiency() {
	console.log("clickAddDeficiency");

	var data = {
		"command" : "deficiencyAdd",
		"nodeId" : $("#input_nodeId").val(),
		"title" : $("#input_title").val(),
		"details" : $("#input_details").val(),
		"criticality" : $("#input_Criticality option:selected").text(),
		"referenceInfo" : $("#input_ReferenceInfo").val()

	};
	console.log(data);
	$.post(servletURL, data, deficiency_DisplayId);
}

function addDeficiency_Display(node) {
	console.log("adddeficiency_Display");
	console.log(node);
	var text = "";

	if (GLOBAL_data.isAuthorized != 'true') {
		text = "<h1>Not isAuthorized err5.0</h1>";
	} else if (GLOBAL_data.message != null) {
		text += "<h1>Add Deficiency Page Error</h1>";
		text += "<h2>" + data.message + "</h2>";
	} else if (node == null) {
		text += "<h1>Add Deficiency</h1>";
		text += "<P>no node</P>";
	} else {

		var parentNode = findTreeNode(GLOBAL_data.root, node.treeNodeParentId);
		text += "<h1>Add Deficiency</h1>";

		if (GLOBAL_data.roles.includes("Inspector") || GLOBAL_data.roles.includes("Operator")) {

			if (parentNode != null) {
				text += "<TABLE border=1 width='100%'>";
				text += "<TR><TH>Equipment</TH><TD>" + parentNode.treeNodeName + "</TD></TR>";
				text += "<TR><TH>Title</TH><TD><input type='text' id='input_title' maxlength='64' width='100%'></input>";
				text += "  <input type='hidden' id='input_nodeId' value=" + node.treeNodeId + "></input>";
				text += "  <input type='hidden' id='input_status' value='Open'></input>";
				text += " </TD></TR>";
				text += "<TR><TH>Status</TH><TD>Open</TD></TR>";
				text += "<TR><TH>Criticality</TH><TD>"+criticalitySelect("Critical")+"</TD></TR>";
				text += "<TR><TH>Reference</TH><TD><input type='text' id='input_ReferenceInfo' maxlength='64' width='100%'></input></TD></TR>";
				text += "<TR><TH>User</TH><TD>" + GLOBAL_data.userName + "</TD></TR>";
				text += "<TR><TH>Date</TH><TD>" + (new Date()) + "</TD></TR>";
				text += "<TR><TH>Details</TH><TD><textarea id='input_details' rows='8' cols='64'  maxlength='512'  width='100%'></textarea></TD></TR>";
				text += "<TR><TH><BR></TH><TD><button id='button_AddDeficiency'>Add</button></TD></TR>";
				text += "</Table>";
			} else {
				text += "<h2>parentNode missing for " + node.treeNodeParentId + "</h2>";
			}

		} else
			text += "<h2>User " + GLOBAL_data.userName + " does not have permissions for this function</h2>";
	}

	$("#div_report").html(text);

	$("#button_AddDeficiency").click(clickAddDeficiency);
}