DROP SCHEMA `intaketracker` ;
CREATE SCHEMA `intaketracker` ;

USE `intaketracker` ;
CREATE TABLE IntakeRole (
    IntakeRoleId INT NOT NULL AUTO_INCREMENT,
    IntakeRoleName VARCHAR(32) UNIQUE,
    PRIMARY KEY (IntakeRoleId)
);

CREATE TABLE IntakeUser (
    IntakeUserId INT NOT NULL AUTO_INCREMENT,
    Login VARCHAR(32) UNIQUE,
    UserName VARCHAR(64),
    CompanyName VARCHAR(64),
    EmailAddress VARCHAR(32) UNIQUE,
    UserPassword VARCHAR(32),
    PRIMARY KEY (IntakeUserId)
);

CREATE TABLE LoginLog (
    LoginLogId INT NOT NULL AUTO_INCREMENT,
    Login VARCHAR(32),
    IPAddress VARCHAR(32),
    LoginTime DATETIME,
    IsSuccessfull INT,
    PRIMARY KEY (LoginLogId)
);

CREATE TABLE TreeNodeType (
    TreeNodeTypeId INT NOT NULL AUTO_INCREMENT,
    TreeNodeType VARCHAR(32),
    PRIMARY KEY (TreeNodeTypeId)
);

--------------------------------------------------------------------------

CREATE TABLE TreeNode (
    TreeNodeId INT NOT NULL AUTO_INCREMENT,
    TreeNodeParentId INT NOT NULL,
    TreeNodeRootId INT NOT NULL,
    TreeNodeName VARCHAR(256),
    TreeNodeType Varchar(32),
    PRIMARY KEY (TreeNodeId),
    CONSTRAINT UC_TreeNode UNIQUE (TreeNodeParentId , TreeNodeName , TreeNodeType)
    );

insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeName, TreeNodeType) values (1,1,"Root", "Root");

ALTER table TreeNode Add FOREIGN KEY (TreeNodeParentId)
        REFERENCES TreeNode (TreeNodeId);
ALTER table TreeNode Add FOREIGN KEY (TreeNodeRootId)
        REFERENCES TreeNode (TreeNodeId);        
        
CREATE TABLE TreeNodeParameter (
    TreeNodeParameterId INT NOT NULL AUTO_INCREMENT,
    TreeNodeId INT NOT NULL,
    TreeNodeRootId INT NOT NULL,
    TreeNodeParameterName VARCHAR(64),
    TreeNodeParameterValue VARCHAR(512),
    PRIMARY KEY (TreeNodeParameterId),
    FOREIGN KEY (TreeNodeId)
        REFERENCES TreeNode (TreeNodeId),
    FOREIGN KEY (TreeNodeRootId)
        REFERENCES TreeNode (TreeNodeId),
	CONSTRAINT UC_TreeNodeParameter UNIQUE (TreeNodeId , TreeNodeParameterName)
);

CREATE TABLE IntakeRoleToIntakeUser (
    IntakeRoleToIntakeUserId INT NOT NULL AUTO_INCREMENT,
    TreeNodeId INT NOT NULL,
    IntakeRoleId INT NOT NULL,
    IntakeUserId INT NOT NULL,
    PRIMARY KEY (IntakeRoleToIntakeUserId),
    FOREIGN KEY (IntakeUserId)
        REFERENCES IntakeUser (IntakeUserId),
    FOREIGN KEY (IntakeRoleId)
        REFERENCES IntakeRole (IntakeRoleId),
    CONSTRAINT UC_IntakeRoleToIntakeUser UNIQUE (TreeNodeId , IntakeRoleId , IntakeUserId)
);