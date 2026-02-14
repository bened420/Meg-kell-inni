extends Node

#csak fejlesztes soran , kulso fajl beolvasasa a projekt mappabol tortenjen-e vagy a .exe fajl mellol
var _externalread = false

#--globális változók--
#jatek valtozok
var sor = 10
var refill = true
var currentkerdes = 0
#segitsegek
var csirke = true
var kozonseg = true
var felezes = true
var google = true
#jatek kerdesek
var kerdesek
var valaszok 
var helyesval


func _ready() -> void:
	pass 


func SajatKerdes(fajl_nev: String) -> String:
	if _externalread == true:
		var exehely = OS.get_executable_path()
		var dirhely = exehely.get_base_dir()
		var txthely = dirhely.path_join(fajl_nev)
		
	else:
		pass
	return "teszt"
