extends CharacterBody2D

signal died

@export_category("Projectile")
@export var projectile : PackedScene
@export var projectile_spawn_pos : Marker2D
@export var cooldown_timer : Timer
@export var projectiles_container : Node2D

@export_category("Movement Stats")
@export var acceleration : float
@export var max_speed : float
@export var friction : float

@export_category("Animation")
@export var spaceship_sprite : AnimatedSprite2D
@export var booster_sprite : AnimatedSprite2D
@export var animation_player : AnimationPlayer

@export_category("Others")
@export var collision : CollisionShape2D
@export var state_machine : Node

@export var hp :  int
var can_shoot : bool = true
var is_dead : bool = false

func _unhandled_input(event: InputEvent) -> void:
	state_machine._on_input(event)

func _physics_process(_delta: float) -> void:
	if is_dead: return

	move_and_slide()

func move(input_dir : Vector2) -> void:
	var target_velocity = input_dir * max_speed
	
	if input_dir != Vector2.ZERO:
		velocity = lerp(velocity, target_velocity, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)

func player_can_shoot() -> bool:
	return can_shoot

func shoot() -> void:
	if not can_shoot: return
	can_shoot = false
	
	var projectile_instance = projectile.instantiate()
	projectile_instance.global_position = projectile_spawn_pos.global_position
	projectiles_container.add_child(projectile_instance)
	
	animation_player.play("shoot")
	cooldown_timer.start()

func flip_sprite(input_dir : Vector2) -> void:
	if input_dir.x != 0:
		spaceship_sprite.flip_h = input_dir.x > 0
		booster_sprite.flip_h = input_dir.x > 0

func take_damage(damage_taken) -> void:
	hp -= damage_taken
	if hp <= 0:
		emit_signal("died")

func _on_died() -> void:
	state_machine.transition_to(state_machine.get_node("death"))

func _on_cooldown_timeout() -> void:
	can_shoot = true
