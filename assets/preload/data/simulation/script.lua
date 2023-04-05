	function onCreatePost()
        setProperty('gf.visible', false) --true if you dont want gf to be visible

       --	setProperty('dad.visible', false) --true if u want the opponent to be visible
		setProperty('dad.screencenter.x') --true if u want the opponent to be visible
		--setProperty('boyfriend.screencenter.x') --true if u want the opponent to be visible
		--setProperty('boyfriend.x', 900);
		--setProperty('dad.x', 900);

		makeLuaSprite('vignette', 'blackvignette', 0, 0);
		setProperty('vignette.alpha', 1);
		setObjectCamera('vignette', 'other')
		addLuaSprite('vignette', true);

		makeLuaSprite('mainSky', 'mainSky', 0, 0);
		setProperty('mainSky.alpha', 1);
		setObjectCamera('mainSky', 'other')
		addLuaSprite('mainSky', false);
		scaleObject('mainSky', 2, 2 * 1.4)
		
		makeLuaSprite('light', 'light', -150, -200);
		setProperty('light.alpha', 0);
		setObjectCamera('light', 'other')
		addLuaSprite('light', true);
		scaleObject('light', 1, 1)

		makeLuaSprite('vignette', 'blackvignette', 0, 0);
		setProperty('vignette.alpha', 1);
		setObjectCamera('vignette', 'other')
		addLuaSprite('vignette', true);
	

	

	end

	






