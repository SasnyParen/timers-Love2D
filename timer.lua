timer = {}

timer_list = {}

function timer.Create(name, time, func)
	if name == nil or time == nil or func == nil then 
		return false
	end
	timer_list[name] = { 
		time = love.timer.getTime() + time,
		func = func,
	}
	return true
end

function timer.Destroy(name)
	if name == nil then 
		return false
	end
	timer_list[name] = nil
	return true
end

function timer.DestroyAll()
	timer_list = nil
end

function timer.TimeLeft(name)
	if name == nil then 
		return false
	end
	return timer_list[name].time - love.timer.getTime()
end

function timer.Exists(name)
	if name == nil then 
		return false
	end
	if timer_list[name] then 
		return true
	else 
		return false
	end
end

function UpdateTimers()

	for i, timer in pairs(timer_list) do 
		if love.timer.getTime() >= timer.time then 
			timer_list[timer.name] = nil 
			timer.func()
		end
	end

end