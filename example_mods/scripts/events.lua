--Script Config: Images
--Find these inside of mods/images
local ThreeImage = 'ready'
local TwoImage = 'set'
local OneImage = 'go'
local GoImage =	'go'

--Script Config: Sounds
--Find these inside of mods/sounds
local ThreeSound = 'intro3'
local TwoSound = 'intro2'
local OneSound = 'intro1'
local GoSound = 'IntroGo'

--Script Config Fade
--controls how the stuff fades out
local FadeTime = 0.5
local FadeEase = 'CircInOut'

local posS = {-100, 720}
local posV = {0, 620}
local on = false
local XYAndDir;

function onCreate()
    defzoom = getProperty('defaultCamZoom'); -- Default Zoom
    defzoomH = getProperty('camHUD.zoom'); -- Default Zoom

	makeLuaSprite('dark', 'dark', 0, 0);
	setScrollFactor('dark', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('dark.scale.x', 1 / defaultCamZoom);
	setProperty('dark.scale.y', 1 / defaultCamZoom);
	setProperty('dark.alpha', 0.0001);
	addLuaSprite('dark', false);

	for i=1,2 do
		makeLuaSprite('bar'..i, nil, 0, posS[i])
		makeGraphic('bar'..i, screenWidth, 100, '000000')
		setObjectCamera('bar'..i, 'other')
		addLuaSprite('bar'..i)
	end

    precacheSound(GoSound)
	precacheSound(OneSound)
	precacheSound(TwoSound)
	precacheSound(ThreeSound)

	makeLuaSprite('CountOne', OneImage, 0, 0)
	screenCenter('CountOne', 'xy')
	setObjectCamera('CountOne', 'other')
	setProperty('CountOne.alpha', 0)

	makeLuaSprite('CountTwo', TwoImage, 0, 0)
	screenCenter('CountTwo', 'xy')
	setObjectCamera('CountTwo', 'other')
	setProperty('CountTwo.alpha', 0)
	
	makeLuaSprite('CountThree', ThreeImage, 0, 0)
	screenCenter('CountThree', 'xy')
	setObjectCamera('CountThree', 'other')
	setProperty('CountThree.alpha', 0)
	
	makeLuaSprite('CountGO', GoImage, 0, 0)
	screenCenter('CountGO', 'xy')
	setObjectCamera('CountGO', 'other')
	setProperty('CountGO.alpha', 0)
	
	addLuaSprite('CountThree', true)
	addLuaSprite('CountTwo', true)
	addLuaSprite('CountOne', true)
	addLuaSprite('CountGO', true)
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
    if name == "MoveArrow" then
        local tableee=mysplit(value2,", "); -- Splits value1 into a table
        value1 = tonumber(value1);

        if value1 < 4 then
            notePosX = getPropertyFromGroup('opponentStrums', value1, 'x');
            notePosY = getPropertyFromGroup('opponentStrums', value1, 'y');
        else
            notee = value1 - 4;
            notePosX = getPropertyFromGroup('playerStrums', notee, 'x');
            notePosY = getPropertyFromGroup('playerStrums', notee, 'y');
        end

        if tableee[1] == "return" then
            tableee[1] = 0;
        else
            newnotePosX = notePosX + tableee[1];
        end
        if tableee[2] == "return" then
            tableee[2] = 0;
        else
            newnotePosY = notePosY + tableee[2];
        end

        duration = tableee[5];
        rotation = tableee[3];
        opacity = tableee[4];

        tableee[1] = tonumber(tableee[1]);
        tableee[2] = tonumber(tableee[2]);
        tableee[3] = tonumber(tableee[3]);
        tableee[4] = tonumber(tableee[4]);
        tableee[5] = tonumber(tableee[5]);

        if value1 == 0 then
            noteTweenX("x1",0,newnotePosX,duration,"quartInOut");
            noteTweenY("y1",0,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r1",0,rotation,duration, "quartInOut");
            noteTweenAlpha("o1",0,opacity,duration,"quartInOut");
        elseif value1 == 1 then
            noteTweenX("x2",1,newnotePosX,duration,"quartInOut");
            noteTweenY("y2",1,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r2",1,rotation,duration, "quartInOut");
            noteTweenAlpha("o2",1,opacity,duration,"quartInOut");
        elseif value1 == 2 then
            noteTweenX("x3",2,newnotePosX,duration,"quartInOut");
            noteTweenY("y3",2,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r3",2,rotation,duration, "quartInOut");
            noteTweenAlpha("o3",2,opacity,duration,"quartInOut");
        elseif value1 == 3 then
            noteTweenX("x4",3,newnotePosX,duration,"quartInOut");
            noteTweenY("y4",3,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r4",3,rotation,duration, "quartInOut");
            noteTweenAlpha("o4",3,opacity,duration,"quartInOut");
        elseif value1 == 4 then
            noteTweenX("x5",4,newnotePosX,duration,"quartInOut");
            noteTweenY("y5",4,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r5",4,rotation,duration, "quartInOut");
            noteTweenAlpha("o5",4,opacity,duration,"quartInOut");
        elseif value1 == 5 then
            noteTweenX("x6",5,newnotePosX,duration,"quartInOut");
            noteTweenY("y6",5,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r6",5,rotation,duration, "quartInOut");
            noteTweenAlpha("o6",5,opacity,duration,"quartInOut");
        elseif value1 == 6 then
            noteTweenX("x7",6,newnotePosX,duration,"quartInOut");
            noteTweenY("y7",6,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r7",6,rotation,duration, "quartInOut");
            noteTweenAlpha("o7",6,opacity,duration,"quartInOut");
        elseif value1 == 7 then
            noteTweenX("x8",7,newnotePosX,duration,"quartInOut");
            noteTweenY("y8",7,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r8",7,rotation,duration, "quartInOut");
            noteTweenAlpha("o8",7,opacity,duration,"quartInOut");
        end
    end
    if name == 'DodgeMechanic' then
		debugprint('Dodge Mechnic (Event Note)')
	end
    if name == "CustomCountdown" then
		text = value1;
		sound = value2;
		if text == 'three' and sound == 'on' then --Three
			setProperty('CountThree.alpha', 1)
			doTweenAlpha('ThreeFade', 'CountThree', 0, FadeTime, FadeEase)
			playSound(ThreeSound)
		elseif text == 'two' and sound == 'on' then --Two
			setProperty('countdownReady.visible', false)
			setProperty('CountTwo.alpha', 1)
			doTweenAlpha('TwoFade', 'CountTwo', 0, FadeTime, FadeEase)
			playSound(TwoSound)
		elseif text == 'one' and sound == 'on' then --One
			setProperty('countdownSet.visible', false)
			setProperty('CountOne.alpha', 1)
			doTweenAlpha('OneFade', 'CountOne', 0, FadeTime, FadeEase)
			playSound(OneSound)
		elseif text == 'go' and sound == 'on' then --Go!
			setProperty('countdownGo.visible', false)
			setProperty('CountGO.alpha', 1)
			doTweenAlpha('GoFade', 'CountGO', 0, FadeTime, FadeEase)
			playSound(GoSound)
		elseif text == 'three' and sound == 'off' then --Three
			setProperty('CountThree.alpha', 1)
			doTweenAlpha('ThreeFade', 'CountThree', 0, FadeTime, FadeEase)
		elseif text == 'two' and sound == 'off' then --Two
			setProperty('countdownReady.visible', false)
			setProperty('CountTwo.alpha', 1)
			doTweenAlpha('TwoFade', 'CountTwo', 0, FadeTime, FadeEase)
		elseif text == 'one' and sound == 'off' then --One
			setProperty('countdownSet.visible', false)
			setProperty('CountOne.alpha', 1)
			doTweenAlpha('OneFade', 'CountOne', 0, FadeTime, FadeEase)
		elseif text == 'go' and sound == 'off' then --Go!
			setProperty('countdownGo.visible', false)
			setProperty('CountGO.alpha', 1)
			doTweenAlpha('GoFade', 'CountGO', 0, FadeTime, FadeEase)
		end
	end
	if name == 'Cinema' then
        onChange()
    end
    if name == "Set Cam Zoom" then
        if value2 == '' then
      	  	setProperty("defaultCamZoom",value1)
			debugPrint(value2 )
		else
            doTweenZoom('camz','camGame',tonumber(value1),tonumber(value2),'sineInOut')
		end    
    end
    if name == 'Better Zoom' and cameraZoomOnBeat then
		gamezoom = tonumber(value1);
        hudzoom = tonumber(value2);
		if (gamezoom ~= '' or gamezoom ~= nil) then
            doTweenZoom('GzoomIn', 'camGame', defzoom + gamezoom, 0.01, 'linear');
		else
			doTweenZoom('GzoomIn', 'camGame', defzoom + 0.015, 0.01, 'linear');
		end
		
		if (hudzoom ~= '' or hudzoom ~= nil) then
            doTweenZoom('HzoomIn', 'camHUD', defzoomH + hudzoom, 0.01, 'linear');
		else
			doTweenZoom('HzoomIn', 'camHUD', defzoomH + 0.03, 0.01, 'linear');
        end
		
        --debugPrint('Event triggered: ', gamezoom, hudzoom);
    end
    if name == 'Camera Tween Pos' then
		XYAndDir = Split(tostring(value1), ', ');
		doTweenX('CameraEventX', 'camFollowPos', tonumber(XYAndDir[1]), tonumber(XYAndDir[3]), tostring(value2));
		doTweenY('CameraEventY', 'camFollowPos', tonumber(XYAndDir[2]), tonumber(XYAndDir[3]), tostring(value2));
        setProperty('isCameraOnForcedPos', true);
	end
end

function onUpdate(elapsed)
	if on then
		for i=1,2 do
			setProperty('bar'..i..'.y', lerp(getProperty('bar'..i..'.y'), posV[i], elapsed))
		end
		setProperty('camHUD.zoom', lerp(getProperty('camHUD.zoom'), 0.72, elapsed))
		setProperty('camGame.zoom', lerp(getProperty('camGame.zoom'), getProperty('defaultCamZoom') - 0.1, elapsed))
		setProperty('camZooming', false)
	else
		for i=1,2 do
			setProperty('bar'..i..'.y', lerp(getProperty('bar'..i..'.y'), posS[i], elapsed))
		end
	end
end

function onTweenCompleted(name, tag)
	if name == 'camz' then
		setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
	end
    if tag == 'GzoomIn' then
		doTweenZoom('zoomOut', 'camGame', defzoom, 0.5, 'quadInOut');
	elseif tag == 'HzoomIn' then
		doTweenZoom('zoomOut', 'camHUD', defzoomH, 0.5, 'quadInOut');
    end
    if tag == 'CameraEventX' then
        setProperty('camFollow.x', tonumber(XYAndDir[1]));
    end
    if tag == 'CameraEventY' then
        setProperty('camFollow.y', tonumber(XYAndDir[2]));
    end
end

function mysplit (inputstr, sep)
    if sep == nil then
        sep = "%s";
    end
    local t={};
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str);
    end
    return t;
end

function onChange()
	if on then on = false else on = true end
end

--taken from https://github.com/HaxeFlixel/flixel/blob/master/flixel/math/FlxMath.hx#L103
function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch('(.-)'..delimiter) do
        table.insert(result, match);
    end
    return result;
end

