function onCreate()

    luaDebugMode = true
	
	setProperty('cameraSpeed', 2.2);

	setProperty('gf.alpha', 0)
	
	setProperty('health', 2.0);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');

	makeLuaSprite('back', 'stages/1/back', -600, -300);
	setScrollFactor('backl', 1, 1);
	scaleObject('back', 1, 1);
    addLuaSprite('back', false);

	makeLuaSprite('front', 'stages/1/front', -600, -300);
	setScrollFactor('front', 1, 1);
	scaleObject('front', 1, 1);
    addLuaSprite('front', false);

end

function onCreatePost()
	
	setProperty('gf.alpha', 1)
	
end