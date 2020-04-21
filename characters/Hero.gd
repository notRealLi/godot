extends "res://characters/Character.gd"

func control(delta):
	$Weapon.look_at(get_global_mouse_position())
	if get_global_mouse_position().x < self.position.x:
		$Body.flip_h = true
		$Weapon.flip_v = true
	else:
		$Body.flip_h = false
		$Weapon.flip_v = false
		
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity += Vector2(speed, 0)
	
	if Input.is_action_pressed("left"):
		velocity += Vector2(-speed, 0)
		
	if Input.is_action_pressed("up"):
		velocity += Vector2(0, -speed)
	
	if Input.is_action_pressed("down"):
		velocity += Vector2(0, speed)
