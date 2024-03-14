MESSAGE:New( "ZonePlayground", 35, "INFO" ):ToAll()

local polygon = GROUP:FindByName('HamFront-1')
local vanguard = GROUP:FindByName('Blue_Vanguard')

local zone = ZONE_POLYGON:New( "Polygon A", polygon )

local zone_vec2 = zone:GetVec2()

MESSAGE:New( tostring(zone_vec2.x), 35, "Zone X" ):ToAll()
MESSAGE:New( tostring(zone_vec2.y), 35, "Zone Y" ):ToAll()



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