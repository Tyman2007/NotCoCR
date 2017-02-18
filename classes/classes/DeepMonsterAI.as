/**
 * Created by Tyler on 2016/11/17.
 */
package classes {
    public class DeepMonsterAI extends BaseContent {

        private var fighter:DeepMonster;
        public function DeepMonsterAI() { }

        public function BasicAI(mon:DeepMonster)
        {
            //Spam attack.
            fighter = mon;
            MonsterAttack();
        }

        /*    Monster actions       */
        private function MonsterAttack()
        {
            var dmgtxt:Number = fighter.dm.attackPreText.length - 1;
            var damage:Number = Math.pow(fighter.dm.str, 2)*0.05;
            damage *= 0.5 + (fighter.dm.weaponAttack/10);
            damage += rand(damage/10);
            damage = int(damage);

            if(dmgtxt <= 0) dmgtxt = 0;
            else dmgtxt = rand(dmgtxt);

            outputText(fighter.dm.attackPreText[dmgtxt] + damage + fighter.dm.attackPostText[dmgtxt] + "\n\n");

            player.HP -= damage;
        }
    }
}
