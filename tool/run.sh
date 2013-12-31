#!/bin/bash
sudo start xvfb
dart tool/hop_runner.dart test_js_codelet
dart tool/hop_runner.dart test_js_variable