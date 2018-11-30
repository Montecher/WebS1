#!/bin/sh
ls out/*.html 2>&1 >/dev/null || exit 1
ls out/res/styles.css 2>&1 >/dev/null || exit 1
java -jar /tools/vnu.jar --verbose --also-check-css out/*.html out/res/styles.css
