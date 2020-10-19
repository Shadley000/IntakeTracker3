var servletURL = "IntakeTrackerServlet";

function home_displayNode(node1) {
	 //console.log("displayNode " + node1.treeNodeName);
	var text = "<UL style='list-style-type: none'>";
	text += "<LI id='node_" + node1.treeNodeId + "'>" + node1.treeNodeName + "</LI>";
	for (j in node1.children) {
		// text1 += "<LI>" + child1.treeNodeName + "</LI>";
		text += "<LI>";
		text += home_displayNode(node1.children[j]);
		text += "</LI>";
	}
	text += "</UL>";
	return text;
}

function home_display(data, status) {
	console.log("displayHome");
	console.log(data);
	GLOBAL_data = data;
	var text = "";

	if (data.isAuthorized != 'true') {
		text = "<h1>Not isAuthorized err2.0</h1>";
	} else if (data.message != null) {
		text += "<h1>Home Page Error</h1>";
		text += "<h2>" + data.message + "</h2>";
	} else if (data.root == null) {
		text += "<h1>Home</h1>";
		text += "<P>no root</P>";
	} else {
		text += "<h1>Home</h1>";
		text += home_displayNode( data.root);
	}

	$("#div_report").html(text);
}
