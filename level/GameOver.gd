extends Control

func _ready():
	if State.alien_wins:
		_alien_wins()
	else:
		_carrier_wins()
	
	set_process_input(true)

func _input(event):
	if not $SettleDownTimer.is_stopped():
		return
	
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	elif event.is_action_type():
		get_tree().change_scene("res://level/Welcome.tscn")

func _alien_wins():
	$VBoxContainer/Who.text = "Alien wins"
	$VBoxContainer/Descrption.text = "The baby alien gets killed while exploring the world. Well, at least he died FREE!"
	$VBoxContainer/Picture/AnimatedSprite.play("default")
	$EndMusic.stream = preload("res://music/Tema2.ogg")
	$EndMusic.play()

func _carrier_wins():
	$VBoxContainer/Who.text = "Richard wins"
	$VBoxContainer/Descrption.text = "Richard manages to keep the endangered alien alive desite its best efforts. The alien is not mature enough to know the world is very dangerous. Richard knows best."
	$VBoxContainer/Picture.texture = preload("res://actors/sprites/daddystanding_reloj4.png")
	$VBoxContainer/Picture/AnimatedSprite.hide()
	$EndMusic.stream = preload("res://music/Tema1.ogg")
	$EndMusic.play()
