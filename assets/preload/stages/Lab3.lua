function onCreate()
	makeAnimatedLuaSprite('labZero','labZero', -600, -300);
	setScrollFactor('labZero', 1, 1);
    -- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
	addLuaSprite('labZero', false);
	
	makeAnimatedLuaSprite('redLight','redLight', -630, -350);
	setScrollFactor('redLight', 1, 1);
	addAnimationByPrefix('redLight', 'redLight', 'peee', 25, false);
	addLuaSprite('redLight', true)
	scaleObject('redLight', 12, 12);

	
end