extends EnemyBase

@export var projectile : PackedScene
@export var sprite_frames : SpriteFrames
@export var cooldown_timer : Timer
@export var spawn_point : Marker2D
@onready var player : CharacterBody2D = null

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func _process(_delta: float) -> void:
	if not is_instance_valid(player): return
	
	look_at(player.global_position)

func _physics_process(delta: float) -> void:
	translate(direction * speed * delta)

func shoot() -> void:
	if not is_instance_valid(player):
		cooldown_timer.stop()
		return
	
	var projectile_instance = projectile.instantiate()
	projectile_instance.global_position = spawn_point.global_position
	
	var direction_to_player : Vector2 = global_position.direction_to(player.global_position)
	projectile_instance.direction = direction_to_player
	projectiles_container.add_child(projectile_instance)

func _on_cooldown_timeout() -> void:
	shoot()
	cooldown_timer.start()

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage)

func _on_screen_exited() -> void:
	queue_free()

func _on_sprite_animation_finished() -> void:
	queue_free()
