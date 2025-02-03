Player = Object:extend()
require "Camera"

function Player:new()
    self.image = love.graphics.newImage("fran.png")
    self.x = 300
    self.y = 300
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.bounce = .7
    self.speed = 200
    self.radius = 20
    self.xCord = 300
    self.yCord = 300
    self.canMove = true
    self.distance = 0
end

function Player:update(dt)
    --Triganometry to move the player towards the mouse
    mouse_x, mouse_y = love.mouse.getPosition()
    angle = math.atan2(self.yCord - self.y, self.xCord - self.x)
    cos = math.cos(angle)
    sin = math.sin(angle)
    distance = getDistance(self.x, self.y, self.xCord, self.yCord)
    if distance > 1 then
        self.x = self.x + self.speed * cos * (distance/100) * dt
        self.y = self.y + self.speed * sin * (distance/100) * dt
    elseif distance < 2 then
        self.canMove = true
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, self.width/100, self.height/100, self.width/2, self.height/2)
    
    love.graphics.circle("line", self.x, self.y, self.radius)

    --Print the angle
    love.graphics.print("angle: " .. math.ceil(angle), camera.x + -180, camera.y - 190)
    love.graphics.print("distance: " .. math.ceil(distance), camera.x + -180, camera.y - 180)
    if self.canMove then
        love.graphics.print("canMove: Yes", camera.x + -180, camera.y - 170)
    else 
        love.graphics.print("canMove: No", camera.x + -180, camera.y - 170)
        --prints the line from the player to the mouse
        love.graphics.line(self.x, self.y, self.xCord, self.yCord)
    end
end

function getDistance(x1, y1, x2, y2)
    local horizontal_distance = x1 - x2
    local vertical_distance = y1 - y2
    --Both of these work
    local a = horizontal_distance * horizontal_distance
    local b = vertical_distance ^2

    local c = a + b
    local distance = math.sqrt(c)
    return distance
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 and player.canMove then
        player.canMove = false
        x, y = camera:toWorldCoords(x, y)
        player.xCord = x 
        player.yCord = y 
    end
end