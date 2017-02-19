local function ActiveMaintenance(ply, text, team)
	
	ReadingFile = util.JSONToTable(file.Read("ma_data/mastate.txt","DATA"))

	if ply:IsAdmin() and text == "/maon" and ReadingFile.State != true  then

		for k, v in pairs(player.GetHumans()) do

			if not v:IsAdmin() then

				v:Kick("Maintenance")

			elseif v:IsAdmin() then

				-- Ne rien faire	

			end

		end

		file.Write("ma_data/mastate.txt", util.TableToJSON({State = true}))

		ply:ChatPrint("Maintenance activé !")

		return ""

	elseif ply:IsAdmin() and text == "/maon" and ReadingFile.State == true then

		ply:ChatPrint("Erreur : La maintenance est déjà active")

		return ""

	elseif ply:IsAdmin() and text == "/maoff" and ReadingFile.State != false then

		file.Write("ma_data/mastate.txt", util.TableToJSON({State = false}))

		ply:ChatPrint("Maintenance désactivé !")

		return ""

	elseif ply:IsAdmin() and text == "/maoff" and ReadingFile.State == false then

		ply:ChatPrint("Erreur : La maintenance est déjà inactive")

		return ""

	elseif not ply:IsAdmin() and text == "/maon" then

		ply:ChatPrint("Erreur : Vous n\'êtes pas Administrateur")

		return ""

	elseif not ply:IsAdmin() and text == "/maoff" then

		ply:ChatPrint("Erreur : Vous n\'êtes pas Administrateur")

		return ""

	else return end

end

hook.Add("PlayerSay", "ActiveOrNot", ActiveMaintenance)

local function KickPlayersOnMaintenanceOn(ply)

	ReadingFile = util.JSONToTable(file.Read("ma_data/mastate.txt","DATA"))

	if not ply:IsAdmin() and ReadingFile.State == true then

		ply:Kick("Maintenance")

	elseif ply:IsAdmin() and ReadingFile.State == true then

		-- Ne rien faire

	end

end

hook.Add("PlayerAuthed","KickOnMaintenanceOn",KickPlayersOnMaintenanceOn)