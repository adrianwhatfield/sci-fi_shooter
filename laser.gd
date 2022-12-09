extends Area2D

var speed = -2100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	position += transform.y * speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_laser_area_entered(_area):
	queue_free()
