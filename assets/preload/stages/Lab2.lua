	function onCreate()
		makeAnimatedLuaSprite('bgWARNING','bgWARNING', -600, -300);
		setScrollFactor('bgWARNING', 1, 1);
		-- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
		addLuaSprite('bgWARNING', false);
	
		makeAnimatedLuaSprite('bgFRONT','bgFRONT', -600, -300);
		setScrollFactor('bgFRONT', 1, 1);
		-- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
		addLuaSprite('bgFRONT', false);
	
		makeAnimatedLuaSprite('redLight','redLight', -630, -350);
		setScrollFactor('redLight', 1, 1);
		addAnimationByPrefix('redLight', 'redLight', 'peee', 25, false);
		addLuaSprite('redLight', true)
		scaleObject('redLight', 12, 12);

		makeAnimatedLuaSprite('fx', 'vintage', 0, 0)
		addAnimationByPrefix('fx', 'idle', 'idle', 16, true)
		scaleObject('fx', 3, 3)
		setObjectCamera('fx', 'camHud')
		objectPlayAnimation('fx', 'idle', true)
		setProperty('fx.alpha', 0)
	end

	function onSongStart()
		addLuaSprite('fx', true)
	end





