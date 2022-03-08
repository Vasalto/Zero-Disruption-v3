function onCreate()
	makeAnimatedLuaSprite('redLight','redLight', -630, -350);
	setScrollFactor('redLight', 1, 1);
	addAnimationByPrefix('redLight', 'redLight', 'peee', 25, false);
	addLuaSprite('redLight', true)
	scaleObject('redLight', 12, 12);

	
end