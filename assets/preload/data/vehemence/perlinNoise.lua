-----------SETTINGS-----------
local resMultiplier = 1
local resX = 64*resMultiplier
local resY = 36*resMultiplier
local genFramerate = 8

local smoothness = 30
local blendMode = 'multiply'
------------------------------

local p = {}
local permutation = {}
local tiles = {}
local dathingZ = 0
local timer = 0

function newSeed()
    permutation = {}
    for i = 1, 256 do
        table.insert(permutation, getRandomInt(0,255))
    end
    for i=0,255 do
        p[i] = permutation[i+1]
        p[256+i] = permutation[i+1]
    end
end



function drawPerlinShit()
    for y = 0, resY-1 do
        for x = 0, resX-1 do
            color = {250,000,000}
            tilecolor = RGBtoHex(color)

            tileX = x * tileXsize
            tileY = y * tileYsize
            tileX = math.floor(tileX)
            tileY = math.floor(tileY)
            name = 'tile'..tileX..tileY..x..y

            makeAgraphic(name, tileX, tileY, tileXsize, tileYsize, tilecolor)
            setBlendMode(name, blendMode)
            setObjectCamera(name,'camHUD');
            dathing = {name, tilecolor, x, y}
            table.insert(tiles, dathing)
        end
    end
end



function onCreate()
        if getPropertyFromClass('ClientPrefs', 'perlinOptimized') then
            resX = 32*resMultiplier
            resY = 18*resMultiplier
        end
        tileXsize = screenWidth/resX
        tileYsize = screenHeight/resY
        newSeed()
        setObjectOrder(name, getObjectOrder('DadGroup') - 1); 
        

end

function onUpdate(elp)
    if curBeat == 420 then
        drawPerlinShit()
    end
    timer = timer + elp
    if timer > 1/genFramerate then--Limit the generation fps
        timer = 0
        updateNoiseColor()
    end
end

function RGBtoHex(rgb)
    local hexadecimal = '' -- yeah ignore
    for key, value in pairs(rgb) do
        local hex = ''
        while(value > 0)do
            local index = math.fmod(value, 16) + 1
            value = math.floor(value / 16)
            hex = string.sub('0123456789ABCDEF', index, index) .. hex            
        end
        if(string.len(hex) == 0)then
            hex = '00'
        elseif(string.len(hex) == 1)then
            hex = '0' .. hex
        end
        hexadecimal = hexadecimal .. hex
    end
    return hexadecimal
end

function makeAgraphic(name, placeX, placeY, sizeX, sizeY, color)
    removeLuaSprite(name, true)
    makeLuaSprite(name, '', placeX, placeY)
    makeGraphic(name, sizeX, sizeY, color)
    setObjectCamera(name, 'camHUD')
    addLuaSprite(name, false)
    setObjectCamera(name,'camHUD');

end

