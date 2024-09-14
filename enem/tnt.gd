extends KinematicBody2D

var motion = Vector2()
var explosion = false
var health = 30

func _ready():
	$Area2D/CollisionShape2D.disabled = false
	$Area2D3/CollisionShape2D.disabled = false
	health = 30
	pass

func _physics_process(delta):
	if Globale.health<=0:
		queue_free()
	if health<=0:
		
		$AnimationPlayer.play("explosion")
		explosion = true
		$Timer.start()
		health = 30
		
		pass
	if explosion == true:
		return
	position += (Globale.pla_pos - position)/50
	
	look_at(Globale.pla_pos)
	move_and_collide(motion)
	pass




func _on_Timer_timeout():
	queue_free()
	Globale.tntdie +=1
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("explosion")
		explosion = true
		$Timer.start()
	pass # Replace with function body.


func _on_Area2D3_body_entered(body):
	if body.is_in_group("smgbull"):
		health -= 10
	if body.is_in_group("awmbull"):
		health -= 30
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	if body.is_in_group("player"):
		Globale.health -= 50
	pass # Replace with function body.
