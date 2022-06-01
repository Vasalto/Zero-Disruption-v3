	function onCreate()
		precacheImage('redLight')
		precacheImage('zerojumpscare')


		--makeAnimatedLuaSprite('bgWARNING','bgWARNING', -600, -300);
		--setScrollFactor('bgWARNING', 1, 1);
		-- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
		--addLuaSprite('bgWARNING', false);


		makeLuaSprite('bgBACK','bgBACKWARNING', -600, -300);
		setScrollFactor('bgBACK', 1, 1);
		-- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
		--addLuaSprite('bgBACK', false);
	
		makeLuaSprite('bgFRONT','bgFRONT', -600, -300);
		setScrollFactor('bgFRONT', 1, 1);
		-- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
		--addLuaSprite('bgFRONT', false);
	
		makeAnimatedLuaSprite('redLight','redLight', -630, -350);
		setScrollFactor('redLight', 1, 1);
		addAnimationByPrefix('redLight', 'redLight', 'peee', 25, false);
		addLuaSprite('redLight', true)
		scaleObject('redLight', 12, 12);

		--makeAnimatedLuaSprite('buttons','buttons', 310, 200);
		--setScrollFactor('buttons', 1, 1);
		--addAnimationByPrefix('buttons', 'buttons', 'buttons', 25, true);
		--setObjectCamera('buttons','hud');
		--scaleObject('buttons', 0.6, 0.6);
		--setProperty('buttons.alpha', 0);
		--addLuaSprite('buttons', true)

		--makeAnimatedLuaSprite('zeroj','zerojumpscare', 630, -350);
		--setScrollFactor('zeroj', 1, 1);
		--setObjectCamera('zeroj','hud');
		--addAnimationByPrefix('zeroJ', 'zerojumpscareloop', 'zerojumpscareloop', 25, true);
		--addAnimationByPrefix('zeroj', 'entry', 'zerojumpscareentry', 24, false)
		--addAnimationByPrefix('zeroj', 'loop', 'zerojumpscareloop', 24, true)
		--addAnimationByPrefix('zeroj', 'exit', 'zerojumpscareexit', 24, false)
		--setProperty('zeroj.alpha', 0);

		--addLuaSprite('zeroj', true)
--		makeAnimatedLuaSprite('fx', 'vintage', 0, 0)
--		addAnimationByPrefix('fx', 'idle', 'idle', 16, true)
--		scaleObject('fx', 3, 3)
--		setObjectCamera('fx', 'camHud')
--		objectPlayAnimation('fx', 'idle', true)
--		setProperty('fx.alpha', 0)

		makeLuaSprite('dark', 'dark', -630, -350);
		setScrollFactor('dark', 0, 0);
		setProperty('dark.alpha', 1);
		scaleObject('dark', 13, 13);
		addLuaSprite('dark', true);
	end

	function onBeatHit()
		if curBeat % 16 == 0 then
			objectPlayAnimation('redLight', 'redLight', true);
		elseif curBeat == 1 then
			objectPlayAnimation('redLight', 'redLight', true);
		end
	end
	






