extends Control

var time: float = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.sörszám == 0:
		$Label.text = "Sajnos " + Global.jatekos + " veszített! :("
	else:
		$Label.text = Global.jatekos + " megnyerte a játékot, összesen " + str(Global.összivott) + " piát ivott!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = time - delta
	if time <= 0:
		get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
