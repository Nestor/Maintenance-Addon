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