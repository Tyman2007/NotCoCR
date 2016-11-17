/**
 * Created by aimozg on 10.01.14.
 */
package classes.Items.Weapons
{
	import classes.CoC_Settings;
	import classes.Creature;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.Items.Weapon;
	import classes.Player;

	public class UglySword extends Weapon {
		
		public function UglySword() {
			super("U.Sword", "U.Sword", "ugly sword", "an ugly rusted sword", "slash", 1, 100, "This worn out blade appears to have been left to rust for many decades. It's quite heavy and appears to be made out of very expensive materials, however, it won't be much use in combat in it's current state.", "holySword");
		}
		
		override public function get attack():Number { 
			var temp:int = (3 - game.player.cor / 10);
			if (temp < 1) temp = 1;
			return temp; 
		}
		
		override public function canUse():Boolean {
			if (game.player.cor < (35 + game.player.corruptionTolerance())) return true;
			outputText("You grab hold of the handle of the sword only to have it grow burning hot.  You're forced to let it go lest you burn yourself.  Something within the sword must be displeased.  ");
			return false;
		}
	}
}
