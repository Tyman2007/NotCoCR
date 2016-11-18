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
        }

        /*    Monster actions       */
        private function MonsterAttack()
        {
            var damage:Number = Math.pow(fighter.dm.str, 2)*0.05;
            damage *= 0.5 + (fighter.dm.weaponAttack/10);
            damage += rand(damage/10);
            player.HP -= damage;
        }
    }
}
