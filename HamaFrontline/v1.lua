MESSAGE:New( "HamaFrontline v01", 35, "INFO" ):ToAll()

-- Templategroups RED
local templates_red_ground_log = {'RedGroundLog-1'}

local templates_red_ground_heavy = {'RedGroundHeavy-1'}

local templates_red_ground_light = {'RedGroundLight-1'}

-- ################### --

-- Main red push

-- generate template table to be used 
local templates_red_main = {}
for n, x in ipairs(templates_red_ground_heavy) do
    table.insert(templates_red_main, x)
end
for n, x in ipairs(templates_red_ground_light) do
    table.insert(templates_red_main, x)
end
for n, x in ipairs(templates_red_ground_log) do
    table.insert(templates_red_main, x)
end

Spawn_Red_Light = SPAWN:New(templates_red_ground_log[1])
    :InitLimit(50, 0)
    :InitRandomizeRoute( 1, 1, 5000 )
    :InitRandomizeTemplate( templates_red_main )
    :SpawnScheduled(5, .5)

-- ################### --

-- Templategroups BLLUE
local templates_blue_ground_log = {'BlueGroundLog-1'}

local templates_blue_ground_heavy = {'BlueGroundHeavy-1'}

local templates_blue_ground_light = {'BlueGroundLight-1'}

-- Main blue push

-- generate template table to be used 
local templates_blue_main = {}
for n, x in ipairs(templates_blue_ground_heavy) do
    table.insert(templates_blue_main, x)
end
for n, x in ipairs(templates_blue_ground_light) do
    table.insert(templates_blue_main, x)
end
for n, x in ipairs(templates_blue_ground_log) do
    table.insert(templates_blue_main, x)
end

Spawn_Blue_Light = SPAWN:New(templates_blue_ground_log[1])
    :InitLimit(50, 0)
    :InitRandomizeRoute( 1, 1, 5000 )
    :InitRandomizeTemplate( templates_blue_main )
    :SpawnScheduled(5, .5)


MESSAGE:New( "HamaFrontline v01 - COMPLETED", 35, "INFO" ):ToAll()