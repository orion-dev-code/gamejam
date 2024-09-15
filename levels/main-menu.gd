extends Control

var enemdie = 0
var tntdie = 0
var time = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("enter1")
	pass # Replace with function body.

func _physics_process(delta):
	
	if Globale.enemdie >= enemdie:
		enemdie = Globale.enemdie
	if Globale.tntdie >= tntdie:
		tntdie = Globale.enemdie
	if Globale.timer >= time:
		time = Globale.timer
	$high/Label.text = str(enemdie)
	$high/Label2.text = str(tntdie)
	$high/Label3.text = str(time)
	pass

func _on_play_pressed():
	$AnimationPlayer.play("transition")
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().change_scene("res://levels/world.tscn")
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
