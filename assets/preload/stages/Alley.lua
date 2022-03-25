function onCreate()

    luaDebugMode = true
	
	setProperty('defaultCamZoom', 0.7);

	setProperty('cameraSpeed', 2.2);

	setProperty('gf.alpha', 0)
	
	setProperty('health', 2.0);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');

	makeLuaSprite('basementwall', 'basementwall', -600, -300);
	setScrollFactor('basementwall', 1, 1);
    addLuaSprite('basementwall', false);

	makeLuaSprite('basement', 'basement', -800, -300);
	setScrollFactor('basement', 1, 1);
	scaleObject('basement', 1.5, 1)
    addLuaSprite('basement', false);

	makeLuaSprite('plank', 'plank', 900, 700);
	setScrollFactor('plank', 1.2, 1);
	addLuaSprite('plank', true);
	
	makeLuaSprite('plank2', 'plank', -600, 700);
	setScrollFactor('plank2', 1.2, 1);
	addLuaSprite('plank2', true);

end

function onCreatePost()
	
	setProperty('gf.alpha', 0)
	
end