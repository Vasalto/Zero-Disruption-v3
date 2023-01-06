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

class LoadingScreen extends MusicBeatState {
    var enterPressed:Bool = true; //prevents you from hitting enter multiple times
    var maxCount:Int;

    override public function create() {
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

        var load5:FlxSprite = new FlxSprite().loadGraphic(Paths.image('loadingbg5', 'shared'));
        load5.screenCenter();
        load5.antialiasing = true;

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
                case 'funktioren':
                    add(load1);
                case 'obtrude':
                    add(load2);
                    add(portrait1);
                case 'outburst':
                    add(load3);
                    add(portrait2);
                case 'anathema':
                    add(load4);
                    //add(portrait3);
                case 'vehemence':
                    add(load5);
                    //add(portrait4);
            }
    }

    override function update(elapsed:Float) 
    {
        super.update(elapsed);
        if (controls.ACCEPT && enterPressed == true) {
            goToSong();
            enterPressed = false;
        }
    }

    override public function new(songLowerCase:String, difficulty:Int, jsondata:String, isStoryMode:Bool, ?songPlayList:Array<String> = null) {
        super();
    }

    function goToSong() 
    {
        FlxG.sound.play(Paths.sound('confirmMenu'));
        FlxTween.tween(FlxG.camera, {alpha: 0}, 0.5, {
            onComplete: function(tween:FlxTween){
                if (PlayState.isStoryMode = true)
                    {
                        PlayState.storyPlaylist = PlayState.storyPlaylist;
                        PlayState.isStoryMode = true;
                        PlayState.campaignScore = 0;
                        PlayState.campaignMisses = 0;
                    } 
                else 
                    {
                        PlayState.isStoryMode = false;
                    }
                PlayState.SONG = Song.loadFromJson(StringTools.replace(PlayState.storyPlaylist[0], "-null", ""), PlayState.storyPlaylist[0]);
                PlayState.storyDifficulty = PlayState.storyDifficulty;                
                MusicBeatState.switchState(new PlayState());
            }
        });
    }
}