package rm.windows;

import rm.objects.Game_Actor;
import rm.core.Rectangle;

/**
 * -----------------------------------------------------------------------------
 * Window_NameEdit
 *
 * The window for editing an actor's name on the name input screen.
 * @class Window_NameEdit
 */
@:expose("Window_NameEdit")
@:native("Window_NameEdit")
@:build(macros.BuildMacroTools.buildDynamicFunctions())
@:build(macros.BuildMacroTools.buildPublicPrivateFields())
extern class Window_NameEdit {
 private var _name: String;
 private var _index: Float;

 /**
  * Creates an instance of Window_NameEdit.
  * @param {Game_Actor} actor
  * @param {number} maxLength
  * @memberof Window_NameEdit
  */
 public function new(actor: Game_Actor, maxLength: Float);

 /**
  * Returns the window width.
  *
  * @returns {number}
  * @memberof Window_NameEdit
  */
 public function windowWidth(): Float;

 /**
  * Returns the window height.
  *
  * @returns {number}
  * @memberof Window_NameEdit
  */
 public function windowHeight(): Float;

 // "name" is defines already by superclass(PIXI.DisplayObject).
 // name(): String;
 public function restoreDefault(): Bool;

 public function add(ch: String): Bool;
 public function back(): Bool;

 /**
  * Returns the width of the character face.
  *
  * @returns {number}
  * @memberof Window_NameEdit
  */
 public function faceWidth(): Float;

 /**
  * Returns the width of a character.
  *
  * @returns {number}
  * @memberof Window_NameEdit
  */
 public function charWidth(): Float;

 public function left(): Float;
 public function underlineRect(index: Int): Rectangle;

 /**
  * Returns the color of the underline as a css color String.
  *
  * @returns {String}
  * @memberof Window_NameEdit
  */
 public function underlineColor(): String;

 /**
  * Draws the underline at the given index of the window.
  *
  * @param {number} index
  * @memberof Window_NameEdit
  */
 public function drawUnderline(index: Int): Void;

 /**
  * Draws a character within the window at the specified index.
  *
  * @param {number} index
  * @memberof Window_NameEdit
  */
 public function drawChar(index: Int): Void;

 /**
  * Refreshes the window contents.
  *
  * @memberof Window_NameEdit
  */
 public function refresh(): Void;
}
