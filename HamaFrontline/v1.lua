MESSAGE:New( "HamaFrontline v01", 35, "INFO" ):ToAll()

-- Templategroups RED
local templates_gound_log = {'RedGroundLog-1'}

local templates_gound_heavy = {'RedGroundHeavy-1'}

local templates_ground_light = {'RedGroundLight-1'}

-- ################### --

Spawn_Light = SPAWN:New(templates_ground_light[1])
Spawn_Light:Spawn()

MESSAGE:New( "HamaFrontline v01 - COMPLETED", 35, "INFO" ):ToAll()
