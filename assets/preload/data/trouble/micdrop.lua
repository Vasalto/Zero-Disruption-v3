--Code by doctor krazy, credit me if used.
--You may modify it to suit your needs.
function onCreate()
	makeAnimatedLuaSprite('micFloor', 'micFloor', 117.5, 792, true)
	addLuaSprite('micFloor')
	scaleObject('micFloor', 0.9, 1)
	setObjectScrollFactor('micFloor', 0.1, 0.1)
	setObjectPosition('micFloor', 200, 500)

end

function onCreatePost()
	setProperty('micFloor.alpha', 0)
end


function onBeatHit()
	if curBeat == 7 then
		triggerEvent('Change Character', 1, 'elexaT')
		setProperty('micFloor.alpha', 1)
end


function onStepHit()
	if curStep == 18 then
		playSound('boom', generalVolume)	
	end
end
end
