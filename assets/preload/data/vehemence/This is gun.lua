-- Define the counter
local counter = 3

-- on create
function onCreate()
    makeAnimatedLuaSprite('Battery', 'battery', 990.5, 540, true)
    addAnimationByPrefix('Battery', 'battery1', 'full', 24, false);
    addAnimationByPrefix('Battery', 'battery2', 'medium', 24, false);
    addAnimationByPrefix('Battery', 'battery3', 'low', 24, false);
    addAnimationByPrefix('Battery', 'battery4', 'none', 24, false);

    scaleObject('Battery', 0.3, 0.3)
    addLuaSprite('Battery')
    setObjectCamera('Battery', 'HUD') 

    makeLuaSprite('whiteBG', '', 0, 0)
    makeGraphic('whiteBG', 2000, 2000, 'FFFFFF')
    scaleObject('whiteBG', 2, 2)
    setObjectCamera('whiteBG', 'HUD') 
    setProperty('whiteBG.alpha', 0)
    addLuaSprite('whiteBG', true)

end



-- Run a timer every 10 seconds that increases the counter by one
 function timerIncrement()
    if counter < 3 then
        counter = counter + 1
    end
 end

-- battery mech
local reload = false
local shot = true

local drain = true

local function baterycount(elapsed)
    if counter == 3 then
        -- Battery 0 animation
        objectPlayAnimation('Battery','battery1',true);
        reload = false
        shot = true
    elseif counter == 2 then
        -- Battery 1 animation
        objectPlayAnimation('Battery','battery2',true);
    elseif counter == 1 then
        -- Battery 2 animation
        objectPlayAnimation('Battery','battery3',true);
    elseif counter == 0 then
        -- Battery 3 animation
        objectPlayAnimation('Battery','battery4',true);
        reload = true
        shot = false
    end
end
-- Function to handle the key press event
local function handleKeyPress(key)
    -- If the "E" key is pressed, increase the counter
    if keyJustPressed('temper_1') and shot == true then
        if counter >= 1 then
            counter = counter - 1
           -- debugPrint("Decreased the counter to "..counter)
            characterPlayAnim('gf', 'shoot', false);
            setProperty('gf.specialAnim', true);
            setProperty('whiteBG.alpha', 0.7)
            doTweenAlpha('whiteBG', 'whiteBG', 0, 0.3, 'linear')
            playSound('plasmashot')
            runTimer('Draincool', 0.1)

        end
        if drain == true then
            drain = false

        end
    end
end

local pollo = 0.0001

function onUpdate(elapsed)
    handleKeyPress()
    baterycount()
     if curBeat >= 1 then
        if drain == true then
            setProperty('health', getProperty('health')- (elapsed * pollo * 30));
         --   cameraShake("hud", 0.002, 0.4);
           -- playSound('alert', 0.2  )
        end
     end
end
--draiin true
---
    
function onBeatHit()
    if curBeat % 4 == 2 then
        if counter == 0 and reload == true then
            runTimer('Increase', 0.1)
        end
    end
  --  if curBeat % 4 == 2 then
    --    local cold = math.random(1,10)
   --         if cold == 2 then
   --             drain = true
   --         end
  --  end
end
---- tag function
function onTimerCompleted(tag)
    if tag == 'Increase'and counter < 3 and reload == true then
        timerIncrement()
        runTimer('Increase', 1)
        characterPlayAnim('gf', 'reloadLoop', true);
        setProperty('gf.specialAnim', true);
        playSound('reload')
    elseif tag == 'Draincool' then
        drain = false
        runTimer('Pollon', 5)
    elseif tag == 'Pollon' then
        drain = true
    end
end
--- function



function goodNoteHit()
    setProperty('health', math.min(getProperty('health'), 2 - 0.08))
end

function noteMiss()
    pollo = pollo + 0.0010
end

function opponentNoteHit()
    if drain == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
        setProperty('health', health- 0.0001);
    end
end
end