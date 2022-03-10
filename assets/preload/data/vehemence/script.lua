function onCreate()
	makeAnimatedLuaSprite('redLight','redLight', -630, -350);
	setScrollFactor('redLight', 1, 1);
	addAnimationByPrefix('redLight', 'redLight', 'peee', 25, false);
	addLuaSprite('redLight', true)
	scaleObject('redLight', 12, 12);

	luaDebugMode = true
	
	setProperty('defaultCamZoom', 0.7);

	setProperty('cameraSpeed', 2.2);

	setProperty('health', 2.0);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');

	makeLuaSprite('LMAOTENTACLES', 'tentaclesblack', 0, 0);
	setProperty('LMAOTENTACLES.alpha', 0);
	setObjectCamera('LMAOTENTACLES', 'other')
	addLuaSprite('LMAOTENTACLES', true);

    makeLuaSprite('vignette', 'blackvignette', 0, 0);
	setProperty('vignette.alpha', 0);
	setObjectCamera('vignette', 'other')
	addLuaSprite('vignette', true);

    setProperty('gf.visible', false)
	
end

function onUpdate()
	health = getProperty('health')

	if getProperty('health') < 0.2 then
		doTweenAlpha('TentaclesAlpha', 'LMAOTENTACLES', 1, 0.8, 'quintOut');
		doTweenAlpha('VignetteAlpha', 'vignette', 1, 0.8, 'quintOut');
		cameraShake("hud", 0.005, 0.4);
	elseif getProperty('health') < 0.5 then
		doTweenAlpha('TentaclesAlpha', 'LMAOTENTACLES', 0.8, 0.8, 'quintOut');
		doTweenAlpha('VignetteAlpha', 'vignette', 0.8, 0.8, 'quintOut');
		cameraShake("hud", 0.002, 0.2);
	elseif getProperty('health') < 1.0 then
		doTweenAlpha('TentaclesAlpha', 'LMAOTENTACLES', 0.6, 0.8, 'quintOut');
		doTweenAlpha('VignetteAlpha', 'vignette', 0.6, 0.8, 'quintOut');
	elseif getProperty('health') < 1.5 then
		doTweenAlpha('TentaclesAlpha', 'LMAOTENTACLES', 0.2, 0.8, 'quintOut');
		doTweenAlpha('VignetteAlpha', 'vignette', 0.6, 0.8, 'quintOut');
	elseif getProperty('health') < 2 then
		doTweenAlpha('VignetteAlpha', 'vignette', 0.7, 0.8, 'quintOut');
	end
	
	if del > 0 then
		del = del - 1
	end
	
	if del2 > 0 then
		del2 = del2 - 1
	end
end

function onBeatHit()

	health = getProperty('health');

	if getProperty('health') > 0.0 then
       
        setProperty('health', health- 0.0012);

	end

	if getProperty('curBeat') == 409 then
		doTweenAlpha('hudAlpha', 'camHUD', 0, 0.2, 'quintOut');
    elseif getProperty('curBeat') == 420 then
		doTweenAlpha('hudAlpha', 'camHUD', 1, 0.9, 'quintOut');
	end

end