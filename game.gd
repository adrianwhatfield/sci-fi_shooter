extends Node2D


var lives = 3
var score = 0

func _ready():
	pass


func _process(_delta):
	if lives == 0:
		$UI/HBoxContainer/life.hide()
		$UI/HBoxContainer/life2.hide()
		$UI/HBoxContainer/life3.hide()
		get_tree().reload_current_scene()
	elif lives == 2:
		$UI/HBoxContainer/life3.hide()
	elif lives == 1:
		$UI/HBoxContainer/life2.hide()
		$UI/HBoxContainer/life3.hide()
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://menu.tscn")
	
	$UI/HBoxContainer2/score.text = str(score)
	
	if score == 100:
		$spawner/Timer.wait_time = 1.5
	elif score == 200:
		$spawner/Timer.wait_time = 1
	elif score == 300:
		$spawner/Timer.wait_time = 0.5


func _on_Timer_timeout():
	$UI/mission.percent_visible = 0


func _on_hitbox_area_entered(area):
	lives -= 1
	score -= 10


func _on_spawner_scored():
	score += 10
