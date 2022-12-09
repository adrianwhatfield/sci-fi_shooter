extends Node2D

var enemy_scene = load("res://enemy.tscn")
signal scored

export (PackedScene) var enemy

func random():
	var random_generator = RandomNumberGenerator.new()
	random_generator.randomize()
	var random_num = random_generator.randi_range(1,3)
	return random_num

func spawn():
	var e = enemy_scene.instance()
	
	if random() == 1:
		$one.add_child(e)
	elif random() == 2:
		$two.add_child(e)
	else:
		$three.add_child(e)

func _on_Timer_timeout():
	random()
	spawn()


func _on_three_child_exiting_tree(node):
	emit_signal("scored")
	$AudioStreamPlayer.play()


func _on_two_child_exiting_tree(node):
	emit_signal("scored")
	$AudioStreamPlayer.play()


func _on_one_child_exiting_tree(node):
	emit_signal("scored")
	$AudioStreamPlayer.play()
