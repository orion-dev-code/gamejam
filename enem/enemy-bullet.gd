extends RigidBody2D

var enemy =null 
var del = false




func _on_Area2D_body_entered(body):
	if body !=enemy && body!=self:
		queue_free()
	pass # Replace with function body.



