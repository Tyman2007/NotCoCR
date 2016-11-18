package classes
{
	import classes.GlobalFlags.kFLAGS;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.Items.ArmorLib;
	import classes.Items.ConsumableLib;
	import classes.Items.JewelryLib;
	import classes.Items.UseableLib;
	import classes.Items.WeaponLib;
	import classes.Items.ShieldLib;
	import classes.Items.UndergarmentLib;
	import classes.Scenes.Dungeons.Factory.SecretarialSuccubus;
	import classes.Scenes.NPCs.Kiha;
	import classes.Scenes.Quests.UrtaQuest.MilkySuccubus;
	import classes.internals.ChainedDrop;
	import classes.internals.RandomDrop;
	import classes.internals.Utils;
	import classes.internals.WeightedDrop;

	import flash.utils.getQualifiedClassName;

	/**
	 * ...
	 * @author Yoffy, Fake-Name, aimozg
	 */
	public class DeepMonster extends BaseContent
	{
		public var dm:Creature = new Creature();

		public function DeepMonster(name:String, race:String, level:Number)
		{
			dm.monRace = race;
			dm.level = level;
			dm.short = name;
			SetRace();
		}

		private function SetRace()
		{
			//Str, Tou, Spe, Inte, Lib, Sens, Cor, StrRate, TouRate, SpeRate, InteRate
			if(dm.monRace == "goblin") SetStat(20, 15, 30, 5, 30, 50, 100, 1, 0.75, 0.25, 0);
			else if (dm.monRace == "imp") SetStat(30, 20, 15, 15, 30, 50, 100, 1, 0.75, 0.25, 0);
			else SetStat(20, 20, 20, 20, 20, 20, 20, 1, 1, 1, 1);
		}

		private function SetStat(str:Number, tou:Number, spe:Number, inte:Number, lib:Number, sens:Number, cor:Number, strRate:Number, touRate:Number, speRate:Number, inteRate:Number)
		{
			dm.str = str;
			dm.tou = tou;
			dm.spe = spe;
			dm.inte = inte;
			dm.lib = lib;
			dm.sens = sens;
			dm.cor = cor;

			dm.strRate = strRate;
			dm.touRate = touRate;
			dm.speRate = speRate;
			dm.inteRate = inteRate;

			dm.str += dm.strRate * dm.level;
			dm.tou += dm.touRate * dm.level;
			dm.spe += dm.speRate * dm.level;
			dm.inte += dm.inteRate * dm.level;

			MaxHP();
		}

		private function MaxHP()
		{
			dm.HP = int(Math.pow(dm.tou, 2)/2);
			dm.lust = 100 + dm.lib;
		}
	}
}
