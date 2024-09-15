extends KinematicBody2D

var speed = 500
var motion = Vector2()




func _physics_process(delta):
	Globale.ro = rotation_degrees
	Globale.pla_pos = global_position
	if motion!=Vector2(0,0) and Globale.health>0:
		var shadow = preload("res://player/shodow.tscn").instance()
		shadow.global_position = global_position
		shadow.rotation_degrees = rotation_degrees
		get_parent().add_child(shadow)
	if Globale.smg_shoot == true:
		Globale.awm_shoot == false
		$Sprite.modulate = Color(0, 40, 255, 50)
		
	if Globale.awm_shoot == true:
		Globale.smg_shoot == false
		$Sprite.modulate = Color(255, 235, 0, 50)
	if Globale.health<=0:
		$Sprite.hide()
		$CPUParticles2D.emitting = true
		
		yield(get_tree().create_timer(1),"timeout")
		get_tree().reload_current_scene()
		return
	move()
	shoot_smg()
	shoot_AWM()
	

	pass

func move():
	motion = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		motion.x +=speed
	if Input.is_action_pressed("ui_left"):
		motion.x -=speed
	if Input.is_action_pressed("ui_up"):
		motion.y -=speed
	if Input.is_action_pressed("ui_down"):
		motion.y +=speed
	motion=motion.normalized()
	motion = move_and_slide(motion*speed)
	look_at(get_global_mouse_position())
	pass

func shoot_smg():
	if Globale.smg_shoot ==false :
		
		return
	if !$timers/shoot/fast.is_stopped():
		return
	if Input.is_action_pressed("click"):
		$timers/shoot/fast.start()
		var bullet = preload("res://player/bullet.tscn").instance()
		bullet.player = self
		bullet.global_position = global_position
		bullet.rotation_degrees = rotation_degrees
		bullet.apply_impulse(Vector2(),Vector2(Globale.bullet_speed,0).rotated(rotation))
		get_tree().get_root().call_deferred("add_child",bullet)
	pass

func shoot_AWM():
	if Globale.awm_shoot ==false :
		return
	if !$timers/shoot/slow.is_stopped():
		return
	if Input.is_action_pressed("click"):
		$timers/shoot/slow.start()
		var bullet = preload("res://player/AWM-bullet.tscn").instance()
		bullet.player = self
		bullet.global_position = global_position
		bullet.rotation_degrees = rotation_degrees
		bullet.apply_impulse(Vector2(),Vector2(Globale.bullet_speed,0).rotated(rotation))
		get_tree().get_root().call_deferred("add_child",bullet)
	pass

