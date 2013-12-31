#!/bin/bash
if [ ! -e content_shell-linux-x64-release.zip ]; then
	$DART_SDK/../chromium/download_contentshell.sh
	unzip content_shell-linux-x64-release.zip
	mv ./drt-* ./drt_contentshell
	ln -s ./drt_contentshell/content_shell .
fi
sudo start xvfb
dart --checked tool/hop_runner.dart test_js_codelet ||
	dart tool/hop_runner.dart test_js_variable
exit $?