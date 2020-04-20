extends Node2D

export var telekinesis_strength = 5

var selected_objects = []
var _throwing_object = null

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_released("alien_grab_object") and _throwing_object:
		var throwing_vector = get_global_mouse_position() - _throwing_object.get_global_position()
		_throwing_object.impulse(telekinesis_strength*throwing_vector)
		_throwing_object = null
		$Telegrab.stop()
		$Telethrow.play()
		$TelekinesisCooldown.start()

func grab_object(throwable):
	if $TelekinesisCooldown.is_stopped():
		_throwing_object = throwable
		$Telegrab.play()
