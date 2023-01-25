function onCreate()
    makeLuaSprite('black','',-700,0)
	makeGraphic('black',2500,2000,'000000')
    addLuaSprite('black', true)
    setProperty('black.visible', false)   

    makeLuaSprite('red','',-700,0)
	makeGraphic('red',2500,2000,'FF0000')
    addLuaSprite('red', true)
    setObjectCamera('red', 'hud')
    setProperty('red.visible', false)   
end

function onStepHit()
    if curStep == 144 then
        setProperty('black.visible', true)
        doTweenAlpha('byeblack', 'black', 0, 0.7, 'linear');
    elseif curBeat == 420 then
        setProperty('red.visible', true)
        doTweenAlpha('byered', 'red', 0, 0.7, 'linear');
    end
end

function onTweenCompleted(tag)
    if tag == 'byeblack' then
        removeLuaSprite('black')
    elseif tag == 'byered' then
        removeLuaSprite('red')
    end
end