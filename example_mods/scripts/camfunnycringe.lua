--change this ones--
local camMovement = 40
local velocity = 1

--leave this ones alone--
local campointx = 0
local campointy = 0
local camlockx = 0
local camlocky = 0
local camlock = false
local bfturn = false

	
function onMoveCamera(focus)
	if focus == 'boyfriend' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = true
	camlock = false
	setProperty('cameraSpeed', 1)
	setProperty('defaultCamZoom',0.7)
		if songName == 'Vehemence' then
			setProperty('defaultCamZoom',0.9)
		end
	
	elseif focus == 'dad' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = false
	camlock = false
	setProperty('cameraSpeed', 1)
	setProperty('defaultCamZoom',0.8)

	elseif focus == 'gf' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = false
	camlock = false
	setProperty('cameraSpeed', 1)
	setProperty('defaultCamZoom',0.8)
	
	end
end


function goodNoteHit(id, direction, noteType, isSustainNote)
	if bfturn then
		if direction == 0 then
			camlockx = campointx - camMovement
			camlocky = campointy
		elseif direction == 1 then
			camlocky = campointy + camMovement
			camlockx = campointx
		elseif direction == 2 then
			camlocky = campointy - camMovement
			camlockx = campointx
		elseif direction == 3 then
			camlockx = campointx + camMovement
			camlocky = campointy
		end
	runTimer('camreset', 1)
	setProperty('cameraSpeed', velocity)
	camlock = true
	end	
end
--teninete mantequilla was here--
		-- delete this if you dont want the oponent to move the camera
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not bfturn then
		if direction == 0 then
			camlockx = campointx - camMovement
			camlocky = campointy
		elseif direction == 1 then
			camlocky = campointy + camMovement
			camlockx = campointx
		elseif direction == 2 then
			camlocky = campointy - camMovement
			camlockx = campointx
		elseif direction == 3 then
			camlockx = campointx + camMovement
			camlocky = campointy
		end
	--nice--
	runTimer('camreset', 1)
	setProperty('cameraSpeed', velocity)
	camlock = true
	end	
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'camreset' then
	camlock = false
	setProperty('cameraSpeed', 1)
	setProperty('camFollow.x', campointx)
	setProperty('camFollow.y', campointy)
	end
end



function onUpdate()
	if camlock then
	setProperty('camFollow.x', camlockx)
	setProperty('camFollow.y', camlocky)

end

function onGameOver() -- Fix BF being off center on Death
    setCharacterY('boyfriend', getCharacterY('boyfriend') + -125)
    setCharacterX('boyfriend', getCharacterX('boyfriend') - 80)
    return Function_Continue;
end
end