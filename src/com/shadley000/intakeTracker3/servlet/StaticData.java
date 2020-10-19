package com.shadley000.intakeTracker3.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.shadley000.intakeTracker3.beans.TreeNodeBean;
import com.shadley000.intakeTracker3.utils.NameValuePair;

public class StaticData implements IConstants, ISQL {

	static public String addTreeNode(Connection connection, String treeNodeParentId, String treeNodeName,
			String treeNodeType) throws SQLException {
		PreparedStatement statement = connection.prepareStatement(SQL_ADD_TREENODE);
		statement.setString(1, treeNodeName);
		statement.setString(2, treeNodeType);
		statement.setString(3, treeNodeParentId);
		statement.execute();

		return findTreeNode(connection, treeNodeParentId, treeNodeName, treeNodeType);
	}

	static public String findTreeNode(Connection connection, String treeNodeParentId, String treeNodeName,
			String treeNodeType) throws SQLException {
		PreparedStatement statement = connection.prepareStatement(SQL_GET_TREENODE);
		statement.setString(1, treeNodeParentId);
		statement.setString(2, treeNodeName);
		statement.setString(3, treeNodeType);
		ResultSet rs = statement.executeQuery();

		if (rs.next()) {
			return rs.getString("TreeNodeId");

		}
		return null;
	}

	static public TreeNodeBean loadTreeNodeData(Connection connection, String treeNodeId) throws SQLException {
		PreparedStatement statement = connection.prepareStatement(SQL_GET_TREENODEDATA);
		statement.setString(1, treeNodeId);
		ResultSet rs = statement.executeQuery();
		TreeNodeBean treeNodeBean = null;
		if (rs.next()) {
			treeNodeBean = new TreeNodeBean(rs);
			statement = connection.prepareStatement(SQL_GET_A_TREE_NODES_PARAMETERS);
			statement.setString(1, treeNodeId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				String treeNodeParameterName = resultSet.getString("TreeNodeParameterName");
				String treeNodeParameterValue = resultSet.getString("TreeNodeParameterValue");
				treeNodeBean.setParameter(treeNodeParameterName, treeNodeParameterValue);
			}
		}

		return treeNodeBean;
	}

	static public void addParameter(Connection connection, String treeNodeId, String name, String value)
			throws SQLException {
		if (name != null && name.trim().length() > 0) {

			if (value == null)
				value = "";
			value = value.trim();

			PreparedStatement statement = connection.prepareStatement(SQL_ADD_PARAMETER);
			statement.setString(1, name);
			statement.setString(2, value);
			statement.setString(3, treeNodeId);
			statement.execute();
		}

	}

	static public void updateParameter(Connection connection, String treeNodeId, String name, String value)
			throws SQLException {
		PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_PARAMETER);
		statement.setString(1, value);
		statement.setString(2, name);
		statement.setString(3, treeNodeId);
		statement.execute();

	}

	static public TreeNodeBean loadTree(Connection connection, String treeNodeRootId) throws SQLException {
		Map<String, TreeNodeBean> nodeMap = new HashMap<String, TreeNodeBean>();

		TreeNodeBean root = null;
		{
			PreparedStatement stmt = connection.prepareStatement(SQL_GET_TREE_NODES);
			stmt.setString(1, treeNodeRootId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				TreeNodeBean node = new TreeNodeBean(rs);

				nodeMap.put(node.getTreeNodeId(), node);
				if (node.getTreeNodeParentId().equals("1")) {
					root = node;
				}
			}
		}
		for (Iterator<String> it = nodeMap.keySet().iterator(); it.hasNext();) {
			TreeNodeBean child = nodeMap.get(it.next());
			TreeNodeBean parentNode = nodeMap.get((String) child.getTreeNodeParentId());
			parentNode.addChild(child);
			if (child.getTreeNodeId().equals(child.getTreeNodeRootId()))
				root = child;
		}

		{
			PreparedStatement statement = connection.prepareStatement(SQL_GET_TREE_NODES_PARAMETERS);
			statement.setString(1, treeNodeRootId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				String treeNodeId = resultSet.getString("TreeNodeId");
				String treeNodeParameterName = resultSet.getString("TreeNodeParameterName");
				String treeNodeParameterValue = resultSet.getString("TreeNodeParameterValue");
				TreeNodeBean treeNodeBean = (TreeNodeBean) nodeMap.get(treeNodeId);
				treeNodeBean.setParameter(treeNodeParameterName, treeNodeParameterValue);
			}
		}
		return root;
	}
}
