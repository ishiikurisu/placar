local BLACK = { 0, 0, 0 }
local scoreA = 0
local scoreB = 0
local buttons = {
    {
        text = "ZERAR",
        x = function(w, h)
            return 0.3 * w
        end,
        y = function(w, h)
            return 0.6 * h
        end,
        onclick = function()
            scoreA = 0
        end,
        w = function(w, h)
            return 0.3 * w
        end,
        h = function(w, h)
            return 0.09 * h
        end,
        font = "button"
    }, {
        text = "ZERAR",
        x = function(w, h)
            return 0.6 * w
        end,
        y = function(w, h)
            return 0.6 * h
        end,
        onclick = function()
            scoreB = 0
        end,
        w = function(w, h)
            return 0.3 * w
        end,
        h = function(w, h)
            return 0.09 * h
        end,
        font = "button"
    }, {
        text = "+",
        x = function(w, h)
            return 0.3 * w
        end,
        y = function(w, h)
            return 0.7 * h
        end,
        w = function(w, h)
            return 0.3 * w
        end,
        h = function(w, h)
            return 0.09 * h
        end,
        onclick = function()
            scoreA = scoreA + 1
        end,
        font = "button"
    }, {
        text = "+",
        x = function(w, h)
            return 0.6 * w
        end,
        y = function(w, h)
            return 0.7 * h
        end,
        w = function(w, h)
            return 0.3 * w
        end,
        h = function(w, h)
            return 0.09 * h
        end,
        onclick = function()
            scoreB = scoreB + 1
        end,
        fontSize = 40
    }, {
        text = "-",
        x = function(w, h)
            return 0.3 * w
        end,
        y = function(w, h)
            return 0.8 * h
        end,
        w = function(w, h)
            return 0.3 * w
        end,
        h = function(w, h)
            return 0.09 * h
        end,
        onclick = function()
            scoreA = scoreA - 1
        end,
        font = "button"
    }, {
        text = "-",
        x = function(w, h)
            return 0.6 * w
        end,
        y = function(w, h)
            return 0.8 * h
        end,
        w = function(w, h)
            return 0.3 * w
        end,
        h = function(w, h)
            return 0.09 * h
        end,
        onclick = function()
            scoreB = scoreB - 1
        end,
        font = "button"
    }
}

function love.load()
    love.graphics.setFont(love.graphics.newFont(80))
    love.window.setMode(800, 600, {
        fullscreen = true
    })
end

function love.draw()
    local width, height, _ = love.window.getMode()

    love.graphics.setBackgroundColor(BLACK)

    -- drawing score
    love.graphics.print(scoreA, width * 0.3, height * 0.2)
    love.graphics.print(scoreB, width * 0.6, height * 0.2)

    -- drawing buttons
    for i, button in pairs(buttons) do
        local button = buttons[i]
        local x = button.x(width, height)
        local y = button.y(width, height)
        love.graphics.print(button.text, x, y)
    end
end

function love.touchreleased(id, x, y, dx, dy, pressure)
    pressButtons(x, y)
end

function love.mousereleased(x, y, button, istouch, presses)
    if button == 1 then
        pressButtons(x, y)
    end
end

function pressButtons(x, y)
    local width, height, _ = love.window.getMode()
    for i, button in pairs(buttons) do
        if isPressed(button, x, y, width, height) then
            button.onclick()
        end
    end
end

function isPressed(button, touchX, touchY, width, height)
    local x = button.x(width, height)
    local y = button.y(width, height)
    local w = button.w(width, height)
    local h = button.h(width, height)
    local r = false
    if touchX >= x and touchX < x + h and touchY >= y and touchY < y + h then
        r = true
    end
    return r
end
