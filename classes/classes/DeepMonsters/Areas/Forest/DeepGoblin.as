/**
 * Created by Tyler on 2016/11/18.
 */
package classes.DeepMonsters.Areas.Forest {
import classes.DeepMonster;
import classes.DeepMonsterLib;

    public class DeepGoblin extends DeepMonsterLib {
        public function DeepGoblin()
        {

        }

        public static function InitGoblin(monster:DeepMonster)
        {
            monster.dm.attackPreText.push("The goblin slices at you with her short sword, dealing ");
            monster.dm.attackPostText.push(" damage.");
            monster.dm.attackPreText.push("The goblin stabs at you with her short sword, dealing ");
            monster.dm.attackPostText.push(" damage.");
            monster.dm.attackPreText.push("The goblin does a clumsy spin, striking you with her short sword, dealing ");
            monster.dm.attackPostText.push(" damage.");
            monster.dm.attackPreText.push("The goblin charges at you and smacks your chest with the hilt of her short sword, dealing ");
            monster.dm.attackPostText.push(" damage.");
            monster.dm.teasePreText.push("The goblin takes their mighty stick of actually fucking you in the ass, dealing ");
            monster.dm.teasePostText.push(" lust damage.");

            monster.dm.weaponName = "Short Sword";
            monster.dm.weaponAttack = 3;
        }
    }
}
