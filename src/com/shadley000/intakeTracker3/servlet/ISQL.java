package com.shadley000.intakeTracker3.servlet;

public interface ISQL {

	
	public final static String SQL_LOGIN = " Select u.IntakeUserId, r.IntakeRoleId, " + 
			"    r.IntakeRoleName, u.UserName" + 
			" from  IntakeUser u, IntakeRoleToIntakeUser l,   IntakeRole r " + 
			" where l.IntakeUserId = u.IntakeUserId   " + 
			" and l.IntakeRoleId = r.IntakeRoleId " + 
			" and u.Login = ?  " + 
			" and u.UserPassword = ?  " + 
			" and l.TreeNodeId = ?    ";

	public final static String SQL_RECORDLOGIN = "insert into LoginLog (Login,IPAddress, LoginTime, IsSuccessfull)values (?,?,now(),?) ";

	public final static String SQL_ALL_DISTINCT_RIGS = "SELECT t.TreeNodeId, t.TreeNodeName FROM TreeNode t WHERE t.TreeNodeParentId =1 Order by t.TreeNodeName ";

	public final static String SQL_GET_TREE_NODES = "SELECT TreeNodeId, TreeNodeParentId, TreeNodeName, TreeNodeRootId, TreeNodeType from TreeNode where TreeNodeRootId = ? OR TreeNodeId = 1 ORDER BY TreeNodeName";
	public final static String SQL_GET_TREE_NODES_PARAMETERS = "SELECT TreeNodeParameterId, TreeNodeId, TreeNodeParameterName, TreeNodeParameterValue from TreeNodeParameter where TreeNodeRootId = ?";
	public final static String SQL_GET_A_TREE_NODES_PARAMETERS = "SELECT TreeNodeParameterName, TreeNodeParameterValue from TreeNodeParameter where TreeNodeId = ?";

	public final static String SQL_ADD_TREENODE = "INSERT INTO TreeNode (TreeNodeRootId, TreeNodeParentId, TreeNodeName,  TreeNodeType) SELECT TreeNodeRootId,TreeNodeId, ?,  ? FROM TreeNode WHERE TreeNodeId = ?";
	public final static String SQL_GET_TREENODE = "SELECT TreeNodeId from TreeNode WHERE TreeNodeParentId = ? AND  TreeNodeName = ? AND TreeNodeType = ?";
	public final static String SQL_GET_TREENODEDATA = "SELECT TreeNodeId, TreeNodeParentId, TreeNodeName, TreeNodeRootId, TreeNodeType from TreeNode WHERE TreeNodeId = ?";
	
	public final static String SQL_ADD_PARAMETER = "INSERT INTO TreeNodeParameter (TreeNodeId, TreeNodeRootId, TreeNodeParameterName, TreeNodeParameterValue) Select  TreeNodeId, TreeNodeRootId, ?, ? from TreeNode where TreeNodeId = ?";
	public final static String SQL_UPDATE_PARAMETER = "UPDATE TreeNodeParameter SET TreeNodeParameterValue = ? WHERE TreeNodeParameterName = ? AND TreeNodeId = ?";
}
