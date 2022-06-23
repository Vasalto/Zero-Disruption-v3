
function onCreate()
	--makeAnimatedLuaSprite('bgBACK','bgBACK', -600, -300);
	--setScrollFactor('bgBACK', 1, 1);
   --  addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
	--addLuaSprite('bgBACK', false);

	
	makeLuaSprite('cell','1stage/b', 1040, 105);
	setScrollFactor('cell', 1, 1);
	addLuaSprite('cell', true);
	--scaleObject('front', 0.5, 0.5);

	makeLuaSprite('cell2','1stage/c', 1240, 475); --menor de 500 sube
	setScrollFactor('cell2', 1, 1);
	addLuaSprite('cell2', true);
	--scaleObject('front', 0.5, 0.5);

	makeLuaSprite('cell3','1stage/a', -270, -15);
	setScrollFactor('cell3', 1, 1);
	addLuaSprite('cell3', true);
	--scaleObject('front', 0.5, 0.5);

	makeLuaSprite('elevator','1stage/elevator', 1390, -335);
	setScrollFactor('elevator', 1, 1);
	--scaleObject('front', 0.5, 0.5);
	
	makeLuaSprite('elevatorM','1stage/majoras', 1405, -955);
	setScrollFactor('elevatorM', 1, 1);

	makeLuaSprite('elevatorD','1stage/dany', 1405, 955);
	setScrollFactor('elevatorD', 1, 1);

	makeLuaSprite('elevatorR','1stage/rei', 1405, -955);
	setScrollFactor('elevatorR', 1, 1);

	makeLuaSprite('elevatorS','1stage/slithyocho', 1405, 955);
	setScrollFactor('elevatorS', 1, 1);

	makeLuaSprite('elevatorMY','1stage/myers', 1405, -955);
	setScrollFactor('elevatorMY', 1, 1);





	---Sprites


	addLuaSprite('elevatorM', false); --majora
	addLuaSprite('elevatorD', false); --majora
	addLuaSprite('elevatorR', false); --majora
	addLuaSprite('elevatorS', false); --majora
	addLuaSprite('elevatorMY', false); --majora




	addLuaSprite('elevator', false); -- elevador

	--scaleObject('front', 0.5, 0.5);
	

	

	
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

	setObjectOrder('elevator', 2)


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