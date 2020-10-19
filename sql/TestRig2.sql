
insert into Rig (RigName, CompanyId, Details,RigTypeId) select "TestRig2", c.id , "Sample Jackup", t.id 
from Company c, RigType t 
where CompanyName = "Unknown"
and RigTypeName = "Jackup";

INSERT INTO IntakeRoleToIntakeUser (RigId, IntakeRoleId, IntakeUserId) 
	select a.Id, r.Id, u.Id 
    from Rig a, IntakeRole r, IntakeUser u 
	where	r.RoleName = "Administrator"	
		AND u.login = "shadley"
        AND RigName = "TestRig2";
        
INSERT INTO IntakeRoleToIntakeUser (RigId, IntakeRoleId, IntakeUserId) 
	select a.Id, r.Id, u.Id 
    from Rig a, IntakeRole r, IntakeUser u 
	where	r.RoleName = "Inspector"	
		AND u.login = "shadley"
        AND RigName = "TestRig2";
        
INSERT INTO IntakeRoleToIntakeUser (RigId, IntakeRoleId, IntakeUserId) 
	select a.Id, r.Id, u.Id 
    from Rig a, IntakeRole r, IntakeUser u 
	where	r.RoleName = "Guest"	
		AND u.login = "guest"
        AND RigName = "TestRig2";
        
        
Insert into Equipment (EquipmentModelId, RigId, LocationId, EquipmentName, SerialNumber) SELECT t.Id, r.Id, l.Id, "Moonpool Manrider Winch", 	"S/N 0029" 	FROM EquipmentModel t, Rig r, Location l WHERE r.RigName = "TestRig2" and l.LocationName = "Moonpool" and t.Model = "HL-MR-150-110M-HR";
Insert into Equipment (EquipmentModelId, RigId, LocationId, EquipmentName, SerialNumber) SELECT t.Id, r.Id, l.Id, "Drillfloor Manrider Winch", 	"S/N 0030" 	FROM EquipmentModel t, Rig r, Location l WHERE r.RigName = "TestRig2" and l.LocationName = "Drill Floor" and t.Model = "HL-MR-150-110M-HR";

   
Insert into IntakePointStatus(RigId, EquipmentId,	IntakePointId,	PointStateId,	IntakeUserId,	DateCreated)
	select e.RigId, e.Id, p.Id, s.Id, u.Id, now()
    from  Rig r, Equipment e, EquipmentModel m, EquipmentClass c, IntakePoint p, PointState s, IntakeUser u
    Where r.RigName ="TestRig2"
    AND r.Id = e.RigId
    and e.EquipmentModelId = m.Id
    and m.EquipmentClassId = c.Id
    and c.Id = p.EquipmentClassId
    AND s.Symbol = "OPEN"
    AND u.Login = "default";
   
insert into Deficiency (RigId, EquipmentId, Title) 
	SELECT e.RigId, e.Id, "Winch is very dirty"
    FROM Rig r, Equipment e
    Where r.RigName = "TestRig2"
    and e.RigId = r.Id
     and e.EquipmentName = "Drillfloor Manrider Winch";
    
Insert into DeficiencyStatus( RigId, DeficiencyId, CriticalityId, PointStateId ,IntakeUserId, DateCreated, Details, ReferenceInfo,isLatest)
	SELECT r.id, d.Id, c.Id, s.Id, u.Id, now(), "really?  this thing is a mess", "housekeeping",1
    FROM Rig r, PointState s, Criticality c, IntakeUser u, Deficiency d
    WHERE r.RigName ="TestRig2"
     and d.RigId = r.Id
     AND s.Symbol = "OPEN"
    AND c.Symbol = "MAJOR"
    AND u.Login = "dlovre"
    and d.Title = "Winch is very dirty";
  