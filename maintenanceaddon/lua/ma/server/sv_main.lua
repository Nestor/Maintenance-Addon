/*

	French :

	Créateur : "Zozo832" sur "github.com" ( https://github.com/Zozo832 ) et "Zozo147" sur "mtxserv.fr" ( https://www.mtxserv.fr/forums/members/zozo147.45708/ )
	
	Ce travail est sous la licence Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
	
	Pour voir une copie de cette licence veuillez vous rendre sur : https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
	
	English :
	
	Creator : "Zozo832" on "github.com" ( https://github.com/Zozo832 ) and "Zozo147" on "mtxserv.fr" ( https://www.mtxserv.fr/forums/members/zozo147.45708/ )
	
	This work is licensed under the 
	Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
	
	To view a copy of this license please go to : https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode

*/

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
