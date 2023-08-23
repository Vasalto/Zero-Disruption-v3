function onCreate()
    makeLuaSprite('black','',-600,0)
	makeGraphic('black',3000,2000,'000000')
    addLuaSprite('black', true)
    setProperty('black.visible', false)   

    makeLuaSprite('red','',-700,0)
	makeGraphic('red',2500,2000,'FF0000')
    addLuaSprite('red', true)
    setObjectCamera('red', 'hud')
    setProperty('red.visible', false)   

    makeLuaSprite('red2','',-700,0)
	makeGraphic('red2',2500,2000,'FF0000')
    addLuaSprite('red2', false)
    setObjectCamera('red2', 'camHUD')
    setProperty('red2.visible', false)   
    setBlendMode('red2', 'multiply')

    makeAnimatedLuaSprite('zeroLook', 'mechanics/lookAttack', 0, 0)
    addAnimationByPrefix('zeroLook', 'lookLol', 'lookLol', 24, true)
    screenCenter('zeroLook')
    addLuaSprite('zeroLook', true)
    setScrollFactor('zeroLook', 0, 0)
    objectPlayAnimation('zeroLook', 'lookLol')
    setProperty('zeroLook.alpha', 0)
    scaleObject('zeroLook', 1.5, 1.5)

    setProperty('skipCountdown', true)

end

function onCreatePost()
    setProperty('black.visible', true)
end

function onStepHit()
    if curStep == 31 then
        setProperty('black.visible', true)
        setProperty('black.alpha', 1)
        doTweenAlpha('byeblack', 'black', 0, 0.7, 'linear');
    elseif curBeat == 268 then
        removeLuaSprite('zeroLook')
        removeLuaSprite('black')
        setProperty('red.visible', true)
        setProperty('red2.visible', true)

        doTweenAlpha('byered', 'red', 0, 0.7, 'linear');
    elseif curBeat == 263 then
        doTweenAlpha('lookTweenIn', 'zeroLook', 1, 1.97, 'linear')
    elseif curBeat == 267 then
        setProperty('black.alpha', 1)
        scaleObject('zeroLook', 2, 2)
        screenCenter('zeroLook')
    elseif curStep == 1 then
        setProperty('black.visible', true)
        doTweenAlpha('byeblack', 'black', 0, 5, 'linear');
    end
    if curStep == 1068 and curStep == 1070 then
        setProperty('zeroLook.alpha', 1)
    elseif curStep == 1069 and 1071 then
        setProperty('zeroLook.alpha', 0)
    end
end

function onTweenCompleted(tag)
    if tag == 'byered' then
        removeLuaSprite('red')
    elseif tag == 'lookTweenIn' then
        setProperty('zeroLook.alpha', 0)
    end
end