local barAmount = 138
local burst = false
local soundPlayed = false
local soundPlayVar = false
local temper1cooldown = false
local temper2cooldown = false
local redbar = false

function onCreate()
	precacheImage('mechanics/zerosooth')
	--precacheImage('mechanics/temper')
	--precacheImage('mechanics/temperlines')
	precacheImage('vignettes/blackvignette')

	-- bar bg or smthng
    if getPropertyFromClass('ClientPrefs', 'mechanics') == true then

		makeLuaSprite('barNormal', 'mechanics/temper', 1190.5, 145)
		setObjectCamera('barNormal', 'hud')
		addLuaSprite('barNormal')
		
		makeLuaSprite('barBlue', 'barBlue', 1231, 430)
		makeGraphic('barBlue', 18, 1, 'FFFFFF')
		setProperty('barBlue.color', getColorFromHex('15E9FF'))
		setObjectCamera('barBlue', 'hud')
		setProperty('barBlue.origin.y', 1)
		addLuaSprite('barBlue')
		setProperty('barBlue.scale.y', shielded)

		makeLuaSprite('barline', 'mechanics/temperlines', 1204.5, 145)
		setObjectCamera('barline', 'other')
		addLuaSprite('barline')


		makeLuaSprite('vignette', 'vignettes/blackvignette', 0, 0);
		setProperty('vignette.alpha', 0);
		setObjectCamera('vignette', 'other')
		addLuaSprite('vignette', true);

		makeAnimatedLuaSprite('zerosooth', 'mechanics/zerosooth', 460, 0, true)
		addAnimationByPrefix('zerosooth', 'zerosooth', 'zerosooth', 24, true);
		addAnimationByPrefix('zerosooth', 'zeroangry', 'zeroangry', 28, true);
		setProperty('zerosooth.alpha', 0.001); --0.001
		addLuaSprite('zerosooth')
	end
end

function onBeatHit()
	if curBeat % 16 == 0 and barAmount > 150 then
		objectPlayAnimation('zerosooth','zerosooth',true);
	elseif curBeat % 16 == 0 and barAmount <= 150 then
			objectPlayAnimation('zerosooth','zeroangry',true);
	end
end

function onUpdate(elapsed)
    if getPropertyFromClass('ClientPrefs', 'mechanics') == true then
		if curBeat >= 1 then
			if redbar == true then
				setProperty('barBlue.color', getColorFromHex('ff0400'))
			elseif redbar == false then
				setProperty('barBlue.color', getColorFromHex('15E9FF'))
			end
			if barAmount >= 222 then
				redbar = true;
				setProperty('health', getProperty('health')-0.005);
				cameraShake("hud", 0.002, 0.4);
			end
			if barAmount <= 65 then
				redbar = true;
				setProperty('health', getProperty('health')-0.005);
				cameraShake("hud", 0.002, 0.4);
			end
			if barAmount >= 65 and barAmount <= 222 then
				redbar = false;
			end
			if barAmount<0 then
				setProperty('health', getProperty('health')-200);
				setProperty('barBlue.alpha', 0)
			end
			if burst == false then
					if barAmount ~= 0 then
					barAmount= barAmount - (elapsed * 9)
					setProperty('barBlue.scale.y', barAmount)
					elseif barAmount ~= 0 and curBeat >= 320 then
					barAmount= barAmount - (elapsed * 11)
					setProperty('barBlue.scale.y', barAmount)
				end		
			end
		end
		if keyJustPressed('temper_1') and temper1cooldown == false then -- bar shit
			barAmount= barAmount + 40
			runTimer('CooldownE', 0.01);
		elseif keyJustPressed('temper_2') and temper2cooldown == false then
			barAmount= barAmount - 80
			runTimer('CooldownQ', 0.01);
		end
	end
end

function onTimerCompleted(tag, l, ll)
    if tag == 'CooldownE' then
		temper1cooldown = true
		runTimer('CooldownOffE', 3);
	elseif tag == 'CooldownOffE' then
		temper1cooldown = false
	elseif tag == 'CooldownQ' then
		temper2cooldown = true
		runTimer('CooldownOffQ', 3);
	elseif tag == 'CooldownOffQ' then
		temper2cooldown = false
    end
end
  

function goodNoteHit(id, direction, noteType, isSustainNote)
    if getPropertyFromClass('ClientPrefs', 'mechanics') == true then
		if not isSustainNote then
				if burst == false then
				barAmount= barAmount + 4
				setProperty('barBlue.scale.y', barAmount)
				end	
				if barAmount > 275 and burst == false then
						barAmount=275
				end
				if burst == true then
					addScore(350);
				end	
		if burst == true then
			local health = getProperty('health')
			heatlh = health + 0.023
			end
		end
	end
end

function noteMiss()
    if getPropertyFromClass('ClientPrefs', 'mechanics') == true then
		if not isSustainNote then
			if burst == false then
			barAmount= barAmount - 15
			setProperty('barBlue.scale.y', barAmount)
			end	
			if barAmount > 275 and burst == false then
					barAmount=275
			end
			if burst == true then
				addScore(350);
			end	
	if burst == true then
		local health = getProperty('health')
		heatlh = health + 0.023
		end
	end
end
end
