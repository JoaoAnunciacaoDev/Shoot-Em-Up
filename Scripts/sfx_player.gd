extends Node

@export var sounds : Dictionary[String, AudioStream]

func play_sfx(sfx_name) -> void:
	var asp = AudioStreamPlayer.new()
	
	asp.stream = sounds[sfx_name]
	asp.bus = "sfx"
	add_child(asp)
	asp.play()
	await asp.finished
	asp.queue_free()
