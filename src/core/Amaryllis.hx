package core;

import js.lib.ArrayBuffer;
import js.html.Document;
import js.html.Blob;
import js.lib.Promise;
import js.html.XMLHttpRequestResponseType;
import rm.types.LunaTea.XMLResponseTypeA;
import js.html.XMLHttpRequest;
import rm.types.LunaTea.MimeTypeA;
import haxe.io.Mime;
import js.html.MimeType;
import js.Syntax;
import rm.scenes.Scene_Base;
import utils.Fn;
import rm.windows.Window_Base;
import haxe.Json;
import haxe.Constraints.Function;
import rm.managers.ImageManager;
import rm.managers.SceneManager;
import pixi.interaction.EventEmitter;
import rm.core.Utils;

using Lambda;

class Amaryllis {
 public static final VERSION = '1.0.0';
 public static final MZ_NAME = Utils.RPGMAKER_NAME;
 public static final MZ_VERSION = Utils.RPGMAKER_VERSION;

 public static inline function createEventEmitter() {
  return new EventEmitter();
 }

 public static inline function createDie(sides: Int): Die {
  return new Die(sides);
 }

 public static inline function elementName(entity: Dynamic) {
  return entity.constructor.name;
 }

 /**
  * Returns plugin parameters using regular expression matching
  * on plugin description
  * @param regEx
  */
 public static function getParams(regEx: EReg) {
 }

 /**
  * Applies Linear Interpolation to the variable provided
  * @param start
  * @param end
  * @param amount
  * @return {Float}
  */
 public static function lerp(start: Float, end: Float, amount: Float): Float {
  return start + ((end - start) * amount);
 }

 /**
  * Returns the current SceneManager._scene.
  * @returns {Scene}
  */
 public static inline function currentScene() {
  return SceneManager.currentScene;
 }

 public static inline function isImagePath(path: String) {
  return path.split("/").length > 2 ? true : false;
 }

 public static inline function loadImage(path: String, hue: Int = 0) {
  return isImagePath(path) ? ImageManager.loadNormalBitmap(path + ".png",
   hue) : null;
 }

 /**
  * Encodes a URI string without the slash character.
  * Note there is a haxe version using StringTools.
  * @param String
  * @returns String
  */
 public static inline function encodeURI(string: String) {
  return Syntax.code('encodeURIComponent({0}).replace(/%2F/g, "/");', string);
 }

 /**
  * Returns text content within a promise
  * in RPGMakerMV/MZ.
  * @param path
  * @param fileName
  * @return Promise<String>
  */
 public static inline function loadText(path: String,
   ?fileName: String): Promise<String> {
  var path = fileName != null ? encodeURI(path + fileName) : encodeURI(path);
  return loadData(path, XMLResponseTypeA.TEXT);
 }

 /**
  * Returns blob content within a promise
  * in RPGMakerMV/MZ.
  * @param path
  * @param fileName
  * @return Promise<Blob>
  */
 public static inline function loadBlob(path: String,
   ?fileName: String): Promise<Blob> {
  var path = fileName != null ? encodeURI(path + fileName) : encodeURI(path);
  return loadData(path, XMLResponseTypeA.BLOB);
 }

 /**
  * Returns JSON content within a promise
  * in RPGMakerMV/MZ.
  * @param path
  * @param fileName
  * @return Promise<Json>
  */
 public static inline function loadJSON(path: String,
   ?fileName: String): Promise<Json> {
  var path = fileName != null ? encodeURI(path + fileName) : encodeURI(path);
  return loadData(path, XMLResponseTypeA.JSON);
 }

 /**
  * Returns Document object content within a promise
  * in RPGMakerMV/MZ.
  * @param path
  * @param fileName
  * @return Promise<Document>
  */
 public static inline function loadDocument(path: String,
   ?fileName: String): Promise<Document> {
  var path = fileName != null ? encodeURI(path + fileName) : encodeURI(path);
  return loadData(path, XMLResponseTypeA.DOCUMENT);
 }

