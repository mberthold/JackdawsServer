MESSAGE:New( "HamaFrontline v_0_0_1", 35, "INFO" ):ToAll()

assert(loadfile("D:\\MissionBuilding\\JackdawsServer\\HamaFrontline\\zone_playground.lua"))()

-- Define Zones - All Zones should start with HamFront
local poly_groups = GROUP:FindAllByMatching('HamFront')

local ham_front_zones = {}

--for n, group in ipairs(poly_groups) do
 --   ham_front_zones.insert(group)
--end



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

local function set_supression_red(group)
    --MESSAGE:New( "Rowing with one hand!", 35, "INFO" ):ToAll()
    if group then
        
        MESSAGE:New( group.GroupName, 35, "INFO" ):ToAll()
        local supression = SUPPRESSION:New(group)
        :Takecover(true)
        :Fallback(true)
        :SetFallbackDistance(200)
        :__Start(5)
        --MESSAGE:New( 'Did the suppression... hopefully.', 35, "INFO" ):ToAll()
    else 
        if group == nil then
            MESSAGE:New( 'group is nil!', 35, "INFO" ):ToAll()
        end
    end
end

Spawn_Red_Light = SPAWN:New(templates_red_ground_log[1])
    :InitLimit(50, 0)
    :InitRandomizeRoute( 1, 1, 3000 )
    :InitRandomizeTemplate( templates_red_main )
    :OnSpawnGroup(set_supression_red)
    :SpawnScheduled(60, .5)

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
    :InitRandomizeRoute( 1, 1, 3000 )
    :InitRandomizeTemplate( templates_blue_main )
    :SpawnScheduled(60, .5)


MESSAGE:New( "HamaFrontline v01 - COMPLETED", 35, "INFO" ):ToAll()