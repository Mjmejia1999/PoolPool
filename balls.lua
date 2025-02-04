 Balls = Entities:extend()

function Balls:new(texture)
    self.x = math.random(0, 800) 
    self.y = math.random(0, 600) 
    self.image = love.graphics.newImage(texture)
    self.height = self.image:getHeight()
    self.width = self.image:getWidth()
end

function Balls:update()
    
end

function Balls:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, .3, .3)
    --love.graphics.print("Balls Spawned", camera.x + -180, camera.y - 160)
end