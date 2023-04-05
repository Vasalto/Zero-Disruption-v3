function getRandomColor()
	local  randomRGBColor1 = getRandomInt(0, 1)
	local  randomRGBColor2 = getRandomInt(0, 1)
	local  randomRGBColor3 = getRandomInt(0, 1)
  
	local  rgbColor = {randomRGBColor1, randomRGBColor2, randomRGBColor3}
	local  hexColor = rgbToHex(rgbColor)
  
	rgbColorToString = rgbColor[1]..",".. rgbColor[2]..",".. rgbColor[3]
  
	-- debugPrint("RGB: ".. rgbColorToString)
  
	return hexColor
  
  end
  
  
  function rgbToHex(rgb)
	  local hexadecimal = '' -- yeah ignore
  
	  for key, value in pairs(rgb) do
		  local hex = ''
  
		  while(value > 0)do
			  local index = math.fmod(value, 16) + 1
			  value = math.floor(value / 16)
			  hex = string.sub('0123456789ABCDEF', index, index) .. hex			
		  end
  
		  if(string.len(hex) == 0)then
			  hex = '00'
  
		  elseif(string.len(hex) == 1)then
			  hex = '0' .. hex
		  end
  
		  hexadecimal = hexadecimal .. hex
	  end
  
	  return hexadecimal
  end


  
 function onCreatePost()

	--light things--
	

	-----------------
	-------
	
	setProperty('dad.alpha', 0)

    makeLuaSprite('ParedDeAnexo1', '', -110, 0)
	makeGraphic('ParedDeAnexo1', 1500, 120, '000000')
	setObjectCamera('ParedDeAnexo1', 'HUD')
	addLuaSprite('ParedDeAnexo1', false)
    setProperty('ParedDeAnexo1.alpha', 0)

	makeLuaSprite('ParedDeAnexo2', '', -110, 600)
	makeGraphic('ParedDeAnexo2', 1500, 120, '000000')
	setObjectCamera('ParedDeAnexo2', 'HUD')
	addLuaSprite('ParedDeAnexo2', false)
    setProperty('ParedDeAnexo2.alpha', 0)
	

         doTweenAlpha('anexo', 'anexo', 1, 0.0000001, 'linear')
         doTweenAlpha('ParedDeAnexo1', 'ParedDeAnexo1', 1, 0.0000001, 'linear')
         doTweenAlpha('ParedDeAnexo2', 'ParedDeAnexo2', 1, 0.0000001, 'linear')
		doTweenColor('boyfriend', 'boyfriend', '000000', 0.0000001, 'linear')
		--
		doTweenColor('gf', 'gf', '000000', 0.0000001, 'linear')
        doTweenColor('camHUD', 'camHUD', '100000', 0.0000001, 'linear')
end

function onBeatHit()
	if curBeat == 63 then
		doTweenColor('dad', 'dad', '000000', 1, 'linear')
	end
	if curBeat == 135 then
		doTweenColor('boyfriend', 'boyfriend', 'ffffff', 0.0000001, 'linear')
		doTweenColor('dad', 'dad', 'ffffff', 0.0000001, 'linear')
	end
	if curBeat % 1 == 0 and curBeat > 200 then
		setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015 * 1)
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03 * 1)
		runTimer('wait', 0.01);
		setProperty('light.alpha', 1);

	end
	if curBeat % 4 == 0 and curBeat < 200 then
		setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015 * 0.2)
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03 * 0.2)
		
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'light', 0, 0.8, 'linear');
	end
end
function onTweenCompleted(tag)
	if tag == 'byebye' then
	-- 	doTweenAlpha("byebye but better",'image', 0, 6.2, 'linear'); --this is soo unneccessary and useless starting from 0.5 to 0.3 to 0.1 is same *maybe*
	-- elseif tag == "image" then
		--removeLuaSprite('image', true);
	end
end

-- UHH TIMER--
function onUpdate(elapsed)
 asparagus = getRandomColor()
end


