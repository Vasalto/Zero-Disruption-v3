function onCreate()
	
	--setBlendMode('dad', 'subtract');

--	setBlendMode('boyfriend', 'subtract');

    makeLuaSprite('ParedDeAnexo1', '', -110, 0)
	makeGraphic('ParedDeAnexo1', 1500, 120, '000000')
	setObjectCamera('ParedDeAnexo1', 'HUD')
	addLuaSprite('ParedDeAnexo1', false)
    setProperty('ParedDeAnexo1.alpha', 1)

	makeLuaSprite('ParedDeAnexo2', '', -110, 600)
	makeGraphic('ParedDeAnexo2', 1500, 120, '000000')
	setObjectCamera('ParedDeAnexo2', 'HUD')
	addLuaSprite('ParedDeAnexo2', false)
    setProperty('ParedDeAnexo2.alpha', 1)
	

	setProperty('defaultCamZoom', 0.6);

	setProperty('cameraSpeed', 2.2);

	setProperty('health', 2.0);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');

	makeLuaSprite('LMAOTENTACLES', 'tentaclesblack', 0, 0);
	setProperty('LMAOTENTACLES.alpha', 0);
	setObjectCamera('LMAOTENTACLES', 'hud')

	makeLuaSprite('difumi','stages/mdk/rojoj', -1900, -400);
	setObjectCamera('difumi', 'game')
	addLuaSprite('difumi', true);
    scaleObject('difumi', 2, 2);
	setBlendMode('difumi', 'screen');


	makeLuaSprite('black','stages/mdk/black', -1400, -200);
	setObjectCamera('black', 'game')
	addLuaSprite('black', true);
	setBlendMode('black', 'multiply');

	scaleObject('black', 2, 3);

	
	makeLuaSprite('kblack','stages/mdk/kblack', -10, -500);
	setObjectCamera('kblack', 'game')
	addLuaSprite('kblack', true);
	setBlendMode('kblack', 'multiply');
	scaleObject('kblack', 2, 3);


	makeLuaSprite('e','stages/mdk/difumi', -600, -500);
	setObjectCamera('e', 'game')
	addLuaSprite('e', true);
	setBlendMode('e', 'invert');
	scaleObject('e', 1, 1);


	makeLuaSprite('vignette','stages/mdk/blackvignette', -0, -0);
	setObjectCamera('vignette', 'hud')
	addLuaSprite('vignette', true);
    setProperty('gf.visible', false)
end



