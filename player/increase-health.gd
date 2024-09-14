extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Globale.health<= 0:
		queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_increasehealth_body_entered(body):
	if body.is_in_group("player"):
		Globale.health += 20
		queue_free()
	pass # Replace with function body.
