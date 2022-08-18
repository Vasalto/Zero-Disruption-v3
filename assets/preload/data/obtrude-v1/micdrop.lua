sfunction onCreate()
	makeAnimatedLuaSprite('micFloor', 'micFloor', 335, 1165, true)
	addLuaSprite('micFloor')
	scaleObject('micFloor', 1.1, 1.1)
	setObjectScrollFactor('micFloor', 0.1, 0.1)
	setObjectPosition('micFloor', 200, 500)

end

function onCreatePost()
	setProperty('micFloor.alpha', 0)
	addCharacterToList('elexaT', 'dad')

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

