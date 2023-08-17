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
        setProperty('red.visible', true)
        setProperty('red2.visible', true)

        doTweenAlpha('byered', 'red', 0, 0.7, 'linear');
    elseif curStep == 1 then
        setProperty('black.visible', true)
        doTweenAlpha('byeblack', 'black', 0, 5, 'linear');
    end
end

function onTweenCompleted(tag)
    if tag == 'byeblack' then
        removeLuaSprite('black')
    elseif tag == 'byered' then
        removeLuaSprite('red')
    end
end