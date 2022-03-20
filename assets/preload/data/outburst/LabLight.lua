function onCreate()
	makeLuaSprite('dark', 'dark', -630, -350);
	setScrollFactor('dark', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('dark.scale.x', 1 / defaultCamZoom);
	setProperty('dark.scale.y', 1 / defaultCamZoom);
	setProperty('dark.alpha', 0.0001);
	scaleObject('dark', 13, 13);
	addLuaSprite('dark', false);


	luaDebugMode = true
	
	setProperty('defaultCamZoom', 0.8);

	setProperty('cameraSpeed', 2.2);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');

    makeLuaSprite('vignette', 'blackvignette', 0, 0);
	setProperty('vignette.alpha', 0);
	setObjectCamera('vignette', 'other')
	addLuaSprite('vignette', true);

    setProperty('gf.visible', true)
	
end
function onBeatHit()
	if curBeat % 16 == 0 then
		objectPlayAnimation('redLight', 'redLight', true);
	elseif curBeat == 1 then
		objectPlayAnimation('redLight', 'redLight', true);
    end
	
	
    if getProperty('curBeat') == 1 then
		doTweenAlpha('dark', 'dark', 0, 0.2, 'quintOut');
	elseif getProperty('curBeat') == 192 then
		doTweenAlpha('vignette', 'vignette', 1, 10, 'quintOut');
	elseif getProperty('curBeat') == 212 then
		doTweenAlpha('dark', 'dark', 1, 8, 'quintOut');
		doTweenAlpha('gf', 'gf', 0, 8, 'quintOut');
		doTweenAlpha('dad', 'dad', 0, 8, 'quintOut');
	elseif getProperty('curBeat') == 237 then
		doTweenAlpha('dad', 'dad', 1, 2, 'quintOut');
	elseif getProperty('curBeat') == 256 then
		doTweenAlpha('boyfriend', 'boyfriend', 0, 1, 'quintOut');
		doTweenAlpha('hudAlpha', 'camHUD', 0, 0.2, 'quintOut');
	elseif getProperty('curBeat') == 271 then
		doTweenAlpha('boyfriend', 'boyfriend', 1, 1, 'quintOut');
		doTweenAlpha('hudAlpha', 'camHUD', 1, 0.2, 'quintOut');
		doTweenAlpha('dad', 'dad', 0, 1, 'quintOut');
	elseif getProperty('curBeat') == 288 then
		doTweenAlpha('dad', 'dad', 1, 1, 'quintOut');
	elseif getProperty('curBeat') == 320 then
		doTweenAlpha('gf', 'gf', 1, 1, 'quintOut');
		doTweenAlpha('dark', 'dark', 0, 1, 'quintOut');
		doTweenAlpha('vignette', 'vignette', 0, 1, 'quintOut');










	end

end
