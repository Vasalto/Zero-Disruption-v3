local barAmount = 138
local burst = false
local soundPlayed = false
local soundPlayVar = false

function onCreate()
	precacheImage('zerosooth')

-- bar bg or smthng
	makeLuaSprite('barNormal', 'temper', 1190.5, 145)
	setObjectCamera('barNormal', 'hud')
	addLuaSprite('barNormal')
-- da actual bar
	makeLuaSprite('barBlue', 'barBlue', 1231, 430)
	makeGraphic('barBlue', 18, 1, '15E9FF')
	setObjectCamera('barBlue', 'hud')
	setProperty('barBlue.origin.y', 1)
	addLuaSprite('barBlue')
	setProperty('barBlue.scale.y', barAmount)

	makeLuaSprite('barline', 'temperlines', 1204.5, 145)
	setObjectCamera('barline', 'hud')
	addLuaSprite('barline')

	makeLuaSprite('vignette', 'blackvignette', 0, 0);
	setProperty('vignette.alpha', 0);
	setObjectCamera('vignette', 'other')
	addLuaSprite('vignette', true);

	makeAnimatedLuaSprite('zerosooth', 'zerosooth', 337.5, -292, true)
	addAnimationByPrefix('zerosooth', 'zerosooth', 'zerosooth', 24, true);
	addAnimationByPrefix('zerosooth', 'zeroangry', 'zeroangry', 28, true);
	setProperty('zerosooth.alpha', 0);
	addLuaSprite('zerosooth')
	


end

function onBeatHit()
	if curBeat % 16 == 0 and barAmount > 150 then
		objectPlayAnimation('zerosooth','zerosooth',true);
	elseif curBeat % 16 == 0 and barAmount <= 150 then
			objectPlayAnimation('zerosooth','zeroangry',true);
	end
end

function onUpdate()
	if curBeat >= 1 then
		if barAmount >= 222 then
			setProperty('health', getProperty('health')-0.005);
			cameraShake("hud", 0.002, 0.4);
		end
		if barAmount <= 65 then
			setProperty('health', getProperty('health')-0.005);
			cameraShake("hud", 0.002, 0.4);
		end
		if barAmount<0 then
			setProperty('health', getProperty('health')-200);
		end
		if burst == false then
			    if barAmount ~= 0 then
  	 	     	barAmount= barAmount - 0.1
				setProperty('barBlue.scale.y', barAmount)
				elseif barAmount ~= 0 and curBeat >= 320 then
  	 	     	barAmount= barAmount - 0.2
				setProperty('barBlue.scale.y', barAmount)
			end		
		end
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') and E == true then -- bar shit
		barAmount= barAmount + 40
		runTimer('CooldownE', 0.1);

		--setProperty('boyfriend.specialAnim', true)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Q') and Q == true  then
		barAmount= barAmount - 80
		runTimer('CooldownQ', 0.1);

    
    end
end

E = true
Q = true


function onTimerCompleted(tag, l, ll)
    if tag == 'CooldownE' then
        -- your code here
		--debugPrint("Can't Press")
		E = false
		runTimer('CooldownOffE', 3);
	elseif tag == 'CooldownOffE' then
		E = true
		--debugPrint("You can press again")
	elseif tag == 'CooldownQ' then
        -- your code here
		--debugPrint("Can't Press")
		Q = false
		runTimer('CooldownOffQ', 3);
	elseif tag == 'CooldownOffQ' then
		Q = true
		--debugPrint("You can press again")
    end
end
  

function goodNoteHit(id, direction, noteType, isSustainNote)
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

function noteMiss()
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
