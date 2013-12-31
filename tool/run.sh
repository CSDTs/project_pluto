#!/bin/bash
$DART_SDK/../chromium/download_contentshell.sh
unzip content_shell-linux-x64-release.zip
mv drt*/* .
ls -l
sudo start xvfb
dart tool/hop_runner.dart test_js_codelet
dart tool/hop_runner.dart test_js_variable