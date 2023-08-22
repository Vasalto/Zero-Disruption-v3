package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxTiledSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.addons.display.FlxBackdrop;
import openfl.Assets;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
class GalleryState extends MusicBeatState
{
    private var galleryStuff:Array<Array<String>> = [];
    var curArtworkSelected:Int = 0;
    var galleryObject:FlxSprite;
    var galleryObjectPath:String = 'gallery/artwork';
    var captionText:Array<String> = CoolUtil.coolTextFile('assets/images/gallery/galleryCreds.txt');
    var captionList:Array<String> = [];
    var menuDirectory:String = 'gallery/artwork/';
    var artDirectory:String = 'gallery/artwork/gallery_subs/';
    //decor
    var menuOverlay:FlxSprite;
    var borderw:FlxSprite;
    var border:FlxSprite;
    var artistName:FlxText;
    var sprLeft:FlxSprite;
    var sprRight:FlxSprite;

    override public function create() {
        super.create();
        
        var menubg:FlxSprite = new FlxSprite().loadGraphic(Paths.image(menuDirectory + 'bg'));
        menubg.antialiasing = ClientPrefs.globalAntialiasing;
        menubg.scrollFactor.set();
        add(menubg);

        menuOverlay = new FlxSprite().loadGraphic(Paths.image(menuDirectory + 'fade'));
        menuOverlay.antialiasing = ClientPrefs.globalAntialiasing;
        menuOverlay.scrollFactor.set();
        add(menuOverlay);

        borderw = new FlxSprite(706, 209).loadGraphic(Paths.image(menuDirectory + 'whiteborder'));
        borderw.antialiasing = ClientPrefs.globalAntialiasing;
        borderw.scrollFactor.set();
        borderw.screenCenter();
        borderw.scale.y = 1.75;   
        borderw.scale.x = 1.75;     
        add(borderw);

        galleryObject = new FlxSprite();
        galleryObject.scale.set(galleryObject.scale.x / 1.75, galleryObject.scale.y / 1.75);
        add(galleryObject);

        border = new FlxSprite(706, 209).loadGraphic(Paths.image(menuDirectory + 'border'));
        border.antialiasing = ClientPrefs.globalAntialiasing;
        border.scrollFactor.set();
        border.screenCenter();
        border.scale.y = 1.75;
        border.scale.x = 1.75;
        add(border);

        artistName = new FlxText();
        artistName.size = 36;
		artistName.setFormat(Paths.font("vcr.ttf"), 40, FlxColor.WHITE, LEFT);
        artistName.scrollFactor.set();
        add(artistName);
        artistName.x = border.x + -190;
        artistName.y = border.y - -380;
        switchObjs();

        sprLeft = new FlxSprite(142.6, 211.6).loadGraphic(Paths.image(menuDirectory + 'next'));
        sprLeft.flipX = true;
        sprLeft.antialiasing = ClientPrefs.globalAntialiasing;
        sprLeft.scrollFactor.set();
        add(sprLeft);

        sprRight = new FlxSprite(1100.8, 211.6).loadGraphic(Paths.image(menuDirectory + 'next'));
        sprRight.antialiasing = ClientPrefs.globalAntialiasing;
        sprRight.scrollFactor.set();
        add(sprRight);

        pulse(menuOverlay, 0.5, 2.5);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);

        if(controls.UI_LEFT_P){
            switchObjs(-1);
            sprLeft.loadGraphic(Paths.image(menuDirectory + 'nexthit'));
        }
        else if (!controls.UI_LEFT)
            sprLeft.loadGraphic(Paths.image(menuDirectory + 'next'));
        if(controls.UI_RIGHT_P){
            switchObjs(1);
            sprRight.loadGraphic(Paths.image(menuDirectory + 'nexthit'));

        }
        else if (!controls.UI_RIGHT)
            sprRight.loadGraphic(Paths.image(menuDirectory + 'next'));
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
        artistName.text = '${captionText[curArtworkSelected].toUpperCase()}';
    }    

    function pulse(spr:FlxSprite, alph:Float = 0.5, dur:Float = 1)
    {
        FlxTween.tween(spr, {alpha: alph}, dur,
        {
            ease: FlxEase.quadInOut,
            type: FlxTweenType.PINGPONG
        });
    }
}