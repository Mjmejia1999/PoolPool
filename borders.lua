Borders = Player:extend()

function Borders:new()
    self.pool = love.graphics.newImage("poolpoolBG.png")
    self.width = self.pool:getWidth()
    self.length = self.pool:getHeight()
end

function Borders:update()
    
end

function Borders:draw()
    love.graphics.rectangle("line", self.width/2, self.length/2, self.width, self.length)
end