local PIX = {mouse ={}}

function PIX.init(w,h)
    love.graphics.setLineStyle( "rough" )
    PIX.minWidth = w
    PIX.minHeigth = h
    PIX.resize()
end
function PIX.resizeVX(scale)
    if love.graphics.getWidth()*PIX.minHeigth > love.graphics.getHeight()*PIX.minWidth then
        PIX.scaler = scale
        PIX.height = math.floor(love.graphics.getHeight()/PIX.scaler)
        PIX.width = math.floor(love.graphics.getWidth()/PIX.scaler) 
       
    else
        PIX.scaler = scale
        PIX.width = math.floor(love.graphics.getWidth()/PIX.scaler) 
        PIX.height = math.floor(love.graphics.getHeight()/PIX.scaler)
        
    end
    
    PIX.canvas = love.graphics.newCanvas(PIX.width+1,PIX.height+1)
    PIX.canvas:setFilter("nearest")
end
function PIX.resize2X()
    if love.graphics.getWidth()*PIX.minHeigth > love.graphics.getHeight()*PIX.minWidth then
        PIX.scaler = math.floor(love.graphics.getHeight() / PIX.minHeigth)
        PIX.height = math.floor(love.graphics.getHeight()/PIX.scaler)
        PIX.width = math.floor(love.graphics.getWidth()/PIX.scaler) 
       
    else
        PIX.scaler = math.floor(love.graphics.getWidth() / PIX.minWidth)
        PIX.width = math.floor(love.graphics.getWidth()/PIX.scaler) 
        PIX.height = math.floor(love.graphics.getHeight()/PIX.scaler)
        
    end
    
    PIX.canvas = love.graphics.newCanvas(PIX.width+1,PIX.height+1)
    PIX.canvas:setFilter("nearest")
end
function PIX.resize()
    if love.graphics.getWidth()*PIX.minHeigth > love.graphics.getHeight()*PIX.minWidth then
        PIX.height = PIX.minHeigth
        PIX.width = math.floor(love.graphics.getWidth()/love.graphics.getHeight()*PIX.height) 
        PIX.scaler = love.graphics.getHeight() / PIX.minHeigth 
    else
        PIX.width = PIX.minWidth
        PIX.height = math.floor(love.graphics.getHeight()/love.graphics.getWidth()*PIX.width)
        PIX.scaler = love.graphics.getWidth() / PIX.minWidth
    end
    
    PIX.canvas = love.graphics.newCanvas(PIX.width+1,PIX.height+1)
    PIX.canvas:setFilter("nearest")
end

function PIX.draw(func)
    love.graphics.setCanvas(PIX.canvas)
    love.graphics.clear()
    func()
    love.graphics.setCanvas()
    love.graphics.draw(PIX.canvas,0,0, 0, PIX.scaler)
end
function PIX.update()
    PIX.mx = math.floor(love.mouse.getX()/PIX.scaler)
    PIX.my = math.floor(love.mouse.getY()/PIX.scaler)
end
function PIX.mouse.x()
    return math.floor(love.mouse.getX()/PIX.scaler)
end
function PIX.mouse.y()
    return math.floor(love.mouse.getY()/PIX.scaler)
end
function PIX.newImage(source)
    local image = love.graphics.newImage(source)
    image:setFilter("nearest")
    return image
end

return PIX
