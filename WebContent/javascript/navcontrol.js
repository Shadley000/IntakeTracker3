
function displayLogin(data, status) {
	console.log("displayLogin");
	console.log(data);
	GLOBAL_data = data;
	if (data.isAuthorized == 'true') {
		console.log("isAuthorized");

		$("#loggedout").hide();
		$("#loggedin").show();
		
		summary_display();
		//$("#div_report").html("<h1>Welcome</h1>");

	} else {
		console.log("!isAuthorized");
		$("#div_report").html("<h1>isAuthorized = false err1.0</h1>");
	}

}
function displayLogout(data, status) {
	console.log("displayLogout");

	$("#loggedout").show();
	$("#loggedin").hide();
	$("#password").val("");
	$("#div_report").html("<h1>Please login</h1>");
}

// //////////////////////////////////////////////////////////////////////////////
function clickLogin() {
	console.log("clickLogin");
	var data = {
		"command" : "home",
		"user" : $("#user").val(),
		"password" : $("#password").val(),
		"rootId" : $("#select_rootId").val()
	};
	$.post(servletURL, data, displayLogin);
}
function clickLogout() {
	console.log("clickLogout");
	var data = {
		"command" : "logout"
	};
	$.post(servletURL, data, displayLogout);
}

function clickHome() {
	console.log("clickHome");
	var data = {
		"command" : "Home",
		"rootId" : $("#select_rootId").val()
	};
	$.post(servletURL, data, home_display);
}

function clickSummary() {
	console.log("clickSummary");
	summary_display();
}

function clickDeficiencies() {
	console.log("clickDeficiencies");
	legacyDeficiency_Display();
}
function clickAcceptance() {
	console.log("clickAcceptance");
}

// //////////////////////////////////////////////////////////////////////////////
$(document).ready(function() {
	$("#button_login").click(clickLogin);
	$("#button_logout").click(clickLogout);
	$("#button_Home").click(clickHome);
	$("#button_Summary").click(clickSummary);
	$("#button_Work").click(work_display);
	$("#button_Deficiencies").click(clickDeficiencies);
	$("#button_Acceptance").click(clickAcceptance);

});
