extends Control

@onready var kérdés = $MarginContainer/Panel/Label
const sör = preload("res://scenes/söci.tscn")
@onready var A = $CenterContainer/GridContainer/A
@onready var B = $CenterContainer/GridContainer/B
@onready var C = $CenterContainer/GridContainer/C
@onready var D = $CenterContainer/GridContainer/D
@onready var mainC = $"sörreset/MainVBOX"
@onready var vegleges = $CenterContainer2/MarginContainer/vegleges
@onready var refill = $refill

var helyes
var sörszám
var mainsor
var Asor = 0
var Bsor = 0
var Csor = 0
var Dsor = 0


func _ready() -> void:
	if Global.csirke == false:
		$HBoxContainer/Csirke.queue_free()
	if Global.google == false:
		$HBoxContainer/Google.queue_free()
	if Global.felezes == false:
		$"HBoxContainer/Felezés".queue_free()
	if Global.kozonseg == false:
		$"HBoxContainer/Közönség".queue_free()
	kérdés.text = Global.kerdesek[0]["kerdes"]
	A.text = Global.kerdesek[0]["a"]
	B.text = Global.kerdesek[0]["b"]
	C.text = Global.kerdesek[0]["c"]
	D.text = Global.kerdesek[0]["d"]
	helyes = Global.kerdesek[0]["helyesindex"]
	Global.kerdesek.remove_at(0)
	sörszám = Global.sörszám
	mainsor = sörszám
	for i in sörszám:
		var uj_sor = sör.instantiate()
		mainC.add_child(uj_sor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.refill == true and sörszám < 3:
		refill.show()
	else:
		refill.hide()
	
	if mainC.get_child_count() == 0:
		vegleges.show()
	else:
		vegleges.hide()


func _on_közönség_pressed() -> void:
	$"HBoxContainer/Közönség".queue_free()
	Global.kozonseg = false


func _on_csirke_pressed() -> void:
	$HBoxContainer/Csirke.queue_free()
	Global.csirke = false


func _on_felezés_pressed() -> void:
	$"HBoxContainer/Felezés".queue_free()
	Global.felezes = false


func _on_google_pressed() -> void:
	$HBoxContainer/Google.queue_free()
	Global.google = false


func _on_a_pressed() -> void:
	if mainsor > 0 and Asor < 10:
		var athelyezendo_sor = mainC.get_child(mainC.get_child_count() - 1)
		mainC.remove_child(athelyezendo_sor)
		$CenterContainer/GridContainer/A/aHBOX.add_child(athelyezendo_sor)
		mainsor -= 1
		Asor += 1
		


func _on_b_pressed() -> void:
	if mainsor > 0 and Bsor < 10:
		var athelyezendo_sor = mainC.get_child(mainC.get_child_count() - 1)
		mainC.remove_child(athelyezendo_sor)
		$CenterContainer/GridContainer/B/bHBOX.add_child(athelyezendo_sor)
		mainsor -= 1
		Bsor += 1


func _on_c_pressed() -> void:
	if mainsor > 0 and Csor < 10:
		var athelyezendo_sor = mainC.get_child(mainC.get_child_count() - 1)
		mainC.remove_child(athelyezendo_sor)
		$CenterContainer/GridContainer/C/cHBOX.add_child(athelyezendo_sor)
		mainsor -= 1
		Csor += 1


func _on_d_pressed() -> void:
	if mainsor > 0 and Dsor < 10:
		var athelyezendo_sor = mainC.get_child(mainC.get_child_count() - 1)
		mainC.remove_child(athelyezendo_sor)
		$CenterContainer/GridContainer/D/dHBOX.add_child(athelyezendo_sor)
		mainsor -= 1
		Dsor += 1


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
			
	mainsor = mainsor + Asor + Bsor + Csor + Dsor 
	Asor = 0
	Bsor = 0
	Csor = 0
	Dsor = 0


func _on_refill_pressed() -> void:
	Global.sörszám = 10
