--SCRIPT BY CAKIEYEE

function onCreate()
    if (difficulty) == 2 then
        makeLuaText('diffuculty', 'Hard Mode' , 500, 388, 618) --chad mode
    end

    if (difficulty) == 1 then
        makeLuaText('diffuculty', 'Normal Mode' , 500, 388, 618)--average mode
    end

    if (difficulty) == 0 then
        makeLuaText('diffuculty', 'Easy Mode' , 500, 388, 618)--bitch mode
    end

    setTextAlignment('diffuculty', 'left')
    setTextSize('diffuculty', 20)
    addLuaText('diffuculty')
    setObjectCamera('diffuculty', 'camother')

    if (downscroll) == true then
        setProperty('diffuculty.y', 40)
        setProperty('diffuculty.x', 0)
        else
        setProperty('diffuculty.y', 680)
        setProperty('diffuculty.x', 0)
    end
    
    makeLuaText('song', 'Now Playing: ' .. (songName), 500, 388, 618)
    setTextAlignment('song', 'left')
    setTextSize('song', 20)
    addLuaText('song')
    setObjectCamera('song', 'camother')
      
    if (downscroll) == true then
    setProperty('song.y', 0)
    setProperty('song.x', 0)
    else
    setProperty('song.y', 640)
    setProperty('song.x', 0)
    end
end