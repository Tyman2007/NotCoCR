//Combat 2.0
package classes.Scenes.DeepCombat
{
import classes.Scenes.Combat.*;
	import classes.*;
	import classes.GlobalFlags.*;
	import classes.Items.*;
	import classes.Scenes.Areas.Bog.*;
	import classes.Scenes.Areas.Desert.*;
	import classes.Scenes.Areas.Forest.*;
	import classes.Scenes.Areas.GlacialRift.*;
	import classes.Scenes.Areas.HighMountains.*;
	import classes.Scenes.Areas.Lake.*;
	import classes.Scenes.Areas.Mountain.*;
	import classes.Scenes.Areas.Plains.*;
	import classes.Scenes.Areas.Swamp.*;
	import classes.Scenes.Areas.VolcanicCrag.*;
	import classes.Scenes.Dungeons.DeepCave.*;
	import classes.Scenes.Dungeons.DesertCave.*;
	import classes.Scenes.Dungeons.D3.*;
	import classes.Scenes.Dungeons.Factory.*;
	import classes.Scenes.Dungeons.HelDungeon.*;
	import classes.Scenes.Monsters.*;
	import classes.Scenes.NPCs.*;
	import classes.Scenes.Places.Boat.*;
	import classes.Scenes.Places.Farm.*;
	import classes.Scenes.Places.Owca.*;
	import classes.Scenes.Places.Prison.*;
	import classes.Scenes.Quests.UrtaQuest.*;
	import classes.Scenes.Places.TelAdre.UmasShop;

	import coc.view.MainView;
	import classes.internals.Utils;

	public class DeepCombat extends BaseContent
	{
		private var fighter:DeepMonster;
		private var monHP:Number;
		private var dmAI:DeepMonsterAI = new DeepMonsterAI();

		public function DeepCombat() { }

		public function StartCombat(monster:DeepMonster)
		{
			fighter = monster;
			monHP = fighter.dm.HP;
			PlayerActions();
		}

		private function PlayerActions()
		{
			clearOutput();

			outputText("Now fighting " + fighter.dm.short + "\n");
			outputText("Current HP: " + int(monHP) + "/" + fighter.dm.HP + "\n\n");

			menu();
			addButton(0, "Attack", Attack);
			addButton(1, "Tease", Tease);
			addButton(2, "Spells", Spells);
			addButton(3, "Items", Items);
			addButton(4, "Run", Run);
			addButton(5, "P. Specials", SpecialsPhys);
			addButton(6, "M. Specials", SpecialsMagic);
			addButton(7, "Wait", Wait);
			addButton(8, "Fantasize", Fantasize);
		}

		private function Attack()
		{
			var damage:Number = Math.pow(player.str, 2)*0.05;
			damage *= 0.5 + (player.weaponAttack / 10);
			damage += rand(damage/10);

			clearOutput();
			outputText("You stare at him menacingly. You deal " + int(damage) + " damage.\n\n");
			monHP -= damage;

			dmAI.BasicAI(fighter);

			if(monHP <= 0) Win();
			else if(player.HP <= 0) Lose();
			else doNext(PlayerActions);
		}

		private function Tease()
		{

		}

		private function Spells()
		{

		}

		private function Items()
		{

		}

		private function Run()
		{

		}

		private function SpecialsPhys()
		{

		}

		private function SpecialsMagic()
		{

		}

		private function Wait()
		{

		}

		private function Fantasize()
		{

		}

		private function Win()
		{
			var xp:Number = 25 + int(Math.pow(fighter.dm.level, 2)/5);
			outputText("\n\nHe ded. GG\n\n");
			outputText("You gain " + xp + " experience.\n\n");

			player.XP += xp;
			doNext(camp.returnToCampUseOneHour);
		}

		private function Lose()
		{
			outputText("\n\nU ded. GG\n\n");
			outputText("You lose half your gems. lel\n\n");
			player.gems -= player.gems/2;
		}
	}

}