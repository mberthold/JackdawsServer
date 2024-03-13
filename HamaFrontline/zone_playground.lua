MESSAGE:New( "ZonePlayground", 35, "INFO" ):ToAll()

local polygon = GROUP:FindByName('HamFront-1')
local vanguard = GROUP:FindByName('Blue_Vanguard')

local zone = ZONE_POLYGON:New( "Polygon A", polygon )

local zone_vec2 = zone:GetVec2()

MESSAGE:New( tostring(zone_vec2.x), 35, "Zone X" ):ToAll()
MESSAGE:New( tostring(zone_vec2.y), 35, "Zone Y" ):ToAll()