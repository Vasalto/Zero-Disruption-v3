function onCreate()
    makeLuaSprite('black','',-700,0)
	makeGraphic('black',2500,2000,'000000')
    addLuaSprite('black', true)
    setProperty('black.visible', false)   
end

function onStepHit()
    if curStep == 144 then
        setProperty('black.visible', true)
        doTweenAlpha('byeblack', 'black', 0, 0.7, 'linear');
    end
end

function onTweenCompleted(tag)
    if tag == 'byeblack' then
        removeLuaSprite('black')
        close(true);
    end
end