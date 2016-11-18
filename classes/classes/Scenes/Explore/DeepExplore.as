/**
 * Created by Tyler on 2016/11/17.
 */
package classes.Scenes.Explore {

import classes.*;
import classes.GlobalFlags.kFLAGS;
import classes.GlobalFlags.kGAMECLASS;
import classes.Scenes.Explore.Areas.DEForest;
import classes.Scenes.Explore.ExploreDebug;
import classes.Scenes.Explore.Giacomo;
import classes.Scenes.Monsters.*;

    public class DeepExplore extends BaseContent {

        private var deforest:DEForest = new DEForest;

        public function DeepExplore() {

        }

        public function DExplore() {
            clearOutput();
            outputText("You gather your supplies to begin deeper exploration. \n\n");
            menu();
            addButton(14, "Back", camp.returnToCampUseNoHour);
            if (flags[kFLAGS.EXPLORE_AREA] == 1) {
                deforest.DEForestMenu();
            }
        }
    }
}
