part of project_pluto;

class JsVariable extends Variable {
  
  JsObject object;
  String getName() {
    return object.callMethod('getName');
  }
  
  /**
   * Given another variables, compares this variable to the other
   * Returns:
   *  0 if this variable is equal to the other
   *  > 0 if this variable is greater than the other
   *  < 0 if this variable is less than the other
   * If two things shouldn't be comparable, this should throw a [ArgumentError]
   */
  int compare(Variable other) {
    return object.callMethod('compare', [other]);
  }
}