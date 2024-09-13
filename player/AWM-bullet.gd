extends RigidBody2D

var player =null 
var del = false

func _ready():
	$durabi.start()
	pass



func _on_Area2D_body_entered(body):
	if body !=player && body!=self:
		queue_free()
	pass # Replace with function body.




func _on_durabi_timeout():
	queue_free()
	pass # Replace with function body.
