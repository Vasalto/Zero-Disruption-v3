function onCreate()
    precacheImage('mechanics/zerojumpscare')
	precacheImage('shadow')
    precacheImage('dark')

	makeLuaSprite('dark', 'dark', -630, -350);
	setScrollFactor('dark', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('dark.scale.x', 1 / defaultCamZoom);
	setProperty('dark.scale.y', 1 / defaultCamZoom);
	setProperty('dark.alpha', 0.0001);
	scaleObject('dark', 13, 13);
	addLuaSprite('dark', false);

    makeAnimatedLuaSprite('shadow', 'stages/2/shadow', -250.5, 250, true)
	addAnimationByPrefix('shadow', 'shadowa', 'alextween', 24, false);
	addAnimationByPrefix('shadow', 'shadowb', 'zerotweenfront', 24, false);
	addAnimationByPrefix('shadow', 'shadowc', 'zerotweenright', 24, false);
	addAnimationByPrefix('shadow', 'shadowd', 'zerotweenleft', 24, false);
	setProperty('shadow.alpha', 0);--0
	scaleObject('shadow', 0.9, 0.9);
	addLuaSprite('shadow')

    makeAnimatedLuaSprite('zeroj','mechanics/zerojumpscare', 630, -250);
    setScrollFactor('zeroj', 1, 1);
    setObjectCamera('zeroj','hud');
    addAnimationByPrefix('zeroJ', 'zerojumpscareloop', 'zerojumpscareloop', 25, true);
    addAnimationByPrefix('zeroj', 'entry', 'zerojumpscareentry', 24, false)
    addAnimationByPrefix('zeroj', 'loop', 'zerojumpscareloop', 24, true)
    addAnimationByPrefix('zeroj', 'exit', 'zerojumpscareexit', 24, false)
    setProperty('zeroj.alpha', 0);
    addLuaSprite('zeroj', true)

    makeLuaSprite('vignette', 'blackvignette', 0, 0);
	setProperty('vignette.alpha', 0);
	setObjectCamera('vignette', 'other')
	addLuaSprite('vignette', true);

	setProperty('cameraSpeed', 2.2);
end

function onUpdate()
    if curBeat == 200 then
        removeLuaSprite('zeroj')
    end
    if curBeat == 319 then
        setProperty('front2.alpha', 1)
    end
end

function entryz()
    objectPlayAnimation('zeroj', 'entry', true);
    setProperty('zeroj.alpha', 0.8);
    runTimer('entryz', 0.5)
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
    elseif tag == 'redfade' then
    	doTweenAlpha('byebye', 'redLight', 0, 0.5, 'linear');
    elseif tag == 'Alexappear' then
        Alexa()
        runTimer('ZeroAppear', 3);
        runTimer('Fade', 2);
    elseif tag == 'ZeroAppear' then
        Alexab()
        runTimer('ZeroAppearRight', 3);
        runTimer('Fade', 2);
    elseif tag == 'ZeroAppearRight' then
        Alexac()
        runTimer('ZeroAppearLeft', 3);
        runTimer('Fade', 2);

    elseif tag == 'ZeroAppearLeft' then
        Alexad()
        runTimer('Fade', 2);
    elseif tag == 'Fade' then
        doTweenAlpha('shadow', 'shadow', 0, 0.5, 'quintOut');
    end
end

function onBeatHit()
    if curBeat == 50 or curBeat == 90 or curBeat == 125 or curBeat == 150 then
        entryz()
    elseif getProperty('curBeat') == 1 then
        doTweenAlpha('dark', 'dark', 0, 0.2, 'quintOut');
    elseif getProperty('curBeat') == 192 then
        doTweenAlpha('vignette', 'vignette', 1, 10, 'quintOut');
    elseif getProperty('curBeat') == 212 then
        doTweenAlpha('dark', 'dark', 1, 8, 'quintOut');
        doTweenAlpha('gf', 'gf', 0, 8, 'quintOut');
        doTweenAlpha('dad', 'dad', 0, 8, 'quintOut');
    elseif getProperty('curBeat') == 237 then
        doTweenAlpha('dad', 'dad', 1, 2, 'quintOut');
    elseif getProperty('curBeat') == 256 then
        doTweenAlpha('boyfriend', 'boyfriend', 0, 1, 'quintOut');
        doTweenAlpha('hudAlpha', 'camHUD', 0, 0.2, 'quintOut');
        runTimer('Alexappear', 0.5)
    elseif getProperty('curBeat') == 271 then
        doTweenAlpha('boyfriend', 'boyfriend', 1, 1, 'quintOut');
        doTweenAlpha('hudAlpha', 'camHUD', 1, 0.2, 'quintOut');
        doTweenAlpha('dad', 'dad', 0, 1, 'quintOut');
    elseif getProperty('curBeat') == 288 then
        doTweenAlpha('dad', 'dad', 1, 1, 'quintOut');
        runTimer('ZeroAppear', 0.5)
    elseif getProperty('curBeat') == 320 then
        doTweenAlpha('gf', 'gf', 1, 1, 'quintOut');
        doTweenAlpha('zerosooth', 'zerosooth', 1, 1, 'quintOut');
        doTweenAlpha('dark', 'dark', 0, 1, 'quintOut');
        doTweenAlpha('vignette', 'vignette', 0, 1, 'quintOut');
    end
end

function Alexa()
	doTweenAlpha('shadow', 'shadow', 1, 1, 'quintOut');
	objectPlayAnimation('shadow', 'shadowa', true);
end

function Alexab()
	doTweenAlpha('shadow', 'shadow', 1, 1, 'quintOut');
	objectPlayAnimation('shadow', 'shadowb', true);
	setProperty('shadow.x', 600);
	setProperty('shadow.y', 100);

end

function Alexac()
	doTweenAlpha('shadow', 'shadow', 1, 1, 'quintOut');
	objectPlayAnimation('shadow', 'shadowc', true);
	setProperty('shadow.y', 100);
	if curBeat >= 260 then
		setProperty('shadow.x', 700);
		setProperty('shadow.y', 260);
	elseif curBeat >= 271 then
		setProperty('shadow.x', 700);
		setProperty('shadow.y', 260);
	end
end

function Alexad()
	doTweenAlpha('shadow', 'shadow', 1, 1, 'quintOut');
	objectPlayAnimation('shadow', 'shadowd', true);
	setProperty('shadow.x', -400);
	setProperty('shadow.y', 200);
end