extends Area2D

var enemy_death_scene = load("res://enemy_death.tscn")
var e = enemy_death_scene.instance()
var speed = 150

func _physics_process(delta):
	position += transform.y * speed * delta

func _ready():
	pass

func _on_enemy_area_entered(_area):
	queue_free()
