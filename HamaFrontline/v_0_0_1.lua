MESSAGE:New( "HamaFrontline v_0_0_1", 35, "INFO" ):ToAll()

--assert(loadfile("D:\\MissionBuilding\\JackdawsServer\\HamaFrontline\\zone_playground.lua"))()

-- Define Zones - All Zones should start with HamFront
local frontline_zone_group1 = GROUP:FindByName('HamFront-1')
local frontline_zone_1 = ZONE_POLYGON:New( "Frontline Zone 1", frontline_zone_group1)
frontline_zone_1:SmokeZone(SMOKECOLOR.White, 18)

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

-- Designate the route!

local function set_random_dest(group, origin)
    local random_point = frontline_zone_1:GetRandomPointVec2()
    local random_coord = COORDINATE:NewFromVec2(random_point)
    random_point:SmokeBlue() -- Mark it on the map delete in the future!
    MESSAGE:New( tostring(random_point.x), 35, "Zone X" ):ToAll()
    MESSAGE:New( tostring(random_point.y), 35, "Zone Y" ):ToAll()
    group:RouteGroundOnRoad(random_coord, 15, 3)

end

local function on_spawn(group)
    local current_position = group:GetCoordinate()
    --set_supression_red(group)
    set_random_dest(group, current_position)
end

Spawn_Red_Light = SPAWN:New(templates_red_ground_log[1])
    :InitLimit(50, 0)
    :InitRandomizeTemplate( templates_red_main )
    :OnSpawnGroup(on_spawn)
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