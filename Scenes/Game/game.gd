extends Node2D

@export var camera : Camera2D
@export var game_over_screen : CanvasLayer

func _on_player_taken_damage() -> void:
	camera.shake(10.0)

func _on_player_died() -> void:
	camera.shake(20.0)
	game_over_screen.start_game_over_sequence()

func _on_enemy_damaged() -> void:
	camera.shake(3.0)
