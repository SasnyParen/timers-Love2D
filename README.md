# timers-Love2D
Library for the Love2d framework. / Библеотека для фреймфорка Love2d.

This library will give you easy and convenient timers for your program.


Usage:


```lua
require("timer")

function love.update()
    timer.Update()
end
```

Available functions

```lua
timer.Create(name, time, replys, func) -- Create timer
timer.Simple(time, func) -- Create timer without any name
timer.Destroy(time) -- Destroy timer
timer.TimeLeft(time) -- Get time left timer
timer.Exists(time) -- Check timer valid
timer.Update() -- Think func
timer.Pause(name) -- Pauses timer
timer.UnPause(name) -- UnPauses timer
timer.Start(name) -- Start and ReWrite timer
timer.Stop(name) -- Stop and ReWrite timer
timer.Toggle(name) -- Runs either timer.Pause or timer.UnPause based on the timer's current status
timer.RepsLeft(name) -- Returns amount of repetitions left before the timer destroys itself.
```

Example:

```lua
require("timer")

function love.load()
   timer.Create("Test", 15, 1, function() a = 10 end)
end

function love.draw()
        love.graphics.print("Timer Left: ".. timer.TimeLeft("Test"), 250, 60)
end

function love.update(dt)
    timer.Update()
end

```
