function onCreate()
	makeAnimatedLuaSprite('micFloor', 'micFloor', 230, 1155, true)
	addLuaSprite('micFloor')
	scaleObject('micFloor', 1.1, 1.1)
	setObjectScrollFactor('micFloor', 0.1, 0.1)
	setObjectPosition('micFloor', 100, 500)

end

function onCreatePost()
	setProperty('micFloor.alpha', 0)
	addCharacterToList('elexaT', 'dad')

end


function onBeatHit()
	if curBeat == 7 then
		triggerEvent('Change Character', 1, 'elexaT')
		setProperty('micFloor.alpha', 1)
		setProperty('dad.x', 31)
		setProperty('dad.y', 300)


end


function onStepHit()
	if curStep == 18 then
		playSound('boom', generalVolume)	
	end
end
end
