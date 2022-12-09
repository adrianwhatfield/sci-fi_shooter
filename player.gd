extends KinematicBody2D

var lives = 3

var speed = 40000
var velocity = Vector2.ZERO

var laser_scene = load("res://laser.tscn")
export (PackedScene) var laser


func get_input():
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed

func get_shoot():
	if Input.is_action_just_pressed("shoot"):
		var l = laser_scene.instance()
		$AudioStreamPlayer.play()
		#print("shoot")
		owner.add_child(l)
		l.transform = $gun.global_transform

func _physics_process(delta):
	get_input()
	var motion = velocity * delta
	velocity = move_and_slide(motion)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_shoot()
