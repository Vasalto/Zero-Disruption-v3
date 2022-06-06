function onCreate()
    luaDebugMode = true

	setProperty('cameraSpeed', 2.2);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');


	setProperty('health', 2.0);

end

function onStepHit()
	if curStep < 200 then
	drainHealth(2,4)
	else
	resetHealth()
	end
end
