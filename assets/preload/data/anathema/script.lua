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
    precacheImage('vignettes/vintage')
	
	setProperty('cameraSpeed', 2.2);

	setProperty('health', 2.0);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');

    makeLuaSprite('redLight','stages/2/red', -630, -350);
    scaleObject('redLight', 12, 12);
    setProperty('redLight.alpha', 0)
    setScrollFactor('redLight', 1, 1);
    setObjectCamera('redLight', 'hud')
    addLuaSprite('redLight', true)

    makeLuaSprite('black','',-600,0)
	makeGraphic('black',3000,2000,'000000')
    addLuaSprite('black', true)
    setProperty('black.visible', false)  

	makeLuaSprite('LMAOTENTACLES', 'tentaclesblack', 0, 0);
	setProperty('LMAOTENTACLES.alpha', 0);
	setObjectCamera('LMAOTENTACLES', 'other')
	addLuaSprite('LMAOTENTACLES', true);

    makeLuaSprite('vignette', 'blackvignette', 0, 0);
	setProperty('vignette.alpha', 0);
	setObjectCamera('vignette', 'other')
	addLuaSprite('vignette', true);

    setProperty('gf.visible', true)

    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'rekt'); --put in mods/music/
end

function redfade()
    doTweenAlpha('byebye','redLight',1,0.5,'sinein')
    --setProperty('redLight.alpha',1)
    runTimer('redfade', 0.7)
end



    function onTimerCompleted(tag, l, ll)
        if tag == 'redfade' then
            doTweenAlpha('byebye', 'redLight', 0, 0.5, 'linear');
        end
    end

    function onBeatHit()
        if curBeat % 16 == 0 then
            redfade()
        elseif curBeat == 1 then
            redfade()
        end
        if curBeat == 392 then
            setProperty('black.visible', true)
             setProperty('black.alpha', 1)
        end
    end

--[[bro aint nobody got time for this :skull:


-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end
end]]