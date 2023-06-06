timer = {}

local timer_data = {}
local timer_list = {}

function timer.Create(name, time, replys, func)
	timer_data[name] = { 
		time = love.timer.getTime() + time,
		true_time = time,
		func = func,
		reply = replys,
		stop = false,
	}
	timer_list[name] = {}
	return true
end

function timer.Simple(time, func)
	timer_data[#timer_data + 1] = { 
		time = love.timer.getTime() + time,
		func = func,
		reply = 1,
		true_time = time,
		stop = false,
	}
	timer_list[#timer_data] = {}
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
	if not timer_list[name] then return 0 end

	if timer_data[name].stop then return timer_data[name].stop_time or timer_data[name].time end
	return timer_data[name].time - love.timer.getTime()

end

function timer.Exists(name)
	if timer_list[name] then 
		return true
	else 
		return false
	end
end

function timer.Pause(name)
	if not timer_list[name] then return false end 
	local new_time = (timer_data[name].time - love.timer.getTime())
	timer_data[name].stop = true
	timer_data[name].stop_time = new_time
	timer_data[name].true_time = new_time
	return true
end

function timer.UnPause(name)
	if not timer_list[name] then return false end 
	timer_data[name].stop = false
	timer_data[name].time = love.timer.getTime() + timer_data[name].true_time
	return true
end

function timer.Stop(name)
	if not timer_list[name] then return false end 
	timer_data[name].stop = true
	return true
end

function timer.Start(name)
	if not timer_list[name] then return false end 
	timer_data[name].stop = false
	timer_data[name].time = love.timer.getTime() + timer_data[name].true_time
	return true
end

function timer.Toggle(name)
	if not timer_list[name] then return false end 
	if timer_data[name].stop then timer.UnPause(name) else timer.Pause(name) end
end

function timer.RepsLeft(name)
	if not timer_list[name] then return false end 
	return timer_data[name].reply
end


function timer.Update()

	for i, timer in pairs(timer_data) do 
		if love.timer.getTime() >= timer.time and not timer.stop then 
			if timer.reply == 0 then 
				timer_data[i].time = love.timer.getTime() + timer.true_time
				timer.func()
			elseif timer.reply >= 1 then
				local new_reply = timer.reply - 1
				timer_data[i].time = love.timer.getTime() + timer.true_time
				timer_data[i].reply = new_reply
				if new_reply == 0 then timer_list[i] = nil timer_data[i] = nil end
				timer.func()
			end
		end
	end

end
