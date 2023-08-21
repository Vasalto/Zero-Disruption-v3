package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxTiledSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import openfl.Assets;

class GalleryState extends MusicBeatState
{
    private var galleryStuff:Array<Array<String>> = [];
    var curArtworkSelected:Int = 0;
    var galleryObject:FlxSprite;
    var galleryObjectPath:String = 'gallery/artwork';
    var captionText:Array<String> = CoolUtil.coolTextFile('assets/images/gallery/galleryCreds.txt');
    var captionList:Array<String> = [];

    override public function create() {
        super.create();
        
        galleryObject = new FlxSprite();
        galleryObject.scale.set(galleryObject.scale.x / 1.75, galleryObject.scale.y / 1.75);
        switchObjs();
        add(galleryObject);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);

        if(controls.UI_LEFT_P)
            switchObjs(-1);
        if(controls.UI_RIGHT_P)
            switchObjs(1);
        if(controls.BACK)
            MusicBeatState.switchState(new MainMenuState());
    }

    function switchObjs(?yea:Int = 0) {
        curArtworkSelected += yea;
        if(curArtworkSelected < 0)
            curArtworkSelected = captionText.length - 1;
        if(curArtworkSelected >= captionText.length)
            curArtworkSelected = 0;
        loadObjects();
    }

    function loadObjects(){
        galleryObject.loadGraphic(Paths.image('$galleryObjectPath/gallery_subs/' + (curArtworkSelected + 1)));
        galleryObject.updateHitbox();
        galleryObject.screenCenter();
        galleryObject.scrollFactor.set();
        trace('${captionText[curArtworkSelected]}');
    }    
}