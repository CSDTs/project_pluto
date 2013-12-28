part of project_pluto;

/**
 * This class is returned by Codelets when they have an "output"
 * It can be passed to and from other codelets
 */
abstract class Variable {
  String getName();
  
  /**
   * Given another variables, compares this variable to the other
   * Returns:
   *  0 if this variable is equal to the other
   *  > 0 if this variable is greater than the other
   *  < 0 if this variable is less than the other
   * If two things shouldn't be comparable, this should throw a [ArgumentError]
   */
  int compare(Variable other);
}