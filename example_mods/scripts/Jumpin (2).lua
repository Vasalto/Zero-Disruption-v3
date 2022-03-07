jumping = false
function onUpdatePost(elapsed)
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and not jumping then -- YOU CAN EDIT SPACE TO ANY KEY YO WANT
		doTweenY('boyfriendJumpY', 'boyfriend', defaultBoyfriendY + -50, 0.3, 'cubeOut')
		setProperty('boyfriend.stunned', false)
		jumping = true
	end
end

function onTweenCompleted(tag)
	if tag == 'boyfriendJumpY' then
		doTweenY('boyfriendJumpBackY', 'boyfriend', defaultBoyfriendY + 350, 0.2, 'cubeIn')
		runTimer('delay', 0.2, 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'delay' then
		setProperty('boyfriend.stunned', false) --haha you can sing
		jumping = false
	end
end