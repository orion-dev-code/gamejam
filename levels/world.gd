extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"pause-menu".hide()
	Globale.timer = 0
	$TNT.start()
	$enembullet.start()
	$Timer.start()
	Globale.health = 100
	Globale.awm_shoot = false
	Globale.smg_shoot = false
	Globale.enemdie = 0
	Globale.tntdie = 0
	$Timer2.start()
	pass # Replace with function body.

func _physics_process(delta):
	if Globale.pause_menu==true:
		Engine.time_scale = 0
		$"pause-menu".show()
	if Globale.pause_menu == false:
		$"pause-menu".hide()
		Engine.time_scale = 1
	$Label.text =str(Globale.timer)
	$enemdie/Label.text = str(Globale.enemdie)
	$enemdie/Label2.text = str(Globale.tntdie)
	
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var incheal = preload("res://player/increase-health.tscn").instance()
	incheal.global_position = Vector2(rand_range(270,780),rand_range(63,191))
	get_parent().add_child(incheal)
	pass # Replace with function body.


func _on_Timer2_timeout():
	Globale.timer +=1
	pass # Replace with function body.


func _on_enembullet_timeout():
	var enem = preload("res://enem/enemy.tscn").instance()
	enem.global_position = $Position2D.global_position
	get_parent().add_child(enem)
	
	pass # Replace with function body.


func _on_TNT_timeout():
	var enem1 = preload("res://enem/tnt.tscn").instance()
	enem1.global_position = $Position2D8.global_position
	get_parent().add_child(enem1)
	pass # Replace with function body.


func _on_Button_pressed():
	Globale.pause_menu = true
	pass # Replace with function body.
