minetest.register_chatcommand("speed", {
    params = "<speed>",
    description = "Sets your speed, with 1 being normal",
    privs = {server = true},
    
    func = function (name, speedText)
        local player = minetest.get_player_by_name(name)
        
        if not player then
            return false, "You have to be on the server to set your speed"
        end
        
        local speed = tonumber(speedText)
        if not speed then
            return false
        end
        
        local override = player:get_physics_override()
        override.speed = speed
        player:set_physics_override(override)
        
        return true, ("Set your speed to %s"):format(speed)
    end
})