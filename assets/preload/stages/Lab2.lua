	function onCreate()
		precacheImage('redLight')
		makeLuaSprite('bgBACK','bgWARNING', -600, -300);
		setScrollFactor('bgBACK', 1, 1);
		addLuaSprite('bgBACK', false);
	
		makeLuaSprite('bgFRONT','bgFRONT', -600, -300);
		setScrollFactor('bgFRONT', 1, 1);
		addLuaSprite('bgFRONT', false);
	
		makeAnimatedLuaSprite('redLight','redLight', -630, -350);
		setScrollFactor('redLight', 1, 1);
		addAnimationByPrefix('redLight', 'redLight', 'peee', 25, false);
		addLuaSprite('redLight', true)
		scaleObject('redLight', 12, 12);
	end

	function onBeatHit()
		if curBeat % 16 == 0 then
			objectPlayAnimation('redLight', 'redLight', true);
		elseif curBeat == 1 then
			objectPlayAnimation('redLight', 'redLight', true);
		end
	end