extends KinematicBody2D

var motion = Vector2()
var explosion = false
var health = 30

func _ready():
	$Area2D/CollisionShape2D.disabled = false
	$Area2D3/CollisionShape2D.disabled = false
	pass

func _physics_process(delta):
	if health<=0:
		$AnimationPlayer.play("explosion")
		explosion = true
	if explosion == true:
		return
	var player = get_parent().get_node("player")

	position +=(player.position - position)/50
	
	look_at(player.position)
	move_and_collide(motion)
	pass




func _on_Timer_timeout():
	queue_free()
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
