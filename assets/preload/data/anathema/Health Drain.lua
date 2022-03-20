function onCreate()
    function opponentNoteHit(id, direction, noteType)
        setProperty("health", getProperty("health") - 0.009)
        if getProperty("health") < 0.001 then
            setProperty("health", 0.001)
        end
    end
end