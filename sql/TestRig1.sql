insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeName, TreeNodeType) values (1,1,"TestRig1", "Installation");

UPDATE TreeNode SET  TreeNodeRootId = TreeNodeId WHERE  TreeNodeName = 'TestRig1' and TreeNodeParentId = 1;


insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeName, TreeNodeType) values (1,1,"TestRig2", "Installation");

UPDATE TreeNode SET  TreeNodeRootId = TreeNodeId WHERE  TreeNodeName = 'TestRig2' and TreeNodeParentId = 1;


INSERT INTO IntakeRoleToIntakeUser (TreeNodeId, IntakeRoleId, IntakeUserId) 
	select a.TreeNodeId, r.IntakeRoleId, u.IntakeUserId 
    from TreeNode a, IntakeRole r, IntakeUser u 
	where	r.IntakeRoleName = "Administrator"	
		AND u.login = "shadley"
        AND a.TreeNodeParentId = 1;
        
INSERT INTO IntakeRoleToIntakeUser (TreeNodeId, IntakeRoleId, IntakeUserId) 
	select a.TreeNodeId, r.IntakeRoleId, u.IntakeUserId 
    from TreeNode a, IntakeRole r, IntakeUser u 
	where	r.IntakeRoleName = "Inspector"	
		AND u.login = "shadley"
        AND a.TreeNodeParentId = 1;
        
INSERT INTO IntakeRoleToIntakeUser (TreeNodeId, IntakeRoleId, IntakeUserId) 
	select a.TreeNodeId, r.IntakeRoleId, u.IntakeUserId 
    from TreeNode a, IntakeRole r, IntakeUser u 
	where	r.IntakeRoleName = "Guest"	
		AND u.login = "guest"
        AND a.TreeNodeParentId = 1;     
        
INSERT INTO IntakeRoleToIntakeUser (TreeNodeId, IntakeRoleId, IntakeUserId) 
	select a.TreeNodeId, r.IntakeRoleId, u.IntakeUserId 
    from TreeNode a, IntakeRole r, IntakeUser u 
	where	r.IntakeRoleName = "Contractor"	
		AND u.login = "contractor"
        AND a.TreeNodeParentId = 1;   

insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "A - UNIT SPECIFICATION" from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B - GENERAL RIG SPECIFICATIONS"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C - POWER SUPPLY SYSTEMS"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "D - DRILLSTRING EQUIPMENT"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "E - WELL CONTROL/SUBSEA EQUIPMENT"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "F - MUD SYSTEM/BULK SYSTEM"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "G - CASING/CEMENTING EQUIPMENT"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "H - INSTRUMENTATlON/COMMUNlCATlON"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "I - PRODUCTION TEST EQUIPMENT" from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "J - WORKOVER TOOLS"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "K - ACCOMMODATION"  from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "L - SAFETY EQUIPMENT" from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "M - POLLUTION PREVENTION EQUIPMENT" from TreeNode where TreeNodeName = "TestRig1";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "N - ADDITIONAL INFORMATION" from TreeNode where TreeNodeName = "TestRig1";



insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.01 - DERRICK AND SUBSTRUCTURE"   			from TreeNode where TreeNodeName = "B - GENERAL RIG SPECIFICATIONS";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.02 - DRAWWORKS AND ASSOCIATED EQUIPMENT"  	from TreeNode where TreeNodeName = "B - GENERAL RIG SPECIFICATIONS";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.03 - DERRICK HOISTING EQUIPMENT"    		from TreeNode where TreeNodeName = "B - GENERAL RIG SPECIFICATIONS";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.04 - Rotating System"   					from TreeNode where TreeNodeName = "B - GENERAL RIG SPECIFICATIONS";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.05 - Offline Stand building in Derrick"   	from TreeNode where TreeNodeName = "B - GENERAL RIG SPECIFICATIONS";

insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.01.01 - Derrick/Mast"    					from TreeNode where TreeNodeName = "B.01 - DERRICK AND SUBSTRUCTURE" ;
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.01.02 - Racking Platform"    				from TreeNode where TreeNodeName = "B.01 - DERRICK AND SUBSTRUCTURE" ;
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.01.03 - Pipe Handling"   					from TreeNode where TreeNodeName = "B.01 - DERRICK AND SUBSTRUCTURE" ;
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.01.04 - Casing Stabbing Board"   			from TreeNode where TreeNodeName = "B.01 - DERRICK AND SUBSTRUCTURE" ;
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.01.05 - Substructure"    					from TreeNode where TreeNodeName = "B.01 - DERRICK AND SUBSTRUCTURE" ;
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.01.06 - Weather Proofing"    				from TreeNode where TreeNodeName = "B.01 - DERRICK AND SUBSTRUCTURE" ;
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.01.07 - Derrick TV Camera System"    		from TreeNode where TreeNodeName = "B.01 - DERRICK AND SUBSTRUCTURE" ;
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.02.01 - Drawworks"    						from TreeNode where TreeNodeName = "B.02 - DRAWWORKS AND ASSOCIATED EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.02.02 - Auxiliary Brake"  					from TreeNode where TreeNodeName = "B.02 - DRAWWORKS AND ASSOCIATED EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.02.03 - Sandline"  							from TreeNode where TreeNodeName = "B.02 - DRAWWORKS AND ASSOCIATED EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.02.04 - Wireline"  							from TreeNode where TreeNodeName = "B.02 - DRAWWORKS AND ASSOCIATED EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.03.01 - Crown Block"  						from TreeNode where TreeNodeName = "B.03 - DERRICK HOISTING EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.03.02 - Travel Block" 						from TreeNode where TreeNodeName = "B.03 - DERRICK HOISTING EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.03.03 - Hook" 								from TreeNode where TreeNodeName = "B.03 - DERRICK HOISTING EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.03.04 - Swivel" 							from TreeNode where TreeNodeName = "B.03 - DERRICK HOISTING EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.03.05 - Drilling Line" 						from TreeNode where TreeNodeName = "B.03 - DERRICK HOISTING EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.03.06 - Anchor Dead Line" 					from TreeNode where TreeNodeName = "B.03 - DERRICK HOISTING EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.03.07 - Block Guidance System" 				from TreeNode where TreeNodeName = "B.03 - DERRICK HOISTING EQUIPMENT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.04.01 - Rotary Table" 						from TreeNode where TreeNodeName = "B.04 - Rotating System";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.04.02 - Master Bushings"  					from TreeNode where TreeNodeName = "B.04 - Rotating System";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.04.03 - Kelly Bushing"  					from TreeNode where TreeNodeName = "B.04 - Rotating System";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.04.04 - Top Drive (DDM)"  					from TreeNode where TreeNodeName = "B.04 - Rotating System";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "B.05.00 - Offline Stand Building in Derrick"	from TreeNode where TreeNodeName = "B.05 - Offline Stand building in Derrick";


insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Loadmaster DJ2000 / Offset Beam Leg" 		from TreeNode where TreeNodeName = "B.01.01 - Derrick/Mast" ;			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "LoadMaster Racking Platform" 				from TreeNode where TreeNodeName = "B.01.02 - Racking Platform" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Loadmaster Pneumatic Adj." 					from TreeNode where TreeNodeName = "B.01.04 - Casing Stabbing Board" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Letourneau" 								from TreeNode where TreeNodeName = "B.01.05 - Substructure" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Pelco CCTV"									from TreeNode where TreeNodeName = "B.01.07 - Derrick TV Camera System" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Lewco LDW3000 HD" 							from TreeNode where TreeNodeName = "B.02.01 - Drawworks" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Baylor 15050 Elmagco" 						from TreeNode where TreeNodeName = "B.02.02 - Auxiliary Brake" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "LoadMaster Crown Block" 					from TreeNode where TreeNodeName = "B.03.01 - Crown Block" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Lewco / TB1000" 							from TreeNode where TreeNodeName =  "B.03.02 - Travel Block";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "NOV/31108Y" 								from TreeNode where TreeNodeName =  "B.03.03 - Hook";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  '1 3/4" wire rope' 							from TreeNode where TreeNodeName =  "B.03.05 - Drilling Line";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Loadmaster LMRDLA-200" 						from TreeNode where TreeNodeName =  "B.03.06 - Anchor Dead Line";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Loadmaster Block dolly & side skid assembly"from TreeNode where TreeNodeName =  "B.03.07 - Block Guidance System";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Lewco L495" 								from TreeNode where TreeNodeName =  "B.04.01 - Rotary Table";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Varco/MPCH" 								from TreeNode where TreeNodeName =  "B.04.02 - Master Bushings";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Lewco LTI/DDTD750-V2" 						from TreeNode where TreeNodeName =  "B.04.04 - Top Drive (DDM)";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "LTI / DDTD-750" 							from TreeNode where TreeNodeName =  "B.04.04 - Top Drive (DDM)";	



insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01 - RIG POWER PLANT"  					from TreeNode where TreeNodeName = "C - POWER SUPPLY SYSTEMS";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.02 - EMERGENCY GENERATOR"  				from TreeNode where TreeNodeName = "C - POWER SUPPLY SYSTEMS";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03 - UPS Systems"  						from TreeNode where TreeNodeName = "C - POWER SUPPLY SYSTEMS";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.04 - Machinery Space Ventilation"		from TreeNode where TreeNodeName = "C - POWER SUPPLY SYSTEMS";

insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.01 - Diesel Engines"   				from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.02 - DC -Generator"   				from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.03 - AC -Generator"   				from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.04 - SCR System"   					from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.05 - VFD System"  					from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.06 - Transformer System"   			from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.07 - Emergency Shutdown"  			from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.08 - Auxilliary Power Supply"  		from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.09 - Compressed Air Systems"  		from TreeNode where TreeNodeName ="C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.01.10 - Air Receivers"  				from TreeNode where TreeNodeName = "C.01 - RIG POWER PLANT";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.02.01 - Engine" 						from TreeNode where TreeNodeName = "C.02 - EMERGENCY GENERATOR";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.02.02 - AC - Generator"  				from TreeNode where TreeNodeName = "C.02 - EMERGENCY GENERATOR";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.02.03 - Emergency Power Supply"   		from TreeNode where TreeNodeName = "C.02 - EMERGENCY GENERATOR";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.01 - UPS for Main Distribution"  	from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.02 - UPS for Drilling VFD"  			from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.03 - UPS for BOP"  					from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.04 - UPS for Drilling Control"  		from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.05 - UPS for PAGA System"  			from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.05 - UPS for ESD System"  			from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.06 - UPS for Heli Deck Light"  		from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.07 - UPS for general use"  			from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.08 - UPS for communications"  		from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.09 - UPS for D/G"  					from TreeNode where TreeNodeName = "C.03 - UPS Systems";
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Organization", "C.03.10 - UPS for mud mixing"  			from TreeNode where TreeNodeName = "C.03 - UPS Systems";


 
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Caterpiller 3516 CHD" 					from TreeNode where TreeNodeName =  "C.01.01 - Diesel Engines";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Kato 6P6.6-3200HR" 						from TreeNode where TreeNodeName =  "C.01.03 - AC -Generator";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "OEM VFD" 								from TreeNode where TreeNodeName =  "C.01.04 - SCR System";			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Olsun K4" 								from TreeNode where TreeNodeName =  "C.01.06 - Transformer System";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Rig Floor / Control Room" 				from TreeNode where TreeNodeName =  "C.01.07 - Emergency Shutdown" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Ingersoll Rand 2545" 					from TreeNode where TreeNodeName = "C.01.09 - Compressed Air Systems" ;			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Domnick Hunter modular desiccant" 		from TreeNode where TreeNodeName =  "C.01.09 - Compressed Air Systems";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Quincy QSI-600 Rotary Screw" 			from TreeNode where TreeNodeName =  "C.01.09 - Compressed Air Systems";	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Domnick Hunter MPXs112/DS" 				from TreeNode where TreeNodeName =  "C.01.09 - Compressed Air Systems";			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Air Pressure Tank 1060 gal Port " 		from TreeNode where TreeNodeName = "C.01.10 - Air Receivers" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Air Pressure Tank 1060 gal Starboard"	from TreeNode where TreeNodeName ="C.01.10 - Air Receivers"  ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Air Pressure Tank 400 gal" 				from TreeNode where TreeNodeName = "C.01.10 - Air Receivers" ;			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Caterpillar 3516 C" 					from TreeNode where TreeNodeName = "C.02.01 - Engine"  ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "KATO / AA27832003" 						from TreeNode where TreeNodeName = "C.02.02 - AC - Generator"  ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Main Engine Room Supply Fan" 			from TreeNode where TreeNodeName = "C.04 - Machinery Space Ventilation" ;			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Main Engine Room Exhaust Fan" 			from TreeNode where TreeNodeName = "C.04 - Machinery Space Ventilation" ;		
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Mud Pump Room Supply Fan" 				from TreeNode where TreeNodeName = "C.04 - Machinery Space Ventilation" ;		
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Mud Pump Room Exhaust Fan" 				from TreeNode where TreeNodeName = "C.04 - Machinery Space Ventilation" ;		
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Equipment",  "Emergency Generator Room Supply Fan	" 	from TreeNode where TreeNodeName =  "C.04 - Machinery Space Ventilation";		


insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Acceptance", "Installation quality"					from TreeNode where TreeNodeName = "Main Engine Room Supply Fan" ;			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Acceptance", "Verify air flow direction"				from TreeNode where TreeNodeName = "Main Engine Room Supply Fan" ;			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Acceptance", "Verfiy minimum deadline wraps"			from TreeNode where TreeNodeName = "Lewco LDW3000 HD" ;			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Acceptance", "Installation quality"					from TreeNode where TreeNodeName = "Caterpiller 3516 CHD" ;			
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Acceptance", "Test Rig Saver"							from TreeNode where TreeNodeName = "Caterpiller 3516 CHD" ;		
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Acceptance", "Verify Gauges are functional"			from TreeNode where TreeNodeName = "Caterpiller 3516 CHD" ;	
insert into TreeNode (TreeNodeParentId, TreeNodeRootId, TreeNodeType, TreeNodeName) SELECT TreeNodeId , TreeNodeRootId , "Acceptance", "check oil quality"						from TreeNode where TreeNodeName = "Caterpiller 3516 CHD" ;		

insert into TreeNodeParameter (TreeNodeId, TreeNodeRootId, TreeNodeParameterName, TreeNodeParameterValue ) 
	SELECT TreeNodeId, TreeNodeRootId , "Status", "Open"						
    from TreeNode
    Where TreeNodeType = "Acceptance";







   
    
    