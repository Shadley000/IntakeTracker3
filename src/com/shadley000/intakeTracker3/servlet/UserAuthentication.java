package com.shadley000.intakeTracker3.servlet;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.shadley000.intakeTracker3.utils.NameValuePair;

public class UserAuthentication implements IConstants, ISQL {

	public static UserSessionBean isUserValidated(Connection connection,IntakeTrackerRequest intakeRequest,
			String ipAddress) throws SQLException {
		if (intakeRequest.getLogin() == null || intakeRequest.getPassword() == null)
			return null;

		UserSessionBean userSessionBean = null;

		PreparedStatement stmt = connection.prepareStatement(SQL_LOGIN);
		stmt.setString(1, intakeRequest.getLogin());
		stmt.setString(2, intakeRequest.getPassword());
		stmt.setString(3, intakeRequest.getRootId());

		ResultSet resultSet = stmt.executeQuery();

		Set<String> roles = new HashSet<String>();

		while (resultSet.next()) {
			String intakeUserId = resultSet.getString("IntakeUserId");
			String intakeRoleName = resultSet.getString("IntakeRoleName");
			String userName = resultSet.getString("UserName");
			if (userSessionBean == null) {
				userSessionBean = new UserSessionBean();
				userSessionBean.setId(intakeUserId);
				userSessionBean.setRootId(intakeRequest.getRootId());
				userSessionBean.setUserName(userName);
				recordLogin(connection, intakeRequest.getLogin(), ipAddress, true);
			}

			userSessionBean.addRole(intakeRoleName);

		}
		if (userSessionBean == null) {
			recordLogin(connection, intakeRequest.getLogin(), ipAddress, false);
			return null;
		}
		return userSessionBean;
	}

	public static void recordLogin(Connection connection, String login, String ipAddress, boolean isSucessful)
			throws SQLException {

		PreparedStatement stmt = connection.prepareStatement(SQL_RECORDLOGIN);
		stmt.setString(1, login);

		stmt.setString(2, ipAddress);
		if (isSucessful)
			stmt.setInt(3, 1);
		else
			stmt.setInt(3, 0);
		System.out.println("login attempted " + login + " " + ipAddress + " " + isSucessful);
	}

	

}
