package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.5.1-git'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;

	var maxCount:Int;

    private var playstateInfo:Map<String, Dynamic> = [
        "songLowerCase" => "",
        "diffuclty" => 0,
        "jsondata" /*aka songname-diff*/ => "",
        "songPlayList" => [],
        "isStoryMode" => false
    ];
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'options',
		'credits',
		'gallery'

		
	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	var elexaMenu:FlxSprite;

	//private var char1:Character = null; //you could just make an flxsprite, i added elexaMenu

	override function create()
	{
		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Encapsuling Zero", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		


		/*var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);*/

		var yScroll:Float = 0.00;
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, yScroll);
		//bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.setGraphicSize(Std.int(bg.width * 1.050));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);


		
		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.050));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140)  + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
		}

		//FlxG.camera.follow(camFollowPos, null, 1);



		
		elexaMenu = new FlxSprite(835, 50); 
		elexaMenu.frames = Paths.getSparrowAtlas('elexa idle', 'shared');
		elexaMenu.animation.addByPrefix('idle','elexa idle',24);
		elexaMenu.animation.play('idle');
		elexaMenu.scale.set(0.67, 0.67);
		elexaMenu.flipX = true;
		elexaMenu.antialiasing = true;
		add(elexaMenu);

		/*
		char1  = new Character(920, 150, 'elexa', true);
		char1.setGraphicSize(Std.int(char1.width * 0.8));
		add(char1);
		char1.visible = true;
		char1.dance();
		char1.updateHitbox();*/

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

			
		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'gallery':
										MusicBeatState.switchState(new ArtworkState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				//selectedSomethin = true;
				//MusicBeatState.switchState(new MasterEditorMenu());
				PlayState.storyPlaylist = ["project-mdk"];
				PlayState.isStoryMode = true;

				FlxG.sound.play(Paths.sound('confirmMenu'));
				FlxTween.tween(FlxG.camera, {alpha: 0}, 0.7, { // 0.5
					onComplete: function(tween:FlxTween){
		
						if (playstateInfo["isStoryMode"]) {
							PlayState.storyPlaylist = playstateInfo["songPlayList"];
							PlayState.isStoryMode = playstateInfo["isStoryMode"];
							PlayState.campaignScore = 0;
							PlayState.campaignMisses = 0; 
						} else {
							PlayState.isStoryMode = false;
						}
					   
						//PlayState.SONG = Song.loadFromJson(StringTools.replace(playstateInfo["jsondata"], "-null", ""), playstateInfo["songLowerCase"]);
						PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + "-hard", PlayState.storyPlaylist[0].toLowerCase());

		
						//PlayState.storyDifficulty = playstateInfo["diffuclty"];  
						LoadingState.loadAndSwitchState(new PlayState());
						FlxG.sound.music.volume = 0;
						FreeplayState.destroyFreeplayVocals();
					}
				});
			}
			#end
		}

		/*function finish() {
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxTween.tween(FlxG.camera, {alpha: 0}, 0.7, { // 0.5
				onComplete: function(tween:FlxTween){
	
					if (playstateInfo["isStoryMode"]) {
						PlayState.storyPlaylist = playstateInfo["songPlayList"];
						PlayState.isStoryMode = playstateInfo["isStoryMode"];
						PlayState.campaignScore = 0;
						PlayState.campaignMisses = 0; 
					} else {
						PlayState.isStoryMode = false;
					}
				   
					PlayState.SONG = Song.loadFromJson(StringTools.replace(playstateInfo["jsondata"], "-null", ""), playstateInfo["songLowerCase"]);
	
					PlayState.storyDifficulty = playstateInfo["diffuclty"];  
					
					MusicBeatState.switchState(new PlayState());
				}
			});
		}*/
			
		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
			{
				spr.screenCenter(X);
				var singleItem:Int = spr.ID;
	
				switch(singleItem){
					case 0:  spr.x -= 2; //storuy, esto va pa aca -ñ
					case 1:  spr.x -= 2; //free play, esto va pa aca -ñ
					case 2:  spr.x -= 9.4; //options, esto va pa aca -ñ
					case 3:  spr.x -= -10; //creddits, esto va pa aca -ñ
					case 4:  spr.x -= -15; //creddits, esto va pa aca -ñ
					default: spr.x -= 5;
				};
	
				//spr.x -= 400;
				//- izquierda, + derecha
			});

		//yaira mover cada iu letter
		menuItems.forEach(function(spr:FlxSprite)
			{
				spr.screenCenter(Y);
				var singleItem:Int = spr.ID;
	
				switch(singleItem){
					case 0:  spr.y -= -10; 
					case 1:  spr.y -= 1;
					case 2:  spr.y -= -30;
					case 3:  spr.y -= 1;
					case 4:  spr.y -= -10; 
					default: spr.y -= 20;
				};
	
				//spr.x -= 400;
				//- izquierda, + derecha
			});

	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();
			spr.alpha = 0;

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				spr.alpha = 1;
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}
