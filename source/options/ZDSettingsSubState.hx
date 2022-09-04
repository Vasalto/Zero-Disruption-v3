package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class ZDSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Zero Disruption Settings';
		rpcTitle = 'Zero Disruption Settings Menu'; //for Discord Rich Presence
		
		var option:Option = new Option('Mechanics',
			'Check this if you want your mechanics on!',
			'mechanics',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Mechanic Controls',
			'Go to the Controls menu to change this setting!\nThis setting does basically nothing',
			'temperbarzdsetting',
			'bool',
			true);
		addOption(option);

		/*
		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Downscroll', //Name
			'If checked, notes go Down instead of Up, simple enough.', //Description
			'downScroll', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);
		*/

		super();
	}
}