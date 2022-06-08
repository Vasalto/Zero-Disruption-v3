function onCreate()
    precacheImage('mechanics/zerojumpscare')
    precacheImage('mechanics/buttons')

    makeLuaSprite('redLight','stages/2/red', -630, -350);
    scaleObject('redLight', 12, 12);
    setProperty('redLight.alpha', 0)
    setScrollFactor('redLight', 1, 1);
    setObjectCamera('redLight', 'hud')
    addLuaSprite('redLight', true)

    --[[
        --should I make it into a graphic? -slithy
        makeLuaSprite('redLight','',0,400)
        makeGraphic('redLight',1280,100,'c81f0e')
        setProperty('redLight.scale.x', 12)
        setProperty('redLight.scale.y', 12)
        setProperty('redLight.alpha', 1)
		addLuaSprite('redLight', true);
		setObjectCamera('redLight', 'other');
    ]]

    makeAnimatedLuaSprite('buttons','mechanics/buttons', 310, 200);
    setScrollFactor('buttons', 1, 1);
    addAnimationByPrefix('buttons', 'buttons', 'buttons', 25, true);
    setObjectCamera('buttons','camhud');
    scaleObject('buttons', 0.6, 0.6);
    setProperty('buttons.alpha', 0);
    addLuaSprite('buttons', true)
    makeAnimatedLuaSprite('zeroj','mechanics/zerojumpscare', 630, -250);
    setScrollFactor('zeroj', 1, 1);
    setObjectCamera('zeroj','hud');
    addAnimationByPrefix('zeroJ', 'zerojumpscareloop', 'zerojumpscareloop', 25, true);
    addAnimationByPrefix('zeroj', 'entry', 'zerojumpscareentry', 24, false)
    addAnimationByPrefix('zeroj', 'loop', 'zerojumpscareloop', 24, true)
    addAnimationByPrefix('zeroj', 'exit', 'zerojumpscareexit', 24, false)
    setProperty('zeroj.alpha', 0);
    addLuaSprite('zeroj', true)
end


function onUpdate()
    if curStep == 64 then
        removeLuaSprite('buttons')
    if curBeat == 200 then
        removeLuaSprite('zeroj')
    end
    if curBeat == 319 then
        setProperty('front2.alpha', 1)
    end
end
end

function redfade()
    doTweenAlpha('byebye','redLight',1,0.5,'sinein')
    --setProperty('redLight.alpha',1)
    runTimer('redfade', 0.7)
end


function entryz()
    objectPlayAnimation('zeroj', 'entry', true);
    setProperty('zeroj.alpha', 1);
    runTimer('entryz', 0.5)
end

function buttfade()
    doTweenAlpha('buttons', 'buttons', 1, 2, 'quintOut');
    runTimer('buttout', 5)
end

function onTimerCompleted(tag, l, ll)
    if tag == 'entryz' then
        objectPlayAnimation('zeroj', 'loop', true);
        setProperty('zeroj.y', -217);
        setProperty('zeroj.x', 681);
        runTimer('entryc', 2)
    elseif tag == 'entryc' then
        objectPlayAnimation('zeroj', 'exit', true);
        runTimer('entryv', 0.3)
    elseif tag == 'entryv' then
        setProperty('zeroj.alpha', 0);
        setProperty('zeroj.y', -250);
        setProperty('zeroj.x', 630);
    elseif tag == 'buttout' then
        doTweenAlpha('buttons', 'buttons', 0, 2, 'quintOut');
    elseif tag == 'redfade' then
    	doTweenAlpha('byebye', 'redLight', 0, 0.5, 'linear');
    end
end
function onBeatHit()
    if curBeat % 16 == 0 then
        redfade()
    elseif curBeat == 1 then
        redfade()
        buttfade()
    elseif curBeat == 50 or curBeat == 90 or curBeat == 125 or curBeat == 150 then
        entryz()
    end
end