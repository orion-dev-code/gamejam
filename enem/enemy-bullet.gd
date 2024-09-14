extends RigidBody2D

var enemy =null 
var del = false


func _physics_process(delta):
	if Globale.health<=0:
		queue_free()
	pass

func _on_Area2D_body_entered(body):
	if body !=enemy && body!=self:
		queue_free()
	if body.is_in_group("player"):
		Globale.health -= rand_range(20,40)
	pass # Replace with function body.



