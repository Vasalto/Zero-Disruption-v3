
function onCreate()
	makeAnimatedLuaSprite('bgBACK','bgBACK', -600, -300);
	setScrollFactor('bgBACK', 1, 1);
    -- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
	addLuaSprite('bgBACK', false);
	
	makeAnimatedLuaSprite('guestsBack','guestsBack', -180, -110);
	setScrollFactor('guestsBack', 1, 1);
    addAnimationByPrefix('guestsBack', 'guests back', 'guests back', 25, true);
	addLuaSprite('guestsBack', false);
	scaleObject('guestsBack', 0.9, 0.9);

	makeAnimatedLuaSprite('bgFRONT','bgFRONT', -600, -300);
	setScrollFactor('bgFRONT', 1, 1);
    -- addAnimationByPrefix('bgWARNING', 'Animation', 'bgWARNING', 7.5, true);
	addLuaSprite('bgFRONT', false);

	makeAnimatedLuaSprite('guestsFront','guestsFront', -380, 450);
	setScrollFactor('guestsFront', 1, 1);
    addAnimationByPrefix('guestsFront', 'guests front', 'guests front', 25, true);
	addLuaSprite('guestsFront', true);
	scaleObject('guestsFront', 0.8, 0.8);

	
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('guestsBack', 'guests back', true);
		objectPlayAnimation('guestsFront', 'guests front', true);

end

function onStepHit()
	if curStep < 200 then
	drainHealth(2,4)
	else
	resetHealth()
	end
	end




end




