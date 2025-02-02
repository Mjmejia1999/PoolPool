Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("fran.png")
    self.x = 300
    self.y = 300
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.bounce = .7
end

function Player:update(dt)
    self.width = self.width + self.bounce * dt/3
    self.height = self.height + self.bounce * dt/3
    
    --Bouncing Image
    if self.width > 2 then
        self.width = 2
        self.height = 2
        self.bounce = -self.bounce
        print(tostring(self.width))
    elseif self.width < 1.5 then
        self.width = 1.5
        self.height = 1.5
        self.bounce = -self.bounce
        print("Bounce!")
        print(tostring(self.width))
    end

    --Player Movement
    if love.keyboard.isDown("left") then
        self.x = self.x - 200 * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + 200 * dt
    end

    if love.keyboard.isDown("up") then
        self.y =  self.y - 150 * dt
    elseif love.keyboard.isDown("down") then
        self.y = self.y + 150 * dt
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, self.width/2, self.height/2, self.width/2, self.height/2)
end
