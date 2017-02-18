/**
 * Created by Tyler on 2016/11/17.
 */
package classes {
import classes.DeepMonsters.Areas.Forest.DeepGoblin;
import classes.GlobalFlags.kMONSTERS;
import classes.Scenes.Monsters.Goblin;

public class DeepMonsterLib extends BaseContent {

        //public var DMonsters:Array = new Array(100);
        public var Goblin:DeepMonster = new DeepMonster("Goblin", "goblin", 1);
        public var Imp:DeepMonster = new DeepMonster("Imp", "imp", 1);

        public static var init:Boolean = true;

        public function DeepMonsterLib()
        {

        }

        public function DeepMonsterLibInit()
        {
            if(init) {
                //ThemsFightnWords();
                InitMonsters();
                init = false;
                //DeepGoblin.InitGoblin();
            }
        }

        private function InitMonsters()
        {
            DeepGoblin.InitGoblin(Goblin);
        }

        private function ThemsFightnWords()
        {
            //MONID_GOBLIN


            //MONID_IMP
        }
    }
}
