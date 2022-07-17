--THIS IS THE LUA FILE FOR THE BG ELEMENTS BC I DON'T KNOW FLXTWEEN LOL -slithy
function onCreate()
	makeLuaSprite('cell','stages/1/elevatorandtubes/b', 1040, 105);
	setScrollFactor('cell', 1, 1);

	makeLuaSprite('cell2','stages/1/elevatorandtubes/c', 1240, 475); --menor de 500 sube
	setScrollFactor('cell2', 1, 1);

	makeLuaSprite('cell3','stages/1/elevatorandtubes/a', -270, -15);
	setScrollFactor('cell3', 1, 1);

	--makeLuaSprite('elevator','stages/1/elevatorandtubes/elevator', 1390, -335);
	--setScrollFactor('elevator', 1, 1);
	
	makeLuaSprite('elevatorM','stages/1/elevatorandtubes/majoras', 1405, -955);
	setScrollFactor('elevatorM', 1, 1);

	makeLuaSprite('elevatorD','stages/1/elevatorandtubes/dany', 1405, 955);
	setScrollFactor('elevatorD', 1, 1);

	makeLuaSprite('elevatorR','stages/1/elevatorandtubes/rei', 1405, -955);
	setScrollFactor('elevatorR', 1, 1);

	makeLuaSprite('elevatorS','stages/1/elevatorandtubes/slithyocho', 1405, 955);
	setScrollFactor('elevatorS', 1, 1);

	makeLuaSprite('elevatorMY','stages/1/elevatorandtubes/myers', 1405, -955);
	setScrollFactor('elevatorMY', 1, 1);





	---Sprites

	--cells lol
	addLuaSprite('cell', true);
	addLuaSprite('cell2', true);
	addLuaSprite('cell3', true);


	addLuaSprite('elevatorM', false); --majora
	addLuaSprite('elevatorD', false); --dany
	addLuaSprite('elevatorR', false); --rei
	addLuaSprite('elevatorS', false); --slithy + croffle
	addLuaSprite('elevatorMY', false); --myers

	--addLuaSprite('elevator', false); -- elevador
end

function onCreatePost() -- this is the order for the elevator. 0 is behind the background and all shit
	setObjectOrder('cell', 1)
	setObjectOrder('cell2', 1)
	setObjectOrder('cell3', 1)


	setObjectOrder('elevatorM', 1)
	setObjectOrder('elevatorD', 1)
	setObjectOrder('elevatorR', 1)
	setObjectOrder('elevatorS', 1)
	setObjectOrder('elevatorMY', 1)

	--setObjectOrder('elevator', 2)


end


function onBeatHit()
	if curBeat == 4 then
		elevatorup()
end
end


function onUpdate(elapsed)
	if curStep >= 0 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/120)
	  doTweenY(dadTweeneY, 'cell', 50-25*math.sin((currentBeat*0.25)*math.pi),0.001)
	  
	  doTweenY('cell2', 'cell2', 475-25*math.sin((currentBeat*0.25)*math.pi),0.001)

	  doTweenY('cell3', 'cell3', 50-25*math.sin((currentBeat*0.25)*math.pi),0.001)


	  
	end
  end


function elevatorup()
	doTweenY('dadTweenY', 'elevatorM', 700, 10, 'easeOut');
	runTimer('Elevator1', 20)
end

function onTimerCompleted(tag, l, ll)
    if tag == 'Elevator1' then
		doTweenY('dadTweenY', 'elevatorD', -700, 10, 'easeOut');

		runTimer('Elevator2', 20)

	elseif tag == 'Elevator2' then
		doTweenY('dadTweenY', 'elevatorR', 700, 10, 'easeOut');
		runTimer('Elevator3', 20)

	elseif tag == 'Elevator3' then
		doTweenY('dadTweenY', 'elevatorS', -700, 10, 'easeOut');
		runTimer('Elevator4', 28)

	elseif tag == 'Elevator4' then
		doTweenY('dadTweenY', 'elevatorMY', 700, 10, 'easeOut');
end
end

--script written by vasalto