#!/bin/bash
export LUA_PATH="./?.lua;./?;$HOME/git/?/init.lua;$HOME/git/?/?.lua;./modules/?/init.lua;./modules/?/?.lua"
export LUA_PATH="./?.lua;./?;./modules/?/init.lua;./modules/?/?.lua"

# ensure xml lib is present
if ! lua -l luaxml -e "print 'found xml lib'" 2>/dev/null; then
	mkdir -p modules
	echo "installing xml lib"
	(cd modules && git clone https://github.com/natnat-mc/luaxml.git)
fi
if ! lua -l luatpl -e "print 'found tpl lib'" 2>/dev/null; then
	mkdir -p modules
	echo "installing tpl lib"
	(cd modules && git clone https://github.com/natnat-mc/luatpl.git)
fi

build/assets.sh && build/template.lua && build/css.sh
cp scripts/rebuild.php out
