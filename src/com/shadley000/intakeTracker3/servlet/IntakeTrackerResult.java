package com.shadley000.intakeTracker3.servlet;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.shadley000.intakeTracker3.beans.TreeNodeBean;

public class IntakeTrackerResult implements Serializable {

	private static final long serialVersionUID = 1L;

	private String isAuthorized;
	private TreeNodeBean root;
	private String message;
	private String userName;
	private String selectedNode;
	private Set<String> roles = new HashSet<String>();
	
	public String getSelectedNode() {
		return selectedNode;
	}
	public void setSelectedNode(String selectedNode) {
		this.selectedNode = selectedNode;
	}
	
	public String getIsAuthorized() {
		return isAuthorized;
	}
	public void setIsAuthorized(String isAuthorized) {
		this.isAuthorized = isAuthorized;
	}
	public TreeNodeBean getRoot() {
		return root;
	}
	public void setRoot(TreeNodeBean root) {
		this.root = root;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Set<String> getRoles() {
		return roles;
	}
	public void setRoles(Set<String> permissions) {
		this.roles = permissions;
	}
	
	
	
}
