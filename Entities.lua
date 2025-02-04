Entities = Object:extend()

function Entities:new(x, y, imagePath)
    self.x = x
    self.y = y
    self.speed = 0
    self.image = love.graphics.newImage(imagePath)
    self.height = self.texture:getHeight()
    self.width = self.texture:getWidth()
end

function Entities:update(dt)
    
end



--function waterDrag()
    
--end