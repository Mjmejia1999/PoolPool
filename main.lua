
function love.load()
    Object = require "classic"
    require "player"
    --require "borders"
    Camera = require 'Camera'

    --STALKER-X library and settings 
    camera = Camera()
    camera:setFollowStyle('TOPDOWN_TIGHT')
    camera.scale = 1.5

    --Entities
    player = Player()
    listOfBalls = {}

    --Map
    --borders = Borders()
    pool = love.graphics.newImage("poolpoolBG.png")
end

function love.update(dt)
    --Usimg STALKER-X library to create a camera that follows the player
    camera:update(dt)
    camera:follow(player.x, player.y)

    player:update(dt)

    --Stay within collision zone
    --if checkCollision(player, borders) then
    --    love.event.quit("restart")
    --end

end

function love.draw()
    camera:attach()

    love.graphics.draw(pool, -100, 0, 0, .5, .5, .5, .5)
    --borders:draw()

    
    player:draw()
    camera:detach()
end


--function checkCollision(a, b)
    --local a_left = a.x
    --local a_right = a.x + a.width
    --local a_top = a.y
    --local a_bottom = a.y + a.height

    --local b_left = b.x
    --local b_right = b.x + b.width
    --local b_top = b.y
    --local b_bottom = b.y + b.height

    --return  a_right < b_left
    --    and a_left > b_right
    --    and a_bottom < b_top
    --    and a_top > b_bottom
--end
