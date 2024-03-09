---
-- Name: AID-A2A-100 - Demonstration
-- Author: FlightControl
-- Date Created: 30 May 2017



-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
local DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "EWR", "EWR AWACS" } )
DetectionSetGroup:FilterStart()

local Detection = DETECTION_AREAS:New( DetectionSetGroup, 3500000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
A2ADispatcher:SetCommandCenter( HQ_CC )

-- Enable the tactical display panel.
A2ADispatcher:SetTacticalDisplay( false )
A2ADispatcher:SetTacticalMenu( "Dispatchers", "A2A" )

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
CCCPBorderZone = ZONE_POLYGON:New( "BORDER Red", GROUP:FindByName( "BORDER Red" ) )
A2ADispatcher:SetBorderZone( CCCPBorderZone )

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher:SetEngageRadius( 250000 )

-- Setup the squadrons.
A2ADispatcher:SetSquadron( "Aleppo", AIRBASE.Syria.Aleppo, { "CAPRED1" }, 12 )
A2ADispatcher:SetSquadron( "Tabqa", AIRBASE.Syria.Tabqa, { "CAPRED2" }, 12 )
A2ADispatcher:SetSquadron( "Hama", AIRBASE.Syria.Hama, { "CAPRED3" }, 16 )
-- Setup the overhead
A2ADispatcher:SetSquadronOverhead( "Aleppo", 1.00 )
A2ADispatcher:SetSquadronOverhead( "Tabqa", 1.00 )
A2ADispatcher:SetSquadronOverhead( "Hama", 1.00 )
-- Setup the Grouping
A2ADispatcher:SetSquadronGrouping( "Aleppo", 2 )
A2ADispatcher:SetSquadronGrouping( "Tabqa", 2 )
A2ADispatcher:SetSquadronGrouping( "Hama", 2 )
-- Setup the Takeoff methods
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Aleppo" )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Tabqa" )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Hama" )
-- Setup the Landing methods
A2ADispatcher:SetSquadronLandingAtRunway( "Aleppo" )
A2ADispatcher:SetSquadronLandingAtRunway( "Tabqa" )
A2ADispatcher:SetSquadronLandingAtRunway( "Hama" )

-- CAP Squadron execution.

CAPZoneWest = ZONE_POLYGON:New( "CAP West", GROUP:FindByName( "CAP West" ) )
A2ADispatcher:SetSquadronCap( "Hama", CAPZoneWest, 5000, 7000, 600, 700, 800, 900 )
A2ADispatcher:SetSquadronCapInterval( "Hama", 1, 150, 300, 1 )

-- GCI Squadron execution.

A2ADispatcher:SetSquadronGci( "Aleppo", 900, 1200 )
A2ADispatcher:SetSquadronGci( "Tabqa", 900, 1200 )
A2ADispatcher:SetSquadronGci( "Hama", 900, 1200 )

A2ADispatcher:Start()