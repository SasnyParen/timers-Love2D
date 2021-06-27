timer = {}

local timer_data = {}
local timer_list = {}

function timer.Create(name, time, func)
	timer_data[name] = { 
		time = love.timer.getTime() + time,
		func = func,
	}
	timer_list[name] = {}
	return true
end

function timer.Destroy(name)
	timer_list[name] = nil
	timer_data[name] = nil
	return true
end

function timer.DestroyAll()
	timer_list = nil
	timer_data = nil
end

function timer.TimeLeft(name)
	if name == nil then 
		return false
	end
	return math.floor(timer_data[name].time - love.timer.getTime())
end

function timer.Exists(name)
	if timer_list[name] then 
		return true
	else 
		return false
	end
end

function UpdateTimers()

	for i, timer in pairs(timer_data) do 
		if love.timer.getTime() >= timer.time then 
			timer_list[timer.name] = nil 
			timer_data[timer.name] = nil
			timer.func()
		end
	end

end
