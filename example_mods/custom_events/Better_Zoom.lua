function onCreate() -- Defining Variables
    defzoom = getProperty('defaultCamZoom'); -- Default Zoom
    defzoomH = getProperty('camHUD.zoom'); -- Default Zoom
end

function onEvent(name, value1, value2)
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
end

function onTweenCompleted(tag)
    if tag == 'GzoomIn' then
		doTweenZoom('zoomOut', 'camGame', defzoom, 0.5, 'quadInOut');
	elseif tag == 'HzoomIn' then
		doTweenZoom('zoomOut', 'camHUD', defzoomH, 0.5, 'quadInOut');
    end
end