function onBeatHit()
	if curBeat % 16 == 0 then
		objectPlayAnimation('redLight', 'redLight', true);
	elseif curBeat == 1 then
		objectPlayAnimation('redLight', 'redLight', true);
    end
end


function onStepHit()
	if curStep == 64 or curStep == 256 or curStep == 377 or curStep == 379 or curStep == 381 or curStep == 383 or curStep == 544 or curStep == 634 or curStep == 638 or curStep == 840 or curStep == 842 or curStep == 844 or curStep == 846 or curStep == 842 or curStep == 1355 or curStep == 1357 or curStep == 1359 then
		staticON()
	end
end

function staticON()
	setProperty('fx.alpha', 0.8)
	doTweenAlpha('staticON', 'fx', 0, 1, 'linear')
	playSound('stat', 0.3)
end
