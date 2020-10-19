package com.shadley000.intakeTracker3.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import com.google.gson.Gson;
import com.shadley000.intakeTracker3.beans.TreeNodeBean;
import com.shadley000.intakeTracker3.utils.SQLConnect;

/**
 * Servlet implementation class IntakeTrackerServlet
 */
@WebServlet("/IntakeTrackerServlet")
public class IntakeTrackerServlet extends HttpServlet implements IConstants, ISQL {
	private static final long serialVersionUID = 1L;
	SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss z");

	SQLConnect sqlConnect = null;

	public IntakeTrackerServlet() {
		sqlConnect = new SQLConnect();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("IntakeTrackerServlet:processRequest");

		HttpSession session = request.getSession();

		UserSessionBean userSessionBean = (UserSessionBean) session.getAttribute(SESSION_KEY_SESSIONBEAN);

		Connection connection = null;
		IntakeTrackerResult result = null;
		IntakeTrackerRequest intakeRequest = new IntakeTrackerRequest(request);
		intakeRequest.printToLog();

		try {
			connection = sqlConnect.getConnection();

			if (userSessionBean == null) {
				String ipAddress = request.getRemoteAddr();

				userSessionBean = UserAuthentication.isUserValidated(connection, intakeRequest, ipAddress);
				if (userSessionBean != null) {
					session.setAttribute(SESSION_KEY_SESSIONBEAN, userSessionBean);
				}
			}
			if (userSessionBean != null) {

				if (intakeRequest.getCommand() == null) {
					result = new IntakeTrackerResult();
					loadData(request, userSessionBean, connection, result);
				} else if (intakeRequest.getCommand().equals(COMMAND_LOGOUT)) {
					result = logout(session, userSessionBean);
				} else {
					if (intakeRequest.getCommand().equals(COMMAND_ACCEPTANCE_CLOSE)) {
						result = closeNode(connection, intakeRequest, userSessionBean);
					} else if (intakeRequest.getCommand().equals(COMMAND_ACCEPTANCE_EDIT)) {
						result = addComment(connection, intakeRequest, userSessionBean);
					} else if (intakeRequest.getCommand().equals(COMMAND_DEFICIENCY_CLOSE)) {
						result = closeNode(connection, intakeRequest, userSessionBean);
					} else if (intakeRequest.getCommand().equals(COMMAND_DEFICIENCY_EDIT)) {
						result = addComment(connection, intakeRequest, userSessionBean);
					} else if (intakeRequest.getCommand().equals(COMMAND_DEFICIENCY_ADD)) {
						result = addDeficiency(connection, intakeRequest, userSessionBean);
					} else if (intakeRequest.getCommand().equals(COMMAND_DEFICIENCY_CRITICALITY_UPDATE)) {
						result = updateCriticality(connection, intakeRequest, userSessionBean);
					} else {
						result = new IntakeTrackerResult();
					} 
					loadData(request, userSessionBean, connection, result);

				}

			} else {
				result = createErrorResult("Login failed", null);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			result = createErrorResult("Server Error:"+ex.toString(), ex);
		} catch (Exception ex) {
			result = createErrorResult(ex.toString(), ex);
		} 

		try {
			if (connection != null && connection.isValid(30))
				connection.close();

		} catch (Exception ex) {
			result = createErrorResult(ex.toString(), ex);
		} 
 
		Gson gson = new Gson();
		String json = gson.toJson(result);

		response.setContentType("application/json");
		try (PrintWriter out = response.getWriter()) {
			out.write(json);
			// result.write(out);
		}

	}

	private IntakeTrackerResult addDeficiency(Connection connection, IntakeTrackerRequest intakeRequest,
			UserSessionBean userSessionBean) throws Exception {
		IntakeTrackerResult result = new IntakeTrackerResult();
		String user = userSessionBean.getUserName();
		String date = dateTimeFormat.format(new java.util.Date());

		Set<String> validRoles = new HashSet<String>();
		validRoles.add("Inspector");
		validRoles.add("Operator");
		if (userSessionBean.containsRole(validRoles)) {

			TreeNodeBean parentNode = StaticData.loadTreeNodeData(connection, intakeRequest.getNodeId());

			if (parentNode.getTreeNodeType().equals("Equipment")) {
				String treeNodeId = StaticData.addTreeNode(connection, parentNode.getTreeNodeId(),
						intakeRequest.getTitle(), "Deficiency");

				StaticData.addParameter(connection, treeNodeId, "Details", intakeRequest.getDetails());
				StaticData.addParameter(connection, treeNodeId, "Date", date);
				StaticData.addParameter(connection, treeNodeId, "User", user);
				StaticData.addParameter(connection, treeNodeId, "Criticality", intakeRequest.getCriticality());
				StaticData.addParameter(connection, treeNodeId, "Status", "Open");
				StaticData.addParameter(connection, treeNodeId, "Reference", intakeRequest.getReferenceInfo());

				result.setSelectedNode(treeNodeId);
			} else
				throw new Exception("deficiencies can only be attached to equipment");
		} else
			throw new Exception(user + " does not have permissions to add a deficiency");
		return result;
	}

	private IntakeTrackerResult updateCriticality(Connection connection, IntakeTrackerRequest intakeRequest,
			UserSessionBean userSessionBean) throws Exception {
		IntakeTrackerResult result = new IntakeTrackerResult();
		String user = userSessionBean.getUserName();
		String date = dateTimeFormat.format(new java.util.Date());

		Set<String> validRoles = new HashSet<String>();
		validRoles.add("Inspector");
		validRoles.add("Operator");
		if (userSessionBean.containsRole(validRoles)) {
			TreeNodeBean node = StaticData.loadTreeNodeData(connection, intakeRequest.getNodeId());

			if (node.getTreeNodeType().equals("Deficiency")) {

				StaticData.updateParameter(connection, intakeRequest.getNodeId(), "Criticality",
						intakeRequest.getCriticality());

				addAutomaticComment(connection, intakeRequest, userSessionBean,
						"Criticality changed to " + intakeRequest.getCriticality()+ " by " + user + " at " + date,"");
				result.setSelectedNode(intakeRequest.getNodeId());
			} else
				throw new Exception("only deficiencies have criticality");
		} else
			throw new Exception(user + " does not have permissions to update criticaliy");
		return result;
	}

	private IntakeTrackerResult addComment(Connection connection, IntakeTrackerRequest intakeRequest,
			UserSessionBean userSessionBean) throws Exception {
		IntakeTrackerResult result = new IntakeTrackerResult();
		String user = userSessionBean.getUserName();
		String date = dateTimeFormat.format(new java.util.Date());

		Set<String> validRoles = new HashSet<String>();
		validRoles.add("Inspector");
		validRoles.add("Operator");
		validRoles.add("Contractor");
		if (userSessionBean.containsRole(validRoles)) {
			TreeNodeBean node = StaticData.loadTreeNodeData(connection, intakeRequest.getNodeId());

			if (node.getTreeNodeType().equals("Deficiency") || node.getTreeNodeType().equals("Acceptance")) {
				String treeNodeId = StaticData.addTreeNode(connection, intakeRequest.getNodeId(),
						intakeRequest.getTitle(), "Status");
				StaticData.addParameter(connection, treeNodeId, "Details", intakeRequest.getDetails());
				StaticData.addParameter(connection, treeNodeId, "Date", date);
				StaticData.addParameter(connection, treeNodeId, "User", user);
				StaticData.addParameter(connection, treeNodeId, "PO", intakeRequest.getPo());
				StaticData.addParameter(connection, treeNodeId, "DeliveryDate", intakeRequest.getDeliveryDate());
				StaticData.addParameter(connection, treeNodeId, "CompletionDate", intakeRequest.getCompletionDate());
				result.setSelectedNode(intakeRequest.getNodeId());
			} else
				throw new Exception("Only acceptance and deficiency nodes have comments : " + node.getTreeNodeType());
		} else

		{
			throw new Exception(user + " does not have permissions to add comments");
		}
		return result;
	}

	private void addAutomaticComment(Connection connection, IntakeTrackerRequest intakeRequest,
			UserSessionBean userSessionBean, String title, String details) throws SQLException {
		String user = userSessionBean.getUserName();
		String date = dateTimeFormat.format(new java.util.Date());
		title = date + " : " + title;

		String treeNodeId = StaticData.addTreeNode(connection, intakeRequest.getNodeId(), title, "Status");
		StaticData.addParameter(connection, treeNodeId, "Details", details);
		StaticData.addParameter(connection, treeNodeId, "Date", date);
		StaticData.addParameter(connection, treeNodeId, "User", user);

	}

	private IntakeTrackerResult closeNode(Connection connection, IntakeTrackerRequest intakeRequest,
			UserSessionBean userSessionBean) throws Exception {
		IntakeTrackerResult result = new IntakeTrackerResult();
		String user = userSessionBean.getUserName();
		String date = dateTimeFormat.format(new java.util.Date());

		Set<String> validRoles = new HashSet<String>();
		validRoles.add("Administrator");
		validRoles.add("Inspector");
		validRoles.add("Operator");
		if (userSessionBean.containsRole(validRoles)) {
			TreeNodeBean node = StaticData.loadTreeNodeData(connection, intakeRequest.getNodeId());

			if (node.getTreeNodeType().equals("Deficiency") || node.getTreeNodeType().equals("Acceptance")) {
				StaticData.updateParameter(connection, intakeRequest.getNodeId(), "Status", "Closed");
				StaticData.updateParameter(connection, intakeRequest.getNodeId(), "User", user);
				StaticData.updateParameter(connection, intakeRequest.getNodeId(), "Date", date);

				addAutomaticComment(connection, intakeRequest, userSessionBean, "Closed by " + user+ " at " + date,	"" );
				result.setSelectedNode(intakeRequest.getNodeId());
			} else
				throw new Exception("Only acceptance and deficiency nodes can be closed");
		} else
			throw new SecurityException();
		return result;
	}

	private IntakeTrackerResult createErrorResult(String message, Exception e) {
		Logger.getLogger(IntakeTrackerServlet.class.getName()).log(Level.SEVERE, null, message);
		IntakeTrackerResult result = new IntakeTrackerResult();
		result.setMessage(message);
		if (e != null)
			e.printStackTrace();
		return result;
	}

	private void loadData(HttpServletRequest request, UserSessionBean userSessionBean, Connection connection,
			IntakeTrackerResult result) throws JSONException, SQLException {

		result.setRoot(StaticData.loadTree(connection, userSessionBean.getRootId()));
		result.setIsAuthorized("true");
		result.setUserName(userSessionBean.getUserName());
		result.setRoles(userSessionBean.getRoles());
	}

	public IntakeTrackerResult logout(HttpSession session, UserSessionBean userSessionBean) {
		IntakeTrackerResult result = new IntakeTrackerResult();
		System.out.println("Logged out");
		userSessionBean.setAuthenticated(false);
		session.removeAttribute(SESSION_KEY_SESSIONBEAN);
		session.invalidate();
		result.setMessage("Logged out");
		result.setIsAuthorized("false");
		return result;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
