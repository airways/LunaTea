package macros;

#if macro
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.TypeTools;

using haxe.macro.Tools;
using Lambda;
#end

class FnMacros {
 public static macro function pipe(exprs: Array<Expr>): Expr {
  var exprs = [for (expr in exprs) macro var _ = $expr];
  exprs.push(macro _);
  return macro $b{exprs};
 }

 public static macro function destruct(entity: Expr,
   fieldNames: Array<ExprOf<String>>): Expr {
  var pos = Context.currentPos();
  var localVars = Context.getLocalVars();
  var classFields = Context.getLocalClass().get().fields;

  var fields: Array<Expr> = [];

  var tentity = Context.typeof(entity);
  switch (TypeTools.follow(tentity)) {
   case TAnonymous(_.get() => tr):
    for (field in tr.fields) {
     var name = field.name;
     var value = field.expr();

     var tmp = macro $v{value};

     fields.push(macro var $name = $tmp);
     localVars.set(name, field.type);
     classFields.get().push(field);
     //  localVars.clear();
    }
   case _:
    return Context.error("Object type expected instead of"
     + tentity.getName(), pos); // Do nothing
  }

  // for (element in entity) {
  //  trace(element);
  //  if (fieldNames.contains(element)) {
  //   var fieldNameValue = macro entity.$element;
  //   fields.push(macro var element = entity.$element);
  //  }
  // };

  fields.push(macro var hello = 3);
  return macro $b{fields};
 }

 public static inline macro function self(typeName: Expr,
   exprs: Array<Expr>): Expr {
  var finalType = '';
  // Breakdown Expression Based On Type
  switch (typeName.expr) {
   case EConst(const):
    switch (const) {
     case CIdent(identifier):
      finalType = identifier;

     case CString(str, _):
      finalType = str;
     case _:
      // Do nothing
    }
   case _:
    // Do nothing
  }

  exprs.unshift(Context.parseInlineString('var self:${finalType} = Fn.self',
   Context.currentPos()));
  return macro $b{exprs};
 }

 // Credit https://code.haxe.org/category/macros/combine-objects.html
 // we use an Array<Expr>, because we want the macro to work on variable amount of structures
 public static macro function combine(rest: Array<Expr>): Expr {
  var pos = Context.currentPos();
  var block = [];
  var cnt = 1;
  // since we want to allow duplicate field names, we use a Map. The last occurrence wins.
  var all = new Map<String, haxe.macro.ObjectField>();
  for (rx in rest) {
   var trest = Context.typeof(rx);
   switch (trest.follow()) {
    case TAnonymous(_.get() => tr):
     // for each parameter we create a tmp var with an unique name.
     // we need a tmp var in the case, the parameter is the result of a complex expression.
     var tmp = "tmp_" + cnt;
     cnt++;
     var extVar = macro $i{tmp};
     block.push(macro var $tmp = $rx);
     for (field in tr.fields) {
      var fname = field.name;
      all.set(fname, {field: fname, expr: macro $extVar.$fname});
     }
    default:
     return Context.error("Object type expected instead of "
      + trest.toString(), rx.pos);
   }
  }
  var result = {expr: EObjectDecl(all.array()), pos: pos};
  block.push(macro $result);
  return macro $b{block};
 }

 /**
  * This macro allows you to patch a JS class and create
  * a prototype patches for the code.
  * @param rest
  * @return Expr
  */
 public static macro function jsPatch(rest: Array<Expr>): Expr {
  var newPatchExprs = [];

  for (classInfo in rest) {
   trace(classInfo);
  }

  // Return new result macro of the patched class fields
  return macro $b{newPatchExprs};
 }
}
