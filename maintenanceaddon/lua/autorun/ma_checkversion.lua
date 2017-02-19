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

if not SERVER then return end

LocalVersion = 1.1
url_version = "https://raw.githubusercontent.com/Zozo832/Maintenance-Addon/master/version" 

local function CheckVersion()

	http.Fetch(url_version,

		function(body, size, headers, code)

		InternetVersion = tonumber(body)

		if LocalVersion != InternetVersion then
			
			MsgC(Color(255,0,55,255), "Attention - Maintenance Addon n\'est pas à jour, dernière version : \n", Color(255,255,255,255), "https://github.com/Zozo832/Maintenance-Addon\n")

		else 

			MsgC(Color(117,213,0,255), "Maintenance Addon est à jour\n")

		end

		end,

		function(connectionfailed)

			MsgC(Color(255,0,55,255), "Attention - Maintenance Addon n\'arrive pas à se connecter à Github pour vérifier la version, erreur : " .. connectionfailed .. "\n")

		end)

end

timer.Simple(20,CheckVersion)
