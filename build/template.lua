#!/usr/bin/env lua

--BEGIN variables
local indir='src/pages'
local outdir='out'
--END variables

-- create output directory
io.popen('mkdir -p out')

-- list all pages
local pages={}
for page in io.popen('ls -1 "'..indir..'"'):lines() do
	table.insert(pages, page)
end
io.write(#pages.." pages found\n")

-- convert the page
for i, page in ipairs(pages) do
	io.write(page..'\n')
	--FIXME use actual templates
	io.popen('cp "'..indir..'/'..page..'" "'..outdir..'"')
end
