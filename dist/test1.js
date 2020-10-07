// Generated by Haxe 4.1.3
/**Document this comment for testing
 * Kinitta.js
 */
;(function ($hx_exports, $global) { "use strict";
var $estr = function() { return js_Boot.__string_rec(this,''); },$hxEnums = $hxEnums || {};
class LunaDataManager extends DataManager {
	saveGame() {
		DataManager.setupEventTest();
	}
}
LunaDataManager.__name__ = true;
class LT_$Win_$Msg extends Window_Message {
	constructor(x,y,width,height) {
		super(x,y,width,height);
	}
	initialize() {
		_Window_Message_intiailizeR.call(this);
		this._testingNewCharacter = "Actor1_1";
		haxe_Log.trace(this._background,{ fileName : "src/LTWinMsg.hx", lineNumber : 23, className : "LTWinMsgUpdate", methodName : "initialize"});
	}
	newTestFunction() {
		haxe_Log.trace(this.x,{ fileName : "src/LTWinMsg.hx", lineNumber : 32, className : "LTWinMsgUpdate", methodName : "newTestFunction", customParams : [this.y]});
		haxe_Log.trace("Hello World",{ fileName : "src/LTWinMsg.hx", lineNumber : 33, className : "LTWinMsgUpdate", methodName : "newTestFunction"});
	}
	saveGame() {
		this.tabIndex = 3;
	}
}
LT_$Win_$Msg.__name__ = true;
class Lambda {
	static fold(it,f,first) {
		let x = $getIterator(it);
		while(x.hasNext()) first = f(x.next(),first);
		return first;
	}
}
Lambda.__name__ = true;
class Main {
	static main() {
		// @"Build Date: 2020-10-05 11:19:28"@ ;
		
//=============================================================================
// @"Kiniitta"@
//=============================================================================
      ;
		/*:
     @"@author Kino\n    @plugindesc This plugin allows you to use Haxe in your RPGMakerMV code.\n    @param haxeVersion"@
   */;
		// @"This is a test of the watcher"@ ;
		let sceneTitleStart = Scene_Base.prototype["start"] ;
		Scene_Base.prototype["start"] = function() {
			let self = this;
			sceneTitleStart.call(self);
			_$LTGlobals_$.$gameVariables.setValue(1,3);
			Window.Haxe = "Version 4.2.0";
			haxe_Log.trace("Running Console Log From Haxe Added haxe Version",{ fileName : "src/Main.hx", lineNumber : 38, className : "Main", methodName : "main"});
		};
		let sceneTitleStart2 = Scene_Base.prototype.start;
		haxe_Log.trace(sceneTitleStart2,{ fileName : "src/Main.hx", lineNumber : 42, className : "Main", methodName : "main"});
		Scene_Base.prototype.start = function() {
		};
		let abc = [1,2,3,4,5,10];
		let x = Lambda.fold(abc,function(x,result) {
			result = x * 2;
			return result;
		},0);
		let result = new Array(abc.length);
		let _g = 0;
		let _g1 = abc.length;
		while(_g < _g1) {
			let i = _g++;
			result[i] = abc[i] * 2;
		}
		let d = result;
		Scene_Base.prototype["test"]  = function(self,args) {
			self.update();
		};
		TouchInput._onMouseMove = function(event) {
			haxe_Log.trace(event,{ fileName : "src/Main.hx", lineNumber : 55, className : "Main", methodName : "main"});
		};
		let actors = _$LTGlobals_$.$gameParty.members();
		let _g2 = 0;
		while(_g2 < actors.length) {
			let actor = actors[_g2];
			++_g2;
			actor.setHp(actor.get_mhp());
			actor.setMp(actor.get_mmp());
		}
		haxe_Log.trace("Test comment",{ fileName : "src/Main.hx", lineNumber : 81, className : "Main", methodName : "main"});
		let tmp_1_x = 3;
		let tmp_1_b = "Hello";
		let tmp_1_y = 22;
		let tmp_1_c = 33;
		let tmp_2_z = 3;
		haxe_Log.trace({ z : tmp_2_z, y : tmp_1_y, x : tmp_1_x, c : tmp_1_c, b : tmp_1_b},{ fileName : "src/Main.hx", lineNumber : 89, className : "Main", methodName : "main"});
		let xY = function(other) {
			return { y : other.y, x : other.x};
		};
		let x1 = _$LTGlobals_$.$gamePlayer;
		let result1 = xY(x1);
		haxe_Log.trace(result1.x,{ fileName : "src/Main.hx", lineNumber : 93, className : "Main", methodName : "main"});
		let result2_c = tmp_1_c;
		let result2_b = tmp_1_b;
		haxe_Log.trace(result2_b,{ fileName : "src/Main.hx", lineNumber : 95, className : "Main", methodName : "main"});
		Main.test(...[1,2]);
		let _Window_Message__testingNewCharacter = Window_Message.prototype._testingNewCharacter;
		Window_Message.prototype._testingNewCharacter = null;
		let _Window_Message_initialize = Window_Message.prototype.initialize;
		Window_Message.prototype.initialize = function() {
			_Window_Message_intiailizeR.call(this);
			this._testingNewCharacter = "Actor1_1";
			haxe_Log.trace(this._background,{ fileName : "src/LTWinMsg.hx", lineNumber : 23, className : "LTWinMsgUpdate", methodName : "initialize"});
		};
		let _Window_Message_newTestFunction = Window_Message.prototype.newTestFunction;
		Window_Message.prototype.newTestFunction = function() {
			haxe_Log.trace(this.x,{ fileName : "src/LTWinMsg.hx", lineNumber : 32, className : "LTWinMsgUpdate", methodName : "newTestFunction", customParams : [this.y]});
			haxe_Log.trace("Hello World",{ fileName : "src/LTWinMsg.hx", lineNumber : 33, className : "LTWinMsgUpdate", methodName : "newTestFunction"});
		};
		let _Window_Message_saveGame = Window_Message.prototype.saveGame;
		Window_Message.prototype.saveGame = function() {
			this.tabIndex = 3;
		};
		let _DataManager__testingNewCharacter = DataManager._testingNewCharacter;
		DataManager._testingNewCharacter = null;
		let _DataManager_saveGame = DataManager.saveGame;
		DataManager.saveGame = function() {
			DataManager.setupEventTest();
		};
	}
	static test(x,y) {
		return x + y;
	}
}
Main.__name__ = true;
Math.__name__ = true;
class Std {
	static string(s) {
		return js_Boot.__string_rec(s,"");
	}
}
Std.__name__ = true;
class haxe_Log {
	static formatOutput(v,infos) {
		let str = Std.string(v);
		if(infos == null) {
			return str;
		}
		let pstr = infos.fileName + ":" + infos.lineNumber;
		if(infos.customParams != null) {
			let _g = 0;
			let _g1 = infos.customParams;
			while(_g < _g1.length) str += ", " + Std.string(_g1[_g++]);
		}
		return pstr + ": " + str;
	}
	static trace(v,infos) {
		let str = haxe_Log.formatOutput(v,infos);
		if(typeof(console) != "undefined" && console.log != null) {
			console.log(str);
		}
	}
}
haxe_Log.__name__ = true;
class haxe_iterators_ArrayIterator {
	constructor(array) {
		this.current = 0;
		this.array = array;
	}
	hasNext() {
		return this.current < this.array.length;
	}
	next() {
		return this.array[this.current++];
	}
}
haxe_iterators_ArrayIterator.__name__ = true;
class js_Boot {
	static __string_rec(o,s) {
		if(o == null) {
			return "null";
		}
		if(s.length >= 5) {
			return "<...>";
		}
		let t = typeof(o);
		if(t == "function" && (o.__name__ || o.__ename__)) {
			t = "object";
		}
		switch(t) {
		case "function":
			return "<function>";
		case "object":
			if(o.__enum__) {
				let e = $hxEnums[o.__enum__];
				let n = e.__constructs__[o._hx_index];
				let con = e[n];
				if(con.__params__) {
					s = s + "\t";
					return n + "(" + ((function($this) {
						var $r;
						let _g = [];
						{
							let _g1 = 0;
							let _g2 = con.__params__;
							while(true) {
								if(!(_g1 < _g2.length)) {
									break;
								}
								let p = _g2[_g1];
								_g1 = _g1 + 1;
								_g.push(js_Boot.__string_rec(o[p],s));
							}
						}
						$r = _g;
						return $r;
					}(this))).join(",") + ")";
				} else {
					return n;
				}
			}
			if(((o) instanceof Array)) {
				let str = "[";
				s += "\t";
				let _g = 0;
				let _g1 = o.length;
				while(_g < _g1) {
					let i = _g++;
					str += (i > 0 ? "," : "") + js_Boot.__string_rec(o[i],s);
				}
				str += "]";
				return str;
			}
			let tostr;
			try {
				tostr = o.toString;
			} catch( _g ) {
				return "???";
			}
			if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
				let s2 = o.toString();
				if(s2 != "[object Object]") {
					return s2;
				}
			}
			let str = "{\n";
			s += "\t";
			let hasp = o.hasOwnProperty != null;
			let k = null;
			for( k in o ) {
			if(hasp && !o.hasOwnProperty(k)) {
				continue;
			}
			if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
				continue;
			}
			if(str.length != 2) {
				str += ", \n";
			}
			str += s + k + " : " + js_Boot.__string_rec(o[k],s);
			}
			s = s.substring(1);
			str += "\n" + s + "}";
			return str;
		case "string":
			return o;
		default:
			return String(o);
		}
	}
}
js_Boot.__name__ = true;
class _$LTGlobals_$ {
}
_$LTGlobals_$.__name__ = true;
class utils_Fn {
	static proto(obj) {
		return obj.prototype;
	}
	static updateProto(obj,fn) {
		return (fn)(obj.prototype);
	}
	static updateEntity(obj,fn) {
		return (fn)(obj);
	}
}
utils_Fn.__name__ = true;
function $getIterator(o) { if( o instanceof Array ) return new haxe_iterators_ArrayIterator(o); else return o.iterator(); }
String.__name__ = true;
Array.__name__ = true;
js_Boot.__toStr = ({ }).toString;
Main.main();
})(typeof exports != "undefined" ? exports : typeof window != "undefined" ? window : typeof self != "undefined" ? self : this, {});
