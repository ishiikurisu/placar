local PANTONE_561_C = { 0, 89/256, 76/256 }
local PANTONE_COOL_GRAY_1_C = { 217/256, 217/256, 214/256 }
local scoreA = 0
local scoreB = 0
local buttons = {
    {
        text = "ZERAR",
        x = function(w, h)
            return 0.375 * w
        end,
        y = function(w, h)
            return 0.55 * h
        end,
        onclick = function()
            scoreA = 0
            scoreB = 0
        end,
        w = function(w, h)
            return 0.25 * w
        end,
        h = function(w, h)
            return 0.095 * h
        end,
        font = "small"
    }, {
        text = "+",
        x = function(w, h)
            return 0.20 * w
        end,
        y = function(w, h)
            return 0.7 * h
        end,
        w = function(w, h)
            return 0.1 * w
        end,
        h = function(w, h)
            return 0.095 * h
        end,
        onclick = function()
            scoreA = scoreA + 1
        end,
        font = "regular"
    }, {
        text = "+",
        x = function(w, h)
            return 0.65 * w
        end,
        y = function(w, h)
            return 0.7 * h
        end,
        w = function(w, h)
            return 0.1 * w
        end,
        h = function(w, h)
            return 0.095 * h
        end,
        onclick = function()
            scoreB = scoreB + 1
        end,
        font = "regular"
    }, {
        text = "-",
        x = function(w, h)
            return 0.20 * w
        end,
        y = function(w, h)
            return 0.8 * h
        end,
        w = function(w, h)
            return 0.1 * w
        end,
        h = function(w, h)
            return 0.095 * h
        end,
        onclick = function()
            scoreA = scoreA - 1
        end,
        font = "regular"
    }, {
        text = "-",
        x = function(w, h)
            return 0.65 * w
        end,
        y = function(w, h)
            return 0.8 * h
        end,
        w = function(w, h)
            return 0.1 * w
        end,
        h = function(w, h)
            return 0.095 * h
        end,
        onclick = function()
            scoreB = scoreB - 1
        end,
        font = "regular"
    }
}
local fonts = { }

function love.load()
    love.window.setFullscreen(true)
    local width, height, _ = love.window.getMode()
    fonts.big = love.graphics.newFont("font.ttf", 150 * height / 1366)
    fonts.regular = love.graphics.newFont("font.ttf", 70 * height / 1366)
    fonts.small = love.graphics.newFont("font.ttf", 45 * height / 1366)
end

function love.draw()
    local width, height, _ = love.window.getMode()
    local score = scoreA .. " x " .. scoreB
    local x, y, w, h

    love.graphics.setBackgroundColor(PANTONE_561_C)
    love.graphics.setColor(PANTONE_COOL_GRAY_1_C)

    love.graphics.setFont(fonts.big)
    x = love.window.fromPixels(width * 0.25)
    y = love.window.fromPixels(height * 0.2)
    w = love.window.fromPixels(width * 0.5)
    love.graphics.printf(score, x, y, w, "justify")

    for i, button in pairs(buttons) do
        local button = buttons[i]
        x = love.window.fromPixels(button.x(width, height))
        y = love.window.fromPixels(button.y(width, height))
        w = love.window.fromPixels(button.w(width, height))
        h = love.window.fromPixels(button.h(width, height))
        love.graphics.setFont(fonts[button.font])
        love.graphics.printf(button.text, x, y, w, "center")
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if button == 1 or istouch then
        pressButtons(love.window.toPixels(x), love.window.toPixels(y))
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
    if touchX >= x and touchX < x + w and touchY >= y and touchY < y + h then
        r = true
    end
    return r
end
