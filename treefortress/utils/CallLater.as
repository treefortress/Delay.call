package treefortress.utils
{
	import flash.utils.Dictionary;

	public class CallLater
	{
		protected static var callHash:Dictionary;
		public static var time:int = 0;
		
		public static function init():void {
			callHash = new Dictionary();
			time = 0;
		}
		
		public static function add(func:Function, delayTime:uint = 1, args:Array = null, addOnce:Boolean = false):void {
			if(!callHash){ throw(new Error("ERROR: DelayedCalls.init() must be called before you can add a function.")); }
			call(func, time + delayTime, args, addOnce);
		}
		
		public static function removeAll():void {
			init();
		}
		
		public static function remove(func:Function):void {
			delete callHash[func];
		}
		
		public static function update(deltaTime:int):void {
			time += deltaTime;
			for (var n:Object in callHash) {
				var obj:CallLaterData = callHash[n] as CallLaterData;
				if (obj.time < time) {
					if (obj.args != null) {
						obj.func.apply(null, obj.args);
					} else {
						obj.func();
					}
					delete callHash[n];
				}
			}
		}
		
		protected static function call(func:Function, time:uint, args:Array, addOnce:Boolean = false):void {
			if (!addOnce) {
				callHash[{}] = new CallLaterData(func, time, args);
			} else if (callHash[func] == null) {
				callHash[func] = new CallLaterData(func, time, args);
			} else {
				(callHash[func] as CallLaterData).time = time;
				(callHash[func] as CallLaterData).args = args;
			}
		}
	}
}

class CallLaterData  {
	
	public var time:int;
	public var args:Array;
	public var func:Function;
	
	public function CallLaterData(func:Function, time:uint, args:Array) {
		this.func = func;
		this.time = time;
		this.args = args;
	}
	
}