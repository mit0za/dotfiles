req = {
	--"volume",
	--"brightness",
	--"wifi",
	--"bluetooth",
	--"airplane",
	"weather",
	"battery",
	--"player",
	--"disk"
}

for _, x in pairs(req) do
	require("signals."..x)
end
