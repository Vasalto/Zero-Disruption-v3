	function onCreate()
		precacheImage('redLight')
		precacheImage('zerojumpscare')


		--makeAnimatedLuaSprite('bgWARNING','bgWARNING', -600, -300);
		--setScrollFactor('bgWARNING', 1, 1);
		-- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
		--addLuaSprite('bgWARNING', false);


		makeLuaSprite('bgBACK','bgWARNING', -600, -300);
		setScrollFactor('bgBACK', 1, 1);
		-- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
		addLuaSprite('bgBACK', false);
	
		makeLuaSprite('bgFRONT','bgFRONT', -600, -300);
		setScrollFactor('bgFRONT', 1, 1);
		-- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
		addLuaSprite('bgFRONT', false);
	
		makeAnimatedLuaSprite('redLight','redLight', -630, -350);
		setScrollFactor('redLight', 1, 1);
		addAnimationByPrefix('redLight', 'redLight', 'peee', 25, false);
		addLuaSprite('redLight', true)
		scaleObject('redLight', 12, 12);

		makeAnimatedLuaSprite('buttons','mechanics/buttons', 310, 200);
		setScrollFactor('buttons', 1, 1);
		addAnimationByPrefix('buttons', 'buttons', 'buttons', 25, true);
		setObjectCamera('buttons','hud');
		scaleObject('buttons', 0.6, 0.6);
		setProperty('buttons.alpha', 0);
		addLuaSprite('buttons', true)

		makeAnimatedLuaSprite('zeroj','mechanics/zerojumpscare', 630, -350);
		setScrollFactor('zeroj', 1, 1);
		setObjectCamera('zeroj','hud');
		addAnimationByPrefix('zeroJ', 'zerojumpscareloop', 'zerojumpscareloop', 25, true);
		addAnimationByPrefix('zeroj', 'entry', 'zerojumpscareentry', 24, false)
		addAnimationByPrefix('zeroj', 'loop', 'zerojumpscareloop', 24, true)
		addAnimationByPrefix('zeroj', 'exit', 'zerojumpscareexit', 24, false)
		setProperty('zeroj.alpha', 0);
		addLuaSprite('zeroj', true)

		makeAnimatedLuaSprite('fx', 'vignettes/vintage', 0, 0)
		addAnimationByPrefix('fx', 'idle', 'idle', 16, true)
		scaleObject('fx', 3, 3)
		setObjectCamera('fx', 'camHud')
		objectPlayAnimation('fx', 'idle', true)
		setProperty('fx.alpha', 0)
		addLuaSprite(fx, true)



	end

	function onBeatHit()
		if curBeat % 16 == 0 then
			objectPlayAnimation('redLight', 'redLight', true);
		elseif curBeat == 1 then
			objectPlayAnimation('redLight', 'redLight', true);
			buttfade()
		elseif curBeat == 50 or curBeat == 90 or curBeat == 125 or curBeat == 150 then
			entryz()
		end
	end

	function entryz()
		objectPlayAnimation('zeroj', 'entry', true);
		setProperty('zeroj.alpha', 1);
		runTimer('entryz', 0.5)
	end

	function buttfade()
		doTweenAlpha('buttons', 'buttons', 1, 2, 'quintOut');
		runTimer('buttout', 5)
	end

	function onTimerCompleted(tag, l, ll)
		if tag == 'entryz' then
			objectPlayAnimation('zeroj', 'loop', true);
			setProperty('zeroj.y', -317);
			setProperty('zeroj.x', 681);
			runTimer('entryc', 2)
		elseif tag == 'entryc' then
			objectPlayAnimation('zeroj', 'exit', true);
			--setProperty('zeroj.y', -190);
			runTimer('entryv', 0.3)
		elseif tag == 'entryv' then
			setProperty('zeroj.alpha', 0);
			setProperty('zeroj.y', -350);
			setProperty('zeroj.x', 630);
		elseif tag == 'buttout' then
			doTweenAlpha('buttons', 'buttons', 0, 2, 'quintOut');
			
		end
	end

	






