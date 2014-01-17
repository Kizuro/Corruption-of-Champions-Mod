/**
 * Created by aimozg on 09.01.14.
 */
package classes.Items
{
	import classes.Character;
	import classes.CoC_Settings;
	import classes.Creature;
	import classes.Player;

	/**
	 * An item, that is consumed by player, and disappears after use. Direct subclasses should override "doEffect" method
	 * and NOT "useItem" method.
	 */
	public class Consumable extends Useable
	{
		/**
		 * Perform effect on player WITHOUT requiring item being in player's inventory and removing it
		 */
		public function doEffect(player:Player):void
		{
			CoC_Settings.errorAMC("Consumable","doEffect",id);
		}

		public function canConsume(player:Player):Boolean
		{
			return true;
		}

		/**
		 * Removes item from player and does effect
		 */
		override public function useItem(player:Player):void
		{
			if (canConsume(player)){
				player.consumeItem(this,1);
				doEffect(player);
			}
		}

		public function Consumable(id:String, shortName:String=null, longName:String=null, value:Number=0, description:String=null)
		{
			super(id, shortName, longName, value, description);
		}
	}
}