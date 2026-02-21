extends Control

@onready var kérdés = $MarginContainer/Panel/Label
const sör = preload("res://scenes/söci.tscn")
@onready var gombok = [
		$CenterContainer/GridContainer/A,
		$CenterContainer/GridContainer/B,
		$CenterContainer/GridContainer/C,
		$CenterContainer/GridContainer/D
	]
@onready var mainC = $"sörreset/MainVBOX"
@onready var vegleges = $CenterContainer2/MarginContainer/vegleges
@onready var refill = $refill
@onready var timerpos = $timerpos
@onready var isziktext = $CenterContainer3/MarginContainer/isziktext
const timer = preload("res://scenes/timer.tscn")

var helyes
var sörszám
var iszik = 0
var mainsor
var valasz_sorok = [0, 0, 0, 0] 
var csirkemezo
var ujra = false

func _ready() -> void:
	print(Global.kerdesekszama)
	if Global.csirke == false:
		$HBoxContainer/Csirke.queue_free()
	if Global.google == false:
		$HBoxContainer/Google.queue_free()
	if Global.felezes == false:
		$"HBoxContainer/Felezés".queue_free()
	if Global.kozonseg == false:
		$"HBoxContainer/Közönség".queue_free()
		
	kérdés.text = Global.kerdesek[0]["kerdes"]
	gombok[0].text = Global.kerdesek[0]["a"]
	gombok[1].text = Global.kerdesek[0]["b"]
	gombok[2].text = Global.kerdesek[0]["c"]
	gombok[3].text = Global.kerdesek[0]["d"]
	
	helyes = Global.kerdesek[0]["helyesindex"]
	Global.kerdesek.remove_at(0)
	
	sörszám = Global.sörszám
	mainsor = sörszám
	print(sörszám)
	for i in sörszám:
		var uj_sor = sör.instantiate()
		mainC.add_child(uj_sor)

func _process(delta: float) -> void:
	if Global.refill == true and sörszám <= 3:
		refill.show()

	
	if mainC.get_child_count() == 0:
		vegleges.show()
	else:
		vegleges.hide()

func _on_közönség_pressed() -> void:
	if timerpos.get_child_count() == 0:
		var ido = timer.instantiate()
		timerpos.add_child(ido)
		$"HBoxContainer/Közönség".queue_free()
		Global.kozonseg = false

func _on_csirke_pressed() -> void:
	var rng1 = RandomNumberGenerator.new()
	rng1.randomize()
	var random1 = rng1.randi_range(0, 3)
	while random1 == helyes:
		random1 = rng1.randi_range(0,3)
	csirkemezo = random1
	
	gombok[csirkemezo].self_modulate = Color.YELLOW
	$HBoxContainer/Csirke.queue_free()
	Global.csirke = false

func _on_felezés_pressed() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random = rng.randi_range(0, 3)
	var felezett = -1
	for i in 2:
		while random == helyes or random == felezett:
			random = rng.randi_range(0,3)
		felezett = random
		gombok[random].self_modulate = Color.RED
	
	$"HBoxContainer/Felezés".queue_free()
	Global.felezes = false

func _on_google_pressed() -> void:
	if timerpos.get_child_count() == 0:
		var ido = timer.instantiate()
		timerpos.add_child(ido)
		$"HBoxContainer/Google".queue_free()
		Global.google = false

func _on_a_pressed() -> void:
	if mainsor > 0 and valasz_sorok[0] < 10:
		var athelyezendo_sor = mainC.get_child(mainC.get_child_count() - 1)
		mainC.remove_child(athelyezendo_sor)
		$CenterContainer/GridContainer/A/aHBOX.add_child(athelyezendo_sor)
		mainsor -= 1
		valasz_sorok[0] += 1

func _on_b_pressed() -> void:
	if mainsor > 0 and valasz_sorok[1] < 10:
		var athelyezendo_sor = mainC.get_child(mainC.get_child_count() - 1)
		mainC.remove_child(athelyezendo_sor)
		$CenterContainer/GridContainer/B/bHBOX.add_child(athelyezendo_sor)
		mainsor -= 1
		valasz_sorok[1] += 1

func _on_c_pressed() -> void:
	if mainsor > 0 and valasz_sorok[2] < 10:
		var athelyezendo_sor = mainC.get_child(mainC.get_child_count() - 1)
		mainC.remove_child(athelyezendo_sor)
		$CenterContainer/GridContainer/C/cHBOX.add_child(athelyezendo_sor)
		mainsor -= 1
		valasz_sorok[2] += 1

func _on_d_pressed() -> void:
	if mainsor > 0 and valasz_sorok[3] < 10:
		var athelyezendo_sor = mainC.get_child(mainC.get_child_count() - 1)
		mainC.remove_child(athelyezendo_sor)
		$CenterContainer/GridContainer/D/dHBOX.add_child(athelyezendo_sor)
		mainsor -= 1
		valasz_sorok[3] += 1

func _on_sörreset_pressed() -> void:
	var valasz_kontenerek = [
		$CenterContainer/GridContainer/A/aHBOX,
		$CenterContainer/GridContainer/B/bHBOX,
		$CenterContainer/GridContainer/C/cHBOX,
		$CenterContainer/GridContainer/D/dHBOX
	]
	
	for kontener in valasz_kontenerek:
		while kontener.get_child_count() > 0:
			var sor_node = kontener.get_child(0)
			kontener.remove_child(sor_node)
			mainC.add_child(sor_node)
			
	for darab in valasz_sorok:
		mainsor += darab
		
	valasz_sorok = [0, 0, 0, 0]

func _on_refill_pressed() -> void:
	Global.sörszám = 10
	sörszám = 10
	mainsor = 10
	
	valasz_sorok = [0, 0, 0, 0]
	Global.refill = false 

	var osszes_kontener = [
		mainC,
		$CenterContainer/GridContainer/A/aHBOX,
		$CenterContainer/GridContainer/B/bHBOX,
		$CenterContainer/GridContainer/C/cHBOX,
		$CenterContainer/GridContainer/D/dHBOX
	]
	
	for kontener in osszes_kontener:
		for sor in kontener.get_children():
			sor.queue_free()
			
	for i in 10:
		var uj_sor = sör.instantiate()
		mainC.add_child(uj_sor)
	
	$refill.queue_free()

func _on_vegleges_pressed() -> void:
	if ujra:
		if Global.sörszám == 0 or Global.kerdesekszama == Global.jelenlegi:
			get_tree().change_scene_to_file("res://scenes/end_screen.tscn")
		else:
			Global.jelenlegi += 1
			get_tree().change_scene_to_file("res://scenes/game.tscn")
	else:
		for i in 4:
			if i == csirkemezo:
				pass
			elif i != helyes:
				gombok[i].self_modulate = Color.RED
			else:
				gombok[i].self_modulate = Color.GREEN
		if Global.csirke == true:
			for i in 4:
				if i != helyes:
					iszik += valasz_sorok[i]
			Global.sörszám -= iszik
			Global.összivott += iszik
			isziktext.text = Global.jatekos + " iszik " + str(iszik) + "db piát!"
			isziktext.show()
			vegleges.text = "Következő kör"
			ujra = true
		else:
			if valasz_sorok[helyes] == 0:
				for i in 4:
					if i != helyes:
						iszik += valasz_sorok[i]
				Global.sörszám -= iszik
				Global.összivott += iszik
				isziktext.text = Global.jatekos + " iszik " + str(iszik) + "db piát!"
				isziktext.show()
				vegleges.text = "Következő kör"
				ujra = true 
			else:
				for i in 4:
					if i != helyes and i != csirkemezo:
						iszik += valasz_sorok[i]
				Global.sörszám -= iszik
				Global.összivott += iszik
				isziktext.text = Global.jatekos + " iszik " + str(iszik) + "db piát!"
				isziktext.show()
				vegleges.text = "Következő kör"
				ujra = true
				
			
			
		
