
function onCreate()
	makeAnimatedLuaSprite('bgWARNING','bgWARNING', -600, -300);
	setScrollFactor('bgWARNING', 1, 1);
    -- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
	addLuaSprite('bgWARNING', false);
	
	makeAnimatedLuaSprite('redLight','redLight', -630, -350);
	setScrollFactor('redLight', 1, 1);
	addAnimationByPrefix('redLight', 'redLight', 'peee', 25, false);
	addLuaSprite('redLight', true)
	scaleObject('redLight', 12, 12);

	
end

function onBeatHit()
	if curBeat % 22 == 0 then
		objectPlayAnimation('redLight', 'redLight', true);
	elseif curBeat == 1 then
		objectPlayAnimation('redLight', 'redLight', true);

end

function onStepHit()
	if curStep < 200 then
	drainHealth(2,4)
	else
	resetHealth()
	end
	end




end




