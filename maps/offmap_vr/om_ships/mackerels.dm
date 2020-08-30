// Compile in the map for CI testing if we're testing compileability of all the maps
#if MAP_TEST
#include "mackerel_sh.dmm"
#include "mackerel_lc.dmm"
#include "mackerel_hc.dmm"
#endif

// Map template for spawning the shuttle
/datum/map_template/om_ships/mackerel_stationhopper
	name = "OM Ship - Mackerel Stationhopper (new Z)"
	desc = "A small personnel transport shuttle."
	mappath = 'mackerel_sh.dmm'
	annihilate = TRUE

/datum/map_template/om_ships/mackerel_lightcargo
	name = "OM Ship - Mackerel Light Cargo (new Z)"
	desc = "A small light cargo transport shuttle."
	mappath = 'mackerel_lc.dmm'
	annihilate = TRUE

/datum/map_template/om_ships/mackerel_heavycargo
	name = "OM Ship - Mackerel Heavy Cargo (new Z)"
	desc = "A small secure cargo transport shuttle."
	mappath = 'mackerel_hc.dmm'
	annihilate = TRUE

// The shuttle's area(s)
/area/shuttle/mackerel_sh	
	name = "\improper Mackerel Stationhopper"
	icon_state = "shuttle"
	requires_power = 1
	has_gravity = 0
	
/area/shuttle/mackerel_lc	
	name = "\improper Mackerel Light Cargo"
	icon_state = "shuttle2"
	requires_power = 1
	has_gravity = 0
	
/area/shuttle/mackerel_hc	
	name = "\improper Mackerel Heavy Cargo"
	icon_state = "shuttle3"
	requires_power = 1
	has_gravity = 0

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/mackerel_sh
	name = "short jump console"
	shuttle_tag = "Mackerel Stationhopper"
	req_one_access = list()

/obj/machinery/computer/shuttle_control/explore/mackerel_lc
	name = "short jump console"
	shuttle_tag = "Mackerel Light Cargo"
	req_one_access = list()

/obj/machinery/computer/shuttle_control/explore/mackerel_hc
	name = "short jump console"
	shuttle_tag = "Mackerel Heavy Cargo"
	req_one_access = list()

// The 'shuttle'
/datum/shuttle/autodock/overmap/mackerel_sh
	name = "Mackerel Stationhopper"
	current_location = "omship_spawn_mackerel_sh"
	docking_controller_tag = "mack_sh_docking"
	shuttle_area = list(/area/shuttle/mackerel_sh)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 1

/datum/shuttle/autodock/overmap/mackerel_lc
	name = "Mackerel Light Cargo"
	current_location = "omship_spawn_mackerel_lc"
	docking_controller_tag = "mack_lc_docking"
	shuttle_area = list(/area/shuttle/mackerel_lc)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 1

/datum/shuttle/autodock/overmap/mackerel_hc
	name = "Mackerel Heavy Cargo"
	current_location = "omship_spawn_mackerel_hc"
	docking_controller_tag = "mack_hc_docking"
	shuttle_area = list(/area/shuttle/mackerel_hc)
	defer_initialisation = TRUE //We're not loaded until an admin does it
	fuel_consumption = 1.25

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/mackerel_sh
	name = "ITV Mackerel I"
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_mackerel_sh"
	shuttle_type = /datum/shuttle/autodock/overmap/mackerel_sh

/obj/effect/shuttle_landmark/shuttle_initializer/mackerel_lc
	name = "ITV Mackerel II"
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_mackerel_lc"
	shuttle_type = /datum/shuttle/autodock/overmap/mackerel_lc

/obj/effect/shuttle_landmark/shuttle_initializer/mackerel_hc
	name = "ITV Mackerel III"
	base_area = /area/space
	base_turf = /turf/space
	landmark_tag = "omship_spawn_mackerel_hc"
	shuttle_type = /datum/shuttle/autodock/overmap/mackerel_hc

// The 'ship'
/obj/effect/overmap/visitable/ship/landable/mackerel_sh
	scanner_name = "Mackerel-class Transport"
	scanner_desc = @{"[i]Registration[/i]: ITV Phish Phlake
[i]Class[/i]: Small Shuttle
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Small private vessel"}
	color = "#3366FF"
	vessel_mass = 1000
	vessel_size = SHIP_SIZE_TINY
	shuttle = "Mackerel Stationhopper"

/obj/effect/overmap/visitable/ship/landable/mackerel_lc
	scanner_name = "Mackerel-class Transport"
	scanner_desc = @{"[i]Registration[/i]: ITV Phishy Business
[i]Class[/i]: Small Shuttle
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Small private vessel"}
	color = "#0099FF"
	vessel_mass = 1000
	vessel_size = SHIP_SIZE_TINY
	shuttle = "Mackerel Light Cargo"

/obj/effect/overmap/visitable/ship/landable/mackerel_hc
	scanner_name = "Mackerel-class Transport"
	scanner_desc = @{"[i]Registration[/i]: ITV Phish Pharma
[i]Class[/i]: Small Shuttle
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Small private vessel"}
	color = "#33CCCC"
	vessel_mass = 1500
	vessel_size = SHIP_SIZE_TINY
	shuttle = "Mackerel Heavy Cargo"
