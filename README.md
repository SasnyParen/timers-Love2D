# timers-Love2D
Library for the Love2d framework. / Библеотека для фреймфорка Love2d.

This library will give you easy and convenient timers for your program.


Usage:


```lua
require("timer")

function love.update()
    UpdateTimers()
end
```

Available functions

```lua
timer.Create()
timer.Destroy()
timer.DestroyAll()
timer.TimeLeft()
timer.Exists()
```

Example:

```lua
require("timer")

function love.load()
   timer.Create("Test", 15, function() a = 10 end)
end

function love.draw()
    if game.Pred then
        love.graphics.print("Timer Left: ".. timer.TimeLeft("Test"), 250, 60)
    end
end

function love.update(dt)
    UpdateTimers()
end

```
