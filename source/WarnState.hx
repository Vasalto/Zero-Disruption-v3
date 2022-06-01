package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;

class WarnState extends MusicBeatState {
override function create()
{
    var menubg:FlxSprite;

menubg = new FlxSprite().loadGraphic(Paths.image('warntext'));
menubg.antialiasing = ClientPrefs.globalAntialiasing;
menubg.scrollFactor.set();
add(menubg);
super.create();
}
override function update(elapsed:Float)
{
if (controls.ACCEPT)
{
FlxG.switchState(new MainMenuState());
FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
}
super.update(elapsed);
}
} 
