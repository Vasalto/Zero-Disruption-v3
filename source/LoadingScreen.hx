package;

import flixel.graphics.FlxGraphic;
import sys.thread.Thread;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.util.FlxTimer;

enum PreloadType {
    atlas;
    image;
}

class LoadingScreen extends MusicBeatState { //im probs gonna rewrite this, i need to get better at coding lol (i just don't want to piss off people when we open source this) - slithy //PS: either that or we get another coder to write it
    
    var maxCount:Int;

    private var playstateInfo:Map<String, Dynamic> = [
        "songLowerCase" => "",
        "diffuclty" => 0,
        "jsondata" /*aka songname-diff*/ => "",
        "songPlayList" => [],
        "isStoryMode" => false
    ];

    override public function create() {
        //trace(playstateInfo["songLowerCase"]);

        super.create();
        FlxG.sound.music.stop();
        Paths.setCurrentLevel('shared');

        var load1:FlxSprite = new FlxSprite().loadGraphic(Paths.image('loadingbg1', 'shared'));
        load1.screenCenter();
        load1.antialiasing = true;

        var load2:FlxSprite = new FlxSprite().loadGraphic(Paths.image('loadingbg2', 'shared'));
        load2.screenCenter();
        load2.antialiasing = true;

        var load3:FlxSprite = new FlxSprite().loadGraphic(Paths.image('loadingbg3', 'shared'));
        load3.screenCenter();
        load3.antialiasing = true;

        var load4:FlxSprite = new FlxSprite().loadGraphic(Paths.image('loadingbg4', 'shared'));
        load4.screenCenter();
        load4.antialiasing = true;

        var portrait1:FlxSprite = new FlxSprite();
        portrait1.frames = Paths.getSparrowAtlas("loading1", "shared");
        portrait1.animation.addByPrefix('idle', "loading1", 24, true);
        portrait1.animation.play('idle');
        portrait1.scale.set(0.68,0.68);
        portrait1.updateHitbox();
        portrait1.setPosition(-20, 1.08);
        portrait1.antialiasing = true;

        var portrait2:FlxSprite = new FlxSprite();
        portrait2.frames = Paths.getSparrowAtlas("Zerocarga", "shared");
        portrait2.animation.addByPrefix('idle', "Zerocarga", 24, true);
        portrait2.animation.play('idle');
        portrait2.scale.set(0.68,0.68); //sets the scale
        portrait2.updateHitbox();
        portrait2.setPosition(680.46, 60.08); //offsets
        portrait2.antialiasing = true;

       switch(Paths.formatToSongPath(PlayState.SONG.song)) //adds flxsprites depending on the song
		{
			case 'obtrude':
                add(load1);
                add(portrait1);
			case 'outburst':
                add(load2);
                add(portrait2);
            case 'anathema':
                add(load3);
                //add(portrait3);
            case 'vehemence':
                add(load4);
                //add(portrait4);
		}

    }

    override public function new(songLowerCase:String, diffuclty:Int, jsondata:String, isStoryMode:Bool, ?songPlayList:Array<String> = null) {
        super();

        //passing info to finish function

        playstateInfo["songLowerCase"] = songLowerCase;

        playstateInfo["diffuclty"] = diffuclty;

        playstateInfo["jsondata"] = jsondata;

        playstateInfo["isStoryMode"] = isStoryMode;

        playstateInfo["songPlayList"] = songPlayList;

    }

    override function update(elapsed:Float) {
        super.update(elapsed);

        if (controls.ACCEPT) {
            finish();
        }
    }

    function finish() {
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
    }

}