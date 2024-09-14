extends KinematicBody2D

var motion = Vector2()
var bullet_speed = 2000
onready var ray_cast_2d = $RayCast2D
var can_shoo = true
var health = 30
func _ready():
	$Sprite.show()
	health = 30
	pass

func _physics_process(delta):
	if Globale.health<=0:
		queue_free()
	if health <= 0:
		
		$Sprite.hide()
		$CPUParticles2D.emitting =true
		yield(get_tree().create_timer(1),"timeout")
		queue_free()
		Globale.enemdie += 1
		
	if health <= 0:
		return
	

	
	position += (Globale.pla_pos - position)/50
	
	look_at(Globale.pla_pos)
	move_and_collide(motion)
	


	if ray_cast_2d.is_colliding() and can_shoo:
		var collider = ray_cast_2d.get_collider()
		if collider.is_in_group("wall") or collider.is_in_group("bull"):
			return
		else:
			shoo()

	else:
		shoo()

	
	pass


func shoo():
	if can_shoo:
		
		
		var bullet = preload("res://enem/enemy-bullet.tscn").instance()
		bullet.enemy = self
		bullet.global_position = global_position
		bullet.rotation_degrees = Globale.ro
		bullet.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().call_deferred("add_child",bullet)
		can_shoo = false
		$Timer.start()
		yield($Timer,"timeout")
		can_shoo = true
	pass





func _on_Area2D_body_entered(body):
	if body.is_in_group("smgbull"):
		health -= 10
	if body.is_in_group("awmbull"):
		health -= 30
	pass # Replace with function body.
