function onCreate()
	makeLuaSprite('dark', 'dark', 0, 0);
	setScrollFactor('dark', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('dark.scale.x', 1 / defaultCamZoom);
	setProperty('dark.scale.y', 1 / defaultCamZoom);
	setProperty('dark.alpha', 0.0001);
	addLuaSprite('dark', false);
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Fade Background" then
		duration = tonumber(value1);
		choose = tonumber(value2);
		if (choose == 0) then
	        doTweenAlpha('byebg', 'dark', 1, duration, 'linear')
        end
		if (choose == 1) then
	    	doTweenAlpha('byebg', 'dark', 0.0001, duration, 'linear')
        end
	end
end