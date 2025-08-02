extends Node2D

@export var enemies : Array[PackedScene]
@export var enemies_container : Node2D
@export var projectiles_container : Node2D
@export var spawn_timer : Timer
@export var player_info : CanvasLayer
@export var times : Array[float]

@onready var parent : Node2D = get_parent()

func spawn_enemy() -> void:
	var enemy_instance = enemies.pick_random().instantiate()
	var viewport_rect = get_viewport().get_visible_rect()
	var spawn_x_pos = randf_range(viewport_rect.position.x + 50, viewport_rect.position.x + viewport_rect.size.x - 50)
	var spawn_y_pos = viewport_rect.position.y - 50
	var spawn_position = Vector2(spawn_x_pos, spawn_y_pos)
	
	enemy_instance.global_position = spawn_position
	enemy_instance.projectiles_container = projectiles_container
	enemy_instance.connect("enemy_damaged", _on_enemy_damaged)
	enemy_instance.connect("enemy_died", _on_enemy_died)
	
	enemies_container.add_child(enemy_instance)

func _on_spawn_timer_timeout() -> void:
	spawn_enemy()
	spawn_timer.wait_time = times.pick_random()

func _on_enemy_damaged() -> void:
	parent._on_enemy_damaged()

func _on_enemy_died() -> void:
	player_info.update_score()
