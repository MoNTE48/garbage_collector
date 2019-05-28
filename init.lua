-- How often to report used memory
local log_time = 5

-- Value before collecting, MB
local max_ram = 500

local function collectgarbage_info()
	minetest.after(log_time, function()
		minetest.log("warning", "[GARBAGE] Used ".. math.ceil(collectgarbage("count")/1024) .." MB.")
		collectgarbage_info()
	end)	
end

minetest.register_on_joinplayer(function(player)
	collectgarbage_info()
end)

minetest.register_globalstep(function(dtime)
	if collectgarbage("count") > (max_ram * 1024) then
		collectgarbage()
		minetest.log("warning", "[GARBAGE] Used more than ".. max_ram .." MB. Collecting Garbage...")
	end
end)
