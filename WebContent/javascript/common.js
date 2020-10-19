var servletURL = "IntakeTrackerServlet";
var GLOBAL_data = null;

function comparetreeNodeName(a, b) {
	if (a.treeNodeName < b.treeNodeName) {
		return -1;
	}
	if (a.treeNodeName > b.treeNodeName) {
		return 1;
	}
	return 0;
}
function comparetreeNodeDate(a, b) {
	if (a.parameters.Date < b.parameters.Date) {
		return -1;
	}
	if (a.parameters.Date > b.parameters.Date) {
		return 1;
	}
	return 0;
}

function findTreeNode(node, treeNodeId) {
	if (node.treeNodeId == treeNodeId)
		return node;
	for (q in node.children) {
		var foundNode = findTreeNode(node.children[q], treeNodeId)
		if (foundNode != null)
			return foundNode;
	}

}

function getCriticalityColor(criticality) {
	if (criticality == "Critical")
		return "red";
	if (criticality == "Major")
		return "orange";
	if (criticality == "Minor")
		return "yellow";
	return "grey";
}
function findAllTreeNodes(node, treeNodeType) {
	var matchingNodes = [];
	if (node.treeNodeType == treeNodeType) {
		matchingNodes.push(node);
	}
	for (q in node.children) {
		var childMatchingNodes = findAllTreeNodes(node.children[q], treeNodeType);
		if (childMatchingNodes != null && childMatchingNodes.length > 0)
			matchingNodes = matchingNodes.concat(childMatchingNodes);

	}
	return matchingNodes;
}

function criticalitySelect(Criticality) {
	var text = "<select id='input_Criticality'>";

	text += "<option value='Critical' ";
	if (Criticality == "Critical")
		text += " selected ";
	text += "  >Critical</option>";

	text += "<option value='Major' ";
	if (Criticality == "Major")
		text += " selected ";
	text += "  >Major</option>";

	text += "<option value='Minor' ";
	if (Criticality == "Minor")
		text += " selected ";
	text += "  >Minor</option>";

	text += "</select>";
	return text;
}