extends Control


func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _on_Button_pressed():
	get_tree().change_scene("res://menu.tscn")


func _on_fullscreen_pressed():
	if OS.window_fullscreen == true:
		OS.window_fullscreen = false
	elif OS.window_fullscreen == false:
		OS.window_fullscreen = true