 /**
  * Returns array buffer content within a promise
  * in RPGMakerMV/MZ.
  * @param path
  * @param fileName
  * @return Promise<ArrayBuffer>
  */
 public static inline function loadArrayBuff(path: String,
   ?fileName: String): Promise<ArrayBuffer> {
  var path = fileName != null ? encodeURI(path + fileName) : encodeURI(path);
  return loadData(path, XMLResponseTypeA.ARRAYBUFFER);
 }

 /**
  * Returns true if the game is running on desktop(nwjs).
  * @returns {boolean}
  */
 public static inline function isNwjs() {
  return Utils.isNwjs();
 }

 /**
  * Returns true if the game is running on mobile.
  * @returns{boolean}
  */
 public static inline function isMobile() {
  return Utils.isMobileDevice();
 }

 /**
  * Returns true if the game is in test mode.
  * @returns {boolean}
  */
 public static inline function isTest() {
  return Utils.isOptionValid("test");
 }

 /**
  * Creates a function that only be run once.
  * @param {Function} f
  * @returns {Function}
  */
 public static function once(f: Function) {
  var count = 0;
  return function() {
   if (count > 0)
    return null;
   else {
    count++;
    return f();
   }
  };
 }

 /**
  * Repeats the code a set number of times
  * similar to a for loop.
  * @param {number} iterations
  * @param {Function} f
  */
 public static function times(iterations: Int, f: Function) {
  for (i in 0...iterations) {
   f();
  }
 }

 public static function safeParse(string: String) {
  try {
   return Json.parse(string);
  } catch (err) {
   return err;
  }
 }

 /**
  * Returns a number based on the game's default lineHeight.
  * @param {number} number
  * @returns {number}
  */
 public static inline function lines(num: Int) {
  return Fn.proto(Window_Base).lineHeight() * num;
 }

 /**
  * Returns rgb as a css hex string.
  * @param {number} red
  * @param {number} green
  * @param {number} blue
  * @returns {string}
  */
 public static inline function rgbToHex(red: Int, green: Int, blue: Int) {
  final hex = pixi.core.utils.Utils.rgb2hex([red, green, blue]);
  return pixi.core.utils.Utils.hex2string(hex);
 }

 /**
  * Returns a rgb in css format string.
  * @param {Int} red
  * @param {Int} green
  * @param {Int} blue
  * @returns {string}
  */
 public static inline function rgbToCss(red: Int, green: Int, blue: Int) {
  return Utils.rgbToCssColor(red, green, blue);
 }

 /**
  * Clears an array of all values.
  * @param {Array<Any>} array
  */
 public static inline function clear(array: Array<Any>) {
  array.resize(0);
  return array;
 }

 /**
  * Takes a set amount of elements from the start of an array.
     * Doesn't modify the original array.
  * @param {number} amount
  * @param {any[]} list
  * @returns {any[]}
  */
 public static inline function take(amount: Int, list: Array<Any>) {
  return list.slice(0, amount);
 }

 /**
  * Takes a set amount of elements from the end of an array.
  * Doesn't modify the original array.
  * @param {number} amount
  * @param {any[]} list
  * @returns {any[]}
  */
 public static inline function drop(amount: Int, list: Array<Any>) {
  return list.slice(amount * -1);
 }

 public static inline function arrayEquals(arr1: Array<Any>,
   arr2: Array<Any>) {
  return arr1.length == arr2.length
   && !arr1.has((el, index) -> el != arr2[index]);
 }

 public static inline function addWindowToScene(window: Window_Base) {
  var scene: Scene_Base = currentScene();
  scene.windowLayer.addChild(window);
 }

 public static function loadData<T>(url: String,
   responseType: XMLResponseTypeA): Promise<T> {
  return new Promise((resolve, reject) -> {
   var xhr = new XMLHttpRequest();
   xhr.open("GET", url);
   xhr.responseType = cast responseType;
   xhr.onload = () -> {
    if (xhr.status < 400) {
     resolve(xhr.response);
    } else {
     reject("Failed to load" + url);
    }
   }
   xhr.send(null);
  });
 }
}
