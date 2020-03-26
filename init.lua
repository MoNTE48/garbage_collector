-- How often to report used memory
local log_time = 30

-- Value before collecting, MB
local max_ram = 800

local function collectgarbage_info()
	minetest.log("warning", "[GARBAGE] Used " .. math.ceil(collectgarbage("count") / 1024) .. " MB.")
	if collectgarbage("count") > (max_ram * 1024) then
		collectgarbage()
		minetest.log("warning", "[GARBAGE] Used more than " .. max_ram .. " MB. Collecting Garbage...")
	end

	minetest.after(log_time, collectgarbage_info)
end

minetest.after(log_time, collectgarbage_info)
