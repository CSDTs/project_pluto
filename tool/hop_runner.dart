library hop_runner;

import 'package:hop/hop.dart';
import 'package:hop/hop_tasks.dart';
import 'dart:io';
import 'dart:async';

final allPassedRegExp = new RegExp('Total \\d+ passed, 0 failed, 0 errors');

main(List<String> args) {
  var paths = ['lib/project_pluto.dart'];
  
  addTask('analyze_libs', createAnalyzerTask(paths));
  
  addTask('test_js_codelet', createJsCodeletUnitTestTask());
  addTask('test_js_variable', createJsVariableUnitTestTask());
  
  runHop(args);
}

dynamic createJsCodeletUnitTestTask() {
  return (TaskContext ctx){
    ctx.info("Running Unit Tests....");
    var result = Process.run('./content_shell',
        ['--dump-render-tree',  'test/project_pluto/js_codelet_test.html']).then((ProcessResult process){
      ctx.info(process.stdout);
      if(allPassedRegExp.hasMatch(process.stdout) == false) {
        ctx.fail("Not all tasks passed");
      }
    });
    return result;
  };
}

dynamic createJsVariableUnitTestTask() {
  return (TaskContext ctx){
    ctx.info("Running Unit Tests....");
    var result = Process.run('./content_shell',
        ['--dump-render-tree',  'test/project_pluto/js_variable_test.html']).then((ProcessResult process){
      ctx.info(process.stdout);
      if(allPassedRegExp.hasMatch(process.stdout) == false) {
        ctx.fail("Not all tasks passed");
      }
    });
    return result;
  };
}