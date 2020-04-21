extends "res://characters/Character.gd"

onready var parent = get_parent()
export (int) var detect_radius

var target = null

func _ready():
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius

func control(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
		parent.set_rotate(false)
		position = Vector2(0, 0)
		
func _physics_process(delta):  
	if global_rotation_degrees > 90 or global_rotation_degrees < -90:  
		$Body.flip_v = true
	else:  
		$Body.flip_v = false  

func _on_DetectRadius_body_entered(body):
	if body.name == "Hero":
		target = body

func _process(delta):
	if target:
		if target.position.x < self.position.x:
			$Body.flip_h = false
		else:
			$Body.flip_h = true

func _on_DetectRadius_body_exited(body):
	if body == target:
		target == null
