#!/usr/bin/env lua

-- load XML lib
local xml=require 'luaxml.xml'

-- load config
local list=require 'src.templates'

-- create output directory
os.execute('mkdir -p out')

-- file reader
local function readall(filename)
	local fd=io.open(filename, 'r')
	local data=fd:read('*a')
	fd:close()
	return data
end

-- file writer
local function writeall(filename, data)
	local fd=io.open(filename, 'w')
	fd:write(data)
	fd:close()
end

-- template reader
local function readtemplate(name)
	return xml.parse(readall('src/templates/'..list.templates[name]))
end

-- indexof
local function indexof(tab, val)
	for i, v in ipairs(tab) do
		if v==val then
			return i
		end
	end
end

-- template renderer
local function rendertemplate(template, values)
	for k, v in pairs(values) do
		local substituables=template:queryselectorall('substituable.'..k)
		for i, substituable in ipairs(substituables) do
			local siblings=substituable.parent.children
			local index=indexof(siblings, substituable)
			siblings[index]=xml.createtextnode(v)
		end
	end
end

-- render pages
for k, v in pairs(list.pages) do
	io.write("Rendering "..k..'\n')
	
	-- load the template
	local template=readtemplate(v.template)
	
	-- load the data
	v.values.html=readall('src/pages/'..k)
	
	-- render everything
	rendertemplate(template, v.values)
	
	-- write the file
	writeall('out/'..k, template:dump(true, true))
end

-- create the zip
io.write("Writing zip\n")
os.execute('zip -r pages.zip out')
