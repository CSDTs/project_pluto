part of project_pluto;

abstract class Codelet {
  Codelet() : this.verbose(new List(), null, null);
  
  Codelet.verbose(this.children, this.parent, this.next);
  
  /**
   * Executes the "logic" of the codelet, given the specified variables
   * Returns a new variable, or null.
   * !! Depending on thos variable, it may be allowable for this function to alter
   *   the variable !!
   */
  Variable onTick([List<Variable> variables]);
  
  /**
   * Provides a unique UUID to represent this codelet
   * This should be a 128 bit long random-number UUID
   * This can be obtained by using a site like http://www.famkruithof.net/uuid/uuidgen
   *   or (in linux) running cat /proc/sys/kernel/random/uuid
   */
  String getUuid();
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
  String getName();
  /**
   * Returns a human readable, Markdown formatted help text.
   * This will appear to the user when the help dialog is shown
   */
  String getHelp();
  
  /**
   * Returns the next codelet to execute
   * If this codelet is a "child" of a loop and it is the
   *   last codelet in the loop, this function should
   *   return the "parent" codelet
   */
  Codelet nextCodelet([Codelet previous]);
  
  /**
   * Contains a list of [Codelet]s that are "children" of this one
   * For example, in a for loop this would contains a list of
   *   all codelets which get executed inside of the loop
   * Order matters!
   */
  List<Codelet> children;
  /**
   * Indicates the "parent" of this codelet. This could be useful for a 
   *   break statement, or a return
   */
  Codelet parent;
  /**
   * Indicates the next codelet of the same level.
   */
  Codelet next;
}