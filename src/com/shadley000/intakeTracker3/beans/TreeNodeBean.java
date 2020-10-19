package com.shadley000.intakeTracker3.beans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class TreeNodeBean implements Serializable {

	private static final long serialVersionUID = 1L;

	String treeNodeId;
	String treeNodeParentId;
	String treeNodeRootId;
	String treeNodeType;

	String treeNodeName;

	Set<TreeNodeBean> children = new HashSet<TreeNodeBean>();
	Map<String, String> parameters = new HashMap<String, String>();

	public TreeNodeBean() {
	}

	public TreeNodeBean(ResultSet rs) throws SQLException {
		setTreeNodeId(rs.getString("TreeNodeId"));
		setTreeNodeParentId(rs.getString("TreeNodeParentId"));
		setTreeNodeName(rs.getString("TreeNodeName"));
		setTreeNodeType(rs.getString("TreeNodeType"));
		setTreeNodeRootId(rs.getString("TreeNodeRootId"));
	}

	public String getTreeNodeType() {
		return treeNodeType;
	}

	public void setTreeNodeType(String treeNodeType) {
		this.treeNodeType = treeNodeType;
	}

	public String getTreeNodeRootId() {
		return treeNodeRootId;
	}

	public void setTreeNodeRootId(String treeNodeRootId) {
		this.treeNodeRootId = treeNodeRootId;
	}

	public String getTreeNodeId() {
		return treeNodeId;
	}

	public void setTreeNodeId(String treeNodeId) {
		this.treeNodeId = treeNodeId;
	}

	public String getTreeNodeParentId() {
		return treeNodeParentId;
	}

	public void setTreeNodeParentId(String treeNodeParentId) {
		this.treeNodeParentId = treeNodeParentId;
	}

	public String getTreeNodeName() {
		return treeNodeName;
	}

	public void setTreeNodeName(String treeNodeName) {
		this.treeNodeName = treeNodeName;
	}

	public void addChild(TreeNodeBean child) {
		children.add(child);
	}

	public void setParameter(String name, String value) {
		parameters.put(name, value);
	}

	public String getParameter(String name) {
		return parameters.get(name);
	}
}
