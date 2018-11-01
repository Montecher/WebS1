#!/usr/bin/env lua

-- load XML and template libs
local xml, tpl=require 'luaxml', require 'luatpl'

-- load config
local list=require 'src.templates'

-- create output directory
os.execute('mkdir -p out')

-- list of templates
local templates={}
local function gettpl(name)
	if not templates[name] then
		templates[name]=tpl.parse(io.open('src/templates/'..name))
	end
	return templates[name]
end

-- execute all templates
for name, data in pairs(list) do
	local template=gettpl(data.template)
	local html=template:render(data.values)
	local fd=io.open('out/'..name, 'w')
	fd:write(html)
	fd:close()
end

-- create the zip
io.write("Writing zip\n")
os.execute('zip -r pages.zip out')
