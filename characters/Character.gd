extends KinematicBody2D

signal health_changed
signal death

export (PackedScene) var Projectile
export (int) var speed
export (float) var rotation_speed
export (float) var skill_cooldown
export (int) var health

var velocity = Vector2()
var alive = true

func _ready():
	$SkillCooldown.wait_time = skill_cooldown
	
func control(delta):
	pass
	
func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)
