extends RigidBody2D

var player =null 
var del = false

func _ready():
	$durabil.start()
	$Sprite.show()
	Globale.bullet_speed = 2000
	pass



func _on_Area2D_body_entered(body):
	if body !=player && body!=self && !body.is_in_group("shadow"):

		queue_free()
	pass # Replace with function body.


func _on_durabil_timeout():
	queue_free()
	pass # Replace with function body.
