if SERVER then

	include("ma/server/sv_main.lua")

	if not file.IsDir("ma_data", "DATA") then

		file.CreateDir("ma_data")

	end

	if not file.Exists("ma_data/mastate.txt","DATA") then

		file.Write("ma_data/mastate.txt",util.TableToJSON({State = false}))

	end

end

if CLIENT then return end