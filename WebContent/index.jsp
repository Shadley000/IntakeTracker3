
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.shadley000.intakeTracker3.servlet.ISQL"%>
<%@ page import="com.shadley000.intakeTracker3.utils.SQLConnect"%>
<%@ page import="com.shadley000.intakeTracker3.utils.NameValuePair"%>
<!DOCTYPE html>
<html>
<head>
<title>Intake Tracker 3</title>
<link rel="stylesheet" href="styles.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="javascript/common.js">
	
</script>
<script src="javascript/homepage.js">
	
</script>
<script src="javascript/deficiency.js">
	
</script>
<script src="javascript/adddeficiency.js">
	
</script>
<script src="javascript/legacyDeficiencies.js">
	
</script>
<script src="javascript/acceptance.js">
	
</script>
<script src="javascript/summary.js">
	
</script>

<script src="javascript/work.js">
	
</script>
<script src="javascript/navcontrol.js">
	
</script>

</head>
<body>

	<div id="div_header">
		<h1>Intake Tracker 3</h1>
	</div>
	<div id="div_nav">
		<h2>Navigation</h2>
		<ul id="loggedout" style='list-style-type: none'>
			<li>User <input type='text' id='user' value='guest' /></li>
			<li>Password<input type='password' id='password'
				value='password' /></li>
			<li>Installation<select id='select_rootId'>
					<%
						Connection connection = new SQLConnect().getConnection();
						PreparedStatement stmt = connection.prepareStatement(ISQL.SQL_ALL_DISTINCT_RIGS);
						ResultSet rs = stmt.executeQuery();

						while (rs.next()) {
							String rigId = rs.getString("TreeNodeId");
							String rigName = rs.getString("TreeNodeName");
					%><OPTION value='<%=rigId%>'><%=rigName%></OPTION>
					<%
						}
					%>
			</select></li>
			<li><button id='button_login'>Login</button></li>
		</ul>

		<ul id="loggedin" hidden style='list-style-type: none'>
			<li><button id='button_Home'>Refresh</button></li>
			<li><button id='button_Summary'>Summary</button></li>
			<li><button id='button_Deficiencies'>Deficiencies</button></li>
			<li><BR></li>
			<li><input type="checkbox" id="checkbox_filterClosed" checked> Filter Closed</input></li>
			<li><BR></li>
			<li><button id='button_logout'>Logout</button></li>
			
			
		</ul>
	</div>
	<div id="div_report">
		<h2>Report Section</h2>
	</div>
	<div id="div_footer">
		<P>footer</p>
	</div>
	<div id="div_hidden" hidden></div>

</body>
</html>