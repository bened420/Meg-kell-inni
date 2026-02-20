extends Node

#ha true akkor projekten belul olvas, .exe-nel legyen true
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
var kerdesek: Array[Dictionary] = []
#jatekosok es kerdes
var jatekosok = []
var txtlista = []


func _ready() -> void:
	SajatKerdes("teszt.txt");
	
	

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func SajatKerdes(fajl_nev: String) -> String:
	if _externalread == true:
		var exehely = OS.get_executable_path()
		var dirhely = exehely.get_base_dir()
		var txthely = dirhely.path_join(fajl_nev)
		if not FileAccess.file_exists(txthely):
			return "Fajl nem letezik"
		else:
			var fajl = FileAccess.open(txthely,FileAccess.READ)
			while not fajl.eof_reached():
				var line = fajl.get_line().strip_edges()
				if line.is_empty():
					continue
				var reszek = line.split(";")
				if reszek.size() >= 6:
					var kerdesek_szotar = {
					"kerdes": reszek[0],
					"a": reszek[1],
					"b": reszek[2],
					"c": reszek[3],
					"d": reszek[4],
					"helyesindex": reszek[5].to_int()-1
					}
					kerdesek.append(kerdesek_szotar)
				else:
					return fajl_nev
			
	else:
		var teszttxt = "res://teszt.txt"
		if not FileAccess.file_exists(teszttxt):
			return "Fajl nem letezik"
		else:
			var fajl = FileAccess.open(teszttxt,FileAccess.READ)
			while not fajl.eof_reached():
				var line = fajl.get_line().strip_edges()
				if line.is_empty():
					continue
				var reszek = line.split(";")
				if reszek.size() >= 6:
					var kerdesek_szotar = {
					"kerdes": reszek[0],
					"a": reszek[1],
					"b": reszek[2],
					"c": reszek[3],
					"d": reszek[4],
					"helyesindex": reszek[5].to_int()-1
					}
					kerdesek.append(kerdesek_szotar)
				else:
					return "hibas teszt"
	return "OK"
