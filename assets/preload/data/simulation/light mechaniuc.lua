local speed = 0.50
local press = true

local shadow = false

function onCreate()
    makeLuaSprite('help')
    makeGraphic('help', screenWidth, screenHeight, '000000')
    setObjectCamera('help', 'other')
    addLuaSprite('help', true)
    setProperty('help.alpha', 0.1)
	setProperty('dad.alpha', 0)

	--dark graph-.-
	makeLuaSprite('help2')
    makeGraphic('help2', 3000, 1600, '000000')
    setObjectCamera('help2', 'camgame')
    addLuaSprite('help2', false)
    setProperty('help2.alpha', 0)
	setProperty('dad.alpha', 0)
	setProperty('help2.x', -1200)

	--
end

function onUpdate(elapsed)
	if shadow == true then
    	setProperty('help.alpha', getProperty('help.alpha') + (elapsed * 0.1))
	end
end

function onUpdatePost(elapsed)
	setProperty('dad.x', 50 - getProperty('health'));
end

function goodNoteHit()
    setProperty('help.alpha', getProperty('help.alpha')-0.025)
end

function noteMiss()
	setProperty('help.alpha', getProperty('help.alpha')+0.050*speed)
end

function onBeatHit(elapsed)
	if curBeat == 130 then
		press = false
		doTweenAlpha('saw', 'help', 1, 2, 'quintOut');
		--speed = 1
	end
	if curBeat == 136 then
		press = true
	--	speed = 1
		shadow = true
		setProperty('help.alpha', 0.1)
	end
	if curBeat == 200 then
	doTweenAlpha('shadow', 'help2', 1, 0.5, 'quintOut');
	end
	if curBeat == 264 then
		doTweenAlpha('shadow', 'help2', 0, 0.5, 'quintOut');
		speed = 2

	end
end