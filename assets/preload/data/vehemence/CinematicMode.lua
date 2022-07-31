--This Script was made by Comical Chaos
function onCreate()
	makeLuaSprite('bartop','',0,0);
	makeGraphic('bartop',1280,100,'000000');
	addLuaSprite('bartop',false);
	makeLuaSprite('barbot','',0,620);
	makeGraphic('barbot',1580,590,'000000');
	addLuaSprite('barbot',false);

	makeLuaSprite('barbo','',0,820);
	makeGraphic('barbo',1580,590,'000000');
	addLuaSprite('barbo',false);
	setScrollFactor('bartop',0,0);
	setScrollFactor('barbot',0,0);
	setObjectCamera('bartop','hud');
	setObjectCamera('barbot','hud');
	setObjectCamera('barbo','camHUD');

end
function onCreatePost()
	setProperty('scoreTxt.y', 12);
	setProperty('timeTxt.visible', false);
	setProperty('timeBar.visible', false);
	setProperty('iconP1.alpha', 1);
	setProperty('iconP2.alpha', 1);
	if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
		setProperty('scoreTxt.y', 32);
		setProperty('healthBar.y', 8);
		else if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
			setProperty('scoreTxt.y', 660);
			setProperty('healthBar.y', 700);
		end
	end
end