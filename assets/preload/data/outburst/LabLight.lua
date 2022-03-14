function onBeatHit()
	if curBeat % 22 == 0 then
		objectPlayAnimation('redLight', 'redLight', true);
	elseif curBeat == 1 then
		objectPlayAnimation('redLight', 'redLight', true);
    end
end