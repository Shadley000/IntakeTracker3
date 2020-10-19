/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shadley000.intakeTracker3.servlet;

import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author shadl
 */
public class UserSessionBean {

	private boolean authenticated;

	private String id;
	private String rootId;
	private String userName;
	private Set<String> roles = new HashSet<String>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRootId() {
		return rootId;
	}

	public void setRootId(String rootId) {
		this.rootId = rootId;
	}

	public UserSessionBean() {
	}

	public boolean isAuthenticated() {
		return authenticated;
	}

	public void setAuthenticated(boolean authenticated) {
		this.authenticated = authenticated;
	}

	public void setRoles(Set<String> roles) {
		this.roles = roles;

	}

	public void addRole(String roleId) {
		roles.add(roleId);

	}

	public boolean isRoleEnabled(String roleId) {
		return roles.contains(roleId);
	}

	public boolean containsRole(Set<String> validRoles) {
		return true;
		// Set<String> intersection = new HashSet<String>(roles);
		// intersection.retainAll(validRoles);
		// return !intersection.isEmpty();
	}

	public Set<String> getRoles() {
		return roles;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;

	}

}
