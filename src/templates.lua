print()

local templates={}

for line in io.popen('ls -1 src/pages'):lines() do
	if not templates[line] then
		local fd=io.open('src/pages/'..line)
		local html=fd:read '*a'
		if not html then
			error("Failed to read HTML of "..line)
		end
		fd:close()
		local title=html:match("<h1>([^<]+)</h1>")
		print("Found page "..line.." with"..(title and (" title: "..title) or "out title"))
		templates[line]={
			template="base.html",
			values={
				title=title,
				html=html
			}
		}
	end
end

return templates
