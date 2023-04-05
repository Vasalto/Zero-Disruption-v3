local speed = 1
local press = true

function onCreate()
    makeLuaSprite('help')
    makeGraphic('help', screenWidth, screenHeight, '000000')
    setObjectCamera('help', 'other')
    addLuaSprite('help', true)
    setProperty('help.alpha', 0.3)
	setProperty('dad.alpha', 0)
end

function onUpdate(elapsed)
    setProperty('help.alpha', getProperty('help.alpha')+0.001*speed)

	if press == true then
	    if keyJustPressed('space') then
    	    setProperty('help.alpha', 0.3)
    
		end
	end
end

function onUpdatePost(elapsed)
	setProperty('dad.x', 50 - getProperty('health'));

end


function onBeatHit()
	if curBeat == 130 then
		press = false
		speed = 5
	end
	if curBeat == 136 then
		press = true
		speed = 1
		setProperty('help.alpha', 0.3)
	end
end