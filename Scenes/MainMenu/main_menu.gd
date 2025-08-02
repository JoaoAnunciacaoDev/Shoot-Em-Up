extends Control

@export var loading_scene : PackedScene

func _on_new_game_pressed() -> void:
	Global.next_scene_path = "res://Scenes/Game/game.tscn"
	var loading_instance = loading_scene.instantiate()
	add_child(loading_instance)

func _on_quit_pressed() -> void:
	get_tree().quit()
