/**
 * Created by aimozg on 06.01.14.
 */
package classes.Scenes.Areas
{
	import classes.*;
	import classes.GlobalFlags.kFLAGS;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.GlobalFlags.kACHIEVEMENTS;
	import classes.Scenes.Areas.Forest.*;
	import classes.Scenes.Monsters.Goblin;
	import classes.Scenes.Monsters.Imp;
	import classes.Scenes.NPCs.Jojo;
	import classes.Scenes.Camp.CabinProgress;
	
	use namespace kGAMECLASS;

	public class Forest extends BaseContent
	{
		public var akbalScene:AkbalScene = new AkbalScene();
		public var beeGirlScene:BeeGirlScene = new BeeGirlScene();
		public var corruptedGlade:CorruptedGlade = new CorruptedGlade();
		public var essrayle:Essrayle = new Essrayle();
		public var faerie:Faerie = new Faerie();
		public var kitsuneScene:KitsuneScene = new KitsuneScene();
		public var tamaniDaughtersScene:TamainsDaughtersScene = new TamainsDaughtersScene();
		public var tamaniScene:TamaniScene = new TamaniScene();
		public var tentacleBeastScene:TentacleBeastScene = new TentacleBeastScene();
		public var erlkingScene:ErlKingScene = new ErlKingScene();
		
		public function Forest() { }
		
		public function exploreDeepwoods():void
		{
			clearOutput();
			//Increment deepwoods exploration counter.
			player.addStatusValue(StatusEffects.ExploredDeepwoods, 1, 1);
			
			var choice:Array = [];
			var select:int;
			
			//Build choice list!
			if (flags[kFLAGS.FAERIE_ENCOUNTER_DISABLED] <= 0) choice[choice.length] = 0; //Faerie
			if (player.level >= 2) choice[choice.length] = 1; //Tentacle Beast
			if (flags[kFLAGS.CORRUPTED_GLADES_DESTROYED] < 100 && rand(100) >= Math.round(flags[kFLAGS.CORRUPTED_GLADES_DESTROYED] * 0.5)) choice[choice.length] = 2; //Corrupted Glade
			choice[choice.length] = 3; //Akbal
			choice[choice.length] = 4; //Kitsunes
			if (flags[kFLAGS.TAMANI_TIME_OUT] == 0 && player.gender > 0 && flags[kFLAGS.TAMANI_BAD_ENDED] == 0 && (player.totalCocks() > 0 || player.hasKeyItem("Deluxe Dildo") < 0)) choice[choice.length] = 5; //Tamani
			if (flags[kFLAGS.CAMP_CABIN_PROGRESS] >= 4 && flags[kFLAGS.CAMP_CABIN_WOOD_RESOURCES] < 100 && rand(2) == 0) choice[choice.length] = 6; //Gather woods
			
			//Every tenth exploration finds a pumpkin if eligible!
			if (player.statusEffectv1(StatusEffects.ExploredDeepwoods) % 10 == 0 && isHalloween()) {
				//If Fera isn't free yet...
				if (player.findPerk(PerkLib.FerasBoonBreedingBitch) < 0 && player.findPerk(PerkLib.FerasBoonAlpha) < 0) {
					if (date.fullYear > flags[kFLAGS.PUMPKIN_FUCK_YEAR_DONE]) {
						kGAMECLASS.fera.pumpkinFuckEncounter();
						return;
					}
				}
				//Fera is free!
				else {
					if (flags[kFLAGS.FERAS_TRAP_SPRUNG_YEAR] == 0) {
						if (date.fullYear > flags[kFLAGS.FERAS_GLADE_EXPLORED_YEAR]) {
							kGAMECLASS.fera.feraSceneTwoIntroduction();
							return;
						}
					}
				}
			}
			//Hel jumps you for sex.
			if (flags[kFLAGS.PC_PROMISED_HEL_MONOGAMY_FUCKS] == 1 && flags[kFLAGS.HEL_RAPED_TODAY] == 0 && rand(10) == 0 && player.gender > 0 && !kGAMECLASS.helScene.followerHel()) {
				kGAMECLASS.helScene.helSexualAmbush();
				return;
			}
			//Every 5th exploration encounters d2 if hasnt been met yet and factory done
			if (flags[kFLAGS.DISCOVERED_DUNGEON_2_ZETAZ] == 0 && player.statusEffectv1(StatusEffects.ExploredDeepwoods) % 5 == 0 && flags[kFLAGS.FACTORY_SHUTDOWN] > 0) {
				kGAMECLASS.dungeons.enterDeepCave();
				return;
			}
			if (flags[kFLAGS.ERLKING_DISABLED] == 0 && flags[kFLAGS.ERLKING_ENCOUNTER_COUNTER] == 4)
			{
				flags[kFLAGS.ERLKING_ENCOUNTER_COUNTER] = 0;
				erlkingScene.encounterWildHunt();
				return;
			}
			else
			{
				flags[kFLAGS.ERLKING_ENCOUNTER_COUNTER]++;
			}
			
			select = choice[rand(choice.length)];
			//==============================
			//EVENTS GO HERE!
			//==============================
			switch(select) {
				case 0: //Faerie
					faerie.encounterFaerie();
					break;
				case 1: //Tentacle beasts
					if (player.gender > 0) flags[kFLAGS.UNKNOWN_FLAG_NUMBER_00247] = 0;
					//Tentacle avoidance chance due to dangerous plants
					if (player.hasKeyItem("Dangerous Plants") >= 0 && player.inte / 2 > rand(50)) {
						trace("TENTACLE'S AVOIDED DUE TO BOOK!");
						outputText("Using the knowledge contained in your 'Dangerous Plants' book, you determine a tentacle beast's lair is nearby, do you continue?  If not you could return to camp.\n\n", true);
						simpleChoices("Continue", tentacleBeastScene.encounter, "", null, "", null, "", null, "Leave", camp.returnToCampUseOneHour);
						return;
					}
					else {
						tentacleBeastScene.encounter();
						return;
					}
					break;
				case 2: //Corrupted Glade
					if (rand(4) == 0) {
						kGAMECLASS.deforest.trappedSatyr();
						return;
					}
					corruptedGlade.intro();
					break;
				case 3: //Akbal
					akbalScene.supahAkabalEdition();
					break;
				case 4: //Kitsunes
					if (rand(3) == 0) kitsuneScene.kitsuneShrine();
					else kitsuneScene.enterTheTrickster();
					break;
				case 5: //Tamani
					if (player.totalCocks() > 0 && flags[kFLAGS.TAMANI_DAUGHTER_PREGGO_COUNTDOWN] == 0 && flags[kFLAGS.TAMANI_NUMBER_OF_DAUGHTERS] >= 24) {
						tamaniDaughtersScene.encounterTamanisDaughters();
					}
					else
						tamaniScene.encounterTamani();
					break;
				case 6: //Gather wood
					camp.cabinProgress.gatherWoods();
					break;
				default: //Failsafe mechanism
					outputText("You enjoy a peaceful walk in the deepwoods.  It gives you time to think over the recent, disturbing events.", true);
					dynStats("tou", .5, "int", 1);
					doNext(camp.returnToCampUseOneHour);
					break;
			}
		}

		//Explore forest
		public function exploreForest():void
		{
			clearOutput();

			outputText("You prepare to explore the forest.");
			flags[kFLAGS.EXPLORE_AREA] = 1;

			doNext(camp.returnToCampUseOneHour);
		}
	}
}
