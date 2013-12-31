part of project_pluto;

class JsCodelet extends Codelet {
  JsCodelet() : this.verbose(new List(), null, null, context['JsCodelet']);
  
  JsCodelet.verbose(children, parent, next, this.object)
      : super.verbose(children, parent, next) {
    object['children'] = children;
    object['parent'] = parent;
    object['next'] = next;
  }
  
  /**
   * Represents the actual codelet in Javascript
   * This codelet should contain functions that are represented here
   * However, when it is called, it will be passed JsVariable objects, and 
   *   should modify those, NOT this object
   */
  JsObject object;
  
  /**
   * Executes the "logic" of the codelet, given the specified variables
   * Returns a new variable, or null.
   * !! Depending on thos variable, it may be allowable for this function to alter
   *   the variable !!
   */
  Variable onTick([List<Variable> variables]) {
    return object.callMethod('onTick', variables) as JsVariable;
  }
  
  /**
   * Provides a unique UUID to represent this codelet
   * This should be a 128 bit long random-number UUID
   * This can be obtained by using a site like http://www.famkruithof.net/uuid/uuidgen
   *   or (in linux) running cat /proc/sys/kernel/random/uuid
   */
  String getUuid() {
    return object.callMethod('getUuid');
  }
  /**
   * Returns a human-friendly name to identify this codelet.
   * This name will be parsed by the environment to provide
   *   input boxes for variables. These will be passed, in order,
   *   to the Codelet tick() function
   * 
   * Strings should be formatted as follows:
   *   
   *   for \[Variable\] in \[List<Variable>\]
   * 
   * Where the items between the square brackets are Dart data types
   *   that are acceptable input types. Primitives are also allowed
   * 
   * Equality codelets provide the same functionality as ==, !=, <=, >=, etc.
   * 
   * Some other inputs:
   *   while \[int\] \[EqualityCodelet\] \[int\]
   *   while \[bool\] \[EqualityCodelet\] true
   */
  String getName() {
    return object.callMethod('getName');
  }
  /**
   * Returns a human readable, Markdown formatted help text.
   * This will appear to the user when the help dialog is shown
   */
  String getHelp() {
    return object.callMethod('getHelp');
  }
  
  /**
   * Returns the next codelet to execute
   * If this codelet is a "child" of a loop and it is the
   *   last codelet in the loop, this function should
   *   return the "parent" codelet
   */
  Codelet nextCodelet([Codelet previous]) {
    return object.callMethod('nextCodelet', [previous]);
  }
}