extends Node2D

@export var enemies : Array[PackedScene]
@export var enemies_container : Node2D
@export var spawn_timer : Timer

func _ready() -> void:
	spawn_timer.start()

func spawn_enemy() -> void:
	var enemy_instance = enemies.pick_random().instantiate()
	var viewport_rect = get_viewport().get_visible_rect()
	var spawn_x_pos = randf_range(viewport_rect.position.x, viewport_rect.position.x + viewport_rect.size.x)
	var spawn_y_pos = viewport_rect.position.y - 50
	var spawn_position = Vector2(spawn_x_pos, spawn_y_pos)
	
	enemy_instance.global_position = spawn_position
	
	enemies_container.add_child(enemy_instance)

func _on_spawn_timer_timeout() -> void:
	spawn_enemy()
	spawn_timer.start()
