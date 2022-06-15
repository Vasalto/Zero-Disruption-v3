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

    public static var assetStack:Map<String, PreloadType> = [];
    
    var maxCount:Int;

    private var pizza:Character = null;

    
    private var playstateInfo:Map<String, Dynamic> = [
        "songLowerCase" => "",
        "diffuclty" => 0,
        "jsondata" /*aka songname-diff*/ => "",
        "songPlayList" => [],
        "isStoryMode" => false
    ];

    private var spriteInfo:Map<String, Array<Dynamic>> = [
        "obtrude" => ["loadingbg1", "loading1", [-20, -1.08], "loading1",],
        "outburst" => ["loadingbg2", "Zerocarga", [680.46, 60.08], "Zerocarga",],
        "anathema" => ["loadingbg3", "alert", [1950.46, 1040.08], "alert",],
        "vehemence" => ["loadingbg4", "alert", [250.46, 240.08], "alert",],
    ];

    private var finished:Bool = false;

    private var keypressed:Bool = false;

    override public function create() {
        trace(playstateInfo["songLowerCase"]);

        super.create();

        FlxG.sound.music.stop();

        Paths.setCurrentLevel('shared');

        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image(spriteInfo[playstateInfo["songLowerCase"]][0], "shared"));
        bg.screenCenter();
        bg.antialiasing = true;
        add(bg);

        var portrait:FlxSprite = new FlxSprite();
        portrait.frames = Paths.getSparrowAtlas(spriteInfo[playstateInfo["songLowerCase"]][1], "shared");
        portrait.animation.addByPrefix('idle', spriteInfo[playstateInfo["songLowerCase"]][3], 24, true);
        portrait.animation.play('idle');
        portrait.scale.set(0.68,0.68);
        portrait.updateHitbox();
        portrait.setPosition(spriteInfo[playstateInfo["songLowerCase"]][2][0], spriteInfo[playstateInfo["songLowerCase"]][2][1]);
        portrait.antialiasing = true;
        trace(portrait);
        add(portrait);

        /*pizza = new Character(0,0,"loading");
        pizza.playAnim('loading');
        pizza.x = 0 - (pizza.width/3.5);
        pizza.y = FlxG.height - (pizza.height + (pizza.height / 4));
        add(pizza);

        FlxG.camera.alpha = 0;

        maxCount = Lambda.count(assetStack);
        trace(maxCount);

        FlxG.mouse.visible = false;

        FlxG.sound.play(Paths.sound("loadingsound", "shared"));*/

        new FlxTimer().start(1.5, function(tmr:FlxTimer)
            {
                FlxTween.tween(FlxG.camera, {alpha: 1}, 0.5, {
                    onComplete: function(tween:FlxTween){
                        Thread.create(function(){
                        });
                    }
                });
            });
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

        if (FlxG.keys.justPressed.ENTER && !keypressed) {
            finish();
            keypressed = true;
        }
    }

    function finish() {

        FlxTween.tween(FlxG.camera, {alpha: 0}, 0.5, {
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