
function legacy_tableClick() {
	console.log(this.id);

	node = findTreeNode(GLOBAL_data.root, this.id);
	deficiency_Display(node);
}

function legacyDeficiency_Display() {
	console.log("legacyDeficiency_Display");
	var text = "";

	if (GLOBAL_data.isAuthorized != 'true') {
		text = "<h1>Not isAuthorized err5.5</h1>";
	} else if (GLOBAL_data.message != null) {
		text += "<h1>Legacy Deficiency Page Error</h1>";
		text += "<h2>" + data.message + "</h2>";
	} else {

		var deficiencyNodes = findAllTreeNodes(GLOBAL_data.root, "Deficiency");

		deficiencyNodes.sort(comparetreeNodeDate);

		text += "<h1>Legacy Deficiency</h1>";

		if (deficiencyNodes == null) {
			text += "<h2>deficiencyNodes missing</h2>";

		} else {
			text += "<TABLE border=1 width='100%'>";
			text += "<TR><TH>Criticality</TH>" + "<TH>Organization</TH>" + "<TH>Details</TH></TR>";
			for (i in deficiencyNodes) {
				var node = deficiencyNodes[i];
				console.log(node);
				var parentNode = findTreeNode(GLOBAL_data.root, node.treeNodeParentId);
				var parentParentNode = findTreeNode(GLOBAL_data.root, parentNode.treeNodeParentId);

				
				
				
				if (node.parameters.Status == "Open" || !$("#checkbox_filterClosed").is(":checked")  ) {

					if (node.parameters.Status == "Open")
						text += "<TR  class=treeNodeId   id='" + node.treeNodeId + "'>";
					else
						text += "<TR bgcolor='grey'  class=treeNodeId   id='" + node.treeNodeId + "'>";
					text += "<TD bgcolor='" + getCriticalityColor(node.parameters.Criticality) + "'>" + node.parameters.Criticality + "</TD>";
					text += "<TD>" + parentParentNode.treeNodeName + "<BR>&nbsp&nbsp&nbsp&nbsp" + parentNode.treeNodeName + "</TD>";
					text += "<TD>";
					text += "<B>" + node.treeNodeName + "</B>&nbsp&nbsp" + node.parameters.Date + ":" + node.parameters.User;
					if (node.parameters.Reference != null && node.parameters.Reference.length > 0) {
						text += "<BR><B>Reference</B> " + node.parameters.Reference;
					}
					text += "<BR>" + node.parameters.Details;

					for (q in node.children) {
						var child = node.children[q];
						text += "<BR><BR><B>" + child.treeNodeName + "</B>&nbsp&nbsp" + child.parameters.Date + ":" + child.parameters.User + "<BR>";

						if (child.parameters.Reference != null && child.parameters.Reference.length > 0) {
							text += "<BR><B>Reference</B> " + child.parameters.Reference;
						}
						if (child.parameters.PO != null && child.parameters.PO.length > 0) {
							text += "<BR><B>PO</B> " + child.parameters.PO;
						}
						if (child.parameters.DeliveryDate != null && child.parameters.DeliveryDate.length > 0) {
							text += "<BR><B>DeliveryDate</B> " + child.parameters.DeliveryDate;
						}
						if (child.parameters.CompletionDate != null && child.parameters.CompletionDate.length > 0) {
							text += "<BR><B>CompletionDate</B> " + child.parameters.CompletionDate;
						}
						if (child.parameters.Details != null && child.parameters.Details.length > 0) {
							text += "<BR>" + child.parameters.Details;
						}
					}
					text += "</TD>";

					text += "</TR>";
				}
			}
			text += "</Table>";

			if (GLOBAL_data.roles.includes("Inspector") || GLOBAL_data.roles.includes("Operator")) {

			}
		}
	}

	$("#div_report").html(text);
	$(".treeNodeId").click(legacy_tableClick);
	// $("#button_AddDeficiency").click(clickAddDeficiency);
}