menu.add_feature("Teleport - Waypoint", "action", 0, function(f)
	if player.is_player_in_any_vehicle(player.player_id()) and vehicle.get_ped_in_vehicle_seat(player.get_player_vehicle(player.player_id()), -1) ~= player.get_player_ped(player.player_id()) then
		local Vehicle = player.get_player_vehicle(player.player_id())
		local Time = utils.time_ms() + 5000
		while not network.has_control_of_entity(Vehicle) and entity.is_an_entity(Vehicle) and Time > utils.time_ms() do
			network.request_control_of_entity(Vehicle)
			system.yield()
		end
		if network.has_control_of_entity(Vehicle) then
			menu.get_feature_by_hierarchy_key("local.teleport.waypoint"):toggle()
		end
	else
		menu.get_feature_by_hierarchy_key("local.teleport.waypoint"):toggle()
	end
end)