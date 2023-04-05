
function onCreate()
	makeLuaSprite('guy1','stages/1/elevatorandtubes/guy1', -1800, 250);
	setScrollFactor('guy1', 1, 1);
	scaleObject('guy1', 3, 3);


	makeLuaSprite('guy2','stages/1/elevatorandtubes/guy2', -1600, 250);
	setScrollFactor('guy2', 1, 1);
	scaleObject('guy2', 3, 3);


	makeLuaSprite('elevatorR','stages/1/elevatorandtubes/guy3', 1900, 340);
	setScrollFactor('elevatorR', 1, 1);
	scaleObject('elevatorR', 3, 3);

	
	makeLuaSprite('guy4','stages/1/elevatorandtubes/guy4', -1700, 250);
	setScrollFactor('guy4', 1, 1);
	scaleObject('guy4', 3, 3);




	---Sprites


	addLuaSprite('guy1', true); --majora
	addLuaSprite('guy2', true); --majora
	addLuaSprite('elevatorS', true); --majora
	addLuaSprite('guy4', true); --majora

	addLuaSprite('elevator', false); -- elevador	
end

function onCreatePost() -- this is the order for the elevator. 0 is behind the background and all shit
	setObjectOrder('elevatorR', getObjectOrder('gfGroup') - 1); 
	setObjectOrder('guy1', getObjectOrder('gfGroup') - 1); 
	setObjectOrder('guy2', getObjectOrder('gfGroup') - 1); 
	setObjectOrder('guy4', getObjectOrder('gfGroup') - 1); 


	addLuaSprite('elevatorR', false); --majora



end
local originy = 340
local origin2 = 250
local gf = 250




function onBeatHit()
	setProperty('elevatorR.y',originy+20);
	doTweenY('hehe','elevatorR',originy,0.2,'linear');


	setProperty('guy1.y',origin2+20);
	doTweenY('guy1','guy1',origin2,0.2,'linear');
	setProperty('guy2.y',origin2+20);
	doTweenY('guy2','guy2',origin2,0.2,'linear');


	
	if curBeat == 60 then
		moveright()
	end
end


function onUpdate(elapsed)
	if curStep >= 0 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/130)
	  doTweenY(dadTweeneY, 'guy4', 100-150*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
  end



function moveright()
	doTweenX('dadTweenXee', 'elevatorR', -2600, 22, 'easeOut');
	runTimer('Elevator1', 26) --doffersmith
end

function onTimerCompleted(tag, l, ll)
    if tag == 'Elevator1' then
		doTweenX('dadTweenXe', 'guy1', 3000, 16, 'easeOut');

		runTimer('Elevator2', 20)

	elseif tag == 'Elevator2' then
		doTweenX('dadTweenYE', 'guy2', 3000, 25, 'easeOut');
		runTimer('Elevator3', 5)

	elseif tag == 'Elevator3' then
		doTweenX('guy4', 'guy4', 3000, 5, 'easeOut');
end
end