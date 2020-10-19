package com.shadley000.intakeTracker3.servlet;

import javax.servlet.http.HttpServletRequest;

/**
 * @author shadl
 *
 */
public class IntakeTrackerRequest {

	public static String REQUEST_KEY_COMMAND = "command";
	public static String REQUEST_KEY_USER = "user";
	public static String REQUEST_KEY_PASSWORD = "password";
	public static String REQUEST_KEY_ROOTID = "rootId";

	public static String REQUEST_KEY_NODEID = "nodeId";
	public static String REQUEST_KEY_TITLE = "title";
	public static String REQUEST_KEY_DETAILS = "details";
	public static String REQUEST_KEY_PO = "po";
	public static String REQUEST_KEY_REFERENCE_INFO = "referenceInfo";
	public static String REQUEST_KEY_DELIVERY_DATE = "deliveryDate";
	public static String REQUEST_KEY_COMPLETION_DATE = "completionDate";
	
	public static String REQUEST_KEY_STATUS = "status";
	public static String REQUEST_KEY_CRITICALITY = "criticality";
	
	private String command = null;
	private String login = null;
	private String password = null;
	private String rootId = null;
	private String nodeId = null;
	private String title = null;
	private String details = null;

	private String po = null;
	private String referenceInfo = null;
	private String deliveryDate = null;
	private String completionDate = null;
	private String status = null;
	private String criticality = null;

	public IntakeTrackerRequest(HttpServletRequest request) {
		command = request.getParameter(REQUEST_KEY_COMMAND);
		login = request.getParameter(REQUEST_KEY_USER);
		password = request.getParameter(REQUEST_KEY_PASSWORD);
		rootId = request.getParameter(REQUEST_KEY_ROOTID);
		nodeId = request.getParameter(REQUEST_KEY_NODEID);
		title = request.getParameter(REQUEST_KEY_TITLE);
		details = request.getParameter(REQUEST_KEY_DETAILS);

		po = request.getParameter(REQUEST_KEY_PO);
		referenceInfo = request.getParameter(REQUEST_KEY_REFERENCE_INFO);
		deliveryDate = request.getParameter(REQUEST_KEY_DELIVERY_DATE);
		completionDate = request.getParameter(REQUEST_KEY_COMPLETION_DATE);

		
		status = request.getParameter(REQUEST_KEY_STATUS);
		criticality = request.getParameter(REQUEST_KEY_CRITICALITY);
	}

	public void printToLog() {
		System.out.println("command = " + command);
		System.out.println("login = " + login);
		System.out.println("password = " + password);
		System.out.println("rootId = " + rootId);

		System.out.println("nodeId = " + nodeId);
		System.out.println("title = " + title);
		System.out.println("details = " + details);

		System.out.println("po = " + po);
		System.out.println("referenceInfo = " + referenceInfo);
		System.out.println("deliveryDate = " + deliveryDate);
		System.out.println("completionDate = " + completionDate);
		System.out.println("status = " + status);
		System.out.println("criticality = " + criticality);
	}

	public String getCommand() {
		return command;
	}

	public String getLogin() {
		return login;
	}

	public String getPassword() {
		return password;
	}

	public String getRootId() {
		return rootId;
	}

	public String getNodeId() {
		return nodeId;
	}

	public String getTitle() {
		return title;
	}

	public String getDetails() {
		return details;
	}

	public String getPo() {
		return po;
	}

	public String getReferenceInfo() {
		return referenceInfo;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public String getCompletionDate() {
		return completionDate;
	}

	public String getStatus() {
		return status;
	}

	public String getCriticality() {
		return criticality;
	}

}
