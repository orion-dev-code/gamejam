extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_resume_pressed():
	Globale.pause_menu = false
	pass # Replace with function body.


func _on_back_pressed():
	Globale.pause_menu =false
	get_tree().change_scene("res://levels/main-menu.tscn")
	pass # Replace with function body.
