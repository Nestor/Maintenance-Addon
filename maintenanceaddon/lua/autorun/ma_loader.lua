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
