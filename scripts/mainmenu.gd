extends Control

@onready var line = $MarginContainer/VBoxContainer/HBoxContainer/LineEdit
@onready var options = $MarginContainer/VBoxContainer/HBoxContainer/OptionButton


func _ready() -> void:
	Global.sörszám = 10
	Global.kerdesek.clear()
	Fajlok()
	

func Fajlok() -> void:
	var mappa
	if Global._externalread:
		mappa = OS.get_executable_path().get_base_dir()
		print(mappa)
	else:
		mappa = "res://"
	var dir = DirAccess.open(mappa)
	if dir:
		options.clear()
		for fajl in dir.get_files():
			if fajl.ends_with(".txt"):
				options.add_item(fajl)
				

func _process(delta: float) -> void:
	pass
	


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	Global.txt = options.get_item_text(options.selected)
	print(Global.txt)
	Global.SajatKerdes(Global.txt)
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_line_edit_text_changed(new_text: String) -> void:
	Global.jatekos = line.text


func _on_option_button_item_selected(index: int) -> void:
	pass # Replace with function body.
