local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 420.95;
local yy = 413;
local xx2 = 952.9;
local yy2 = 450;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()

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
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.8)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                --triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                --triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                --triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
               -- triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                --triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
               -- triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
               -- triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                --triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                --triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                --triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',0.9)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                --triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                --triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                --triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                --triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
               -- triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
               -- triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end

	for i = 0, getProperty('unspawnNotes.length')-1 do
		
		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'BloodSplash');
	
	end
	
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
		doTweenAlpha('VignetteAlpha', 'vignette', 0.2, 0.8, 'quintOut');
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
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

function goodNoteHit()

	health = getProperty('health')

	if getProperty('health') > 0.0 then
		
        setProperty('health', health- 0.023);
	
    end
	
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end