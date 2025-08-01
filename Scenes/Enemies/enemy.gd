extends Area2D

signal enemy_died

@export var hp : int 
@export var speed : float
@export var frequency : float
@export var amplitude : float
@export var damage : int
@export var direction : Vector2

@export var sprite : AnimatedSprite2D

var is_dead : bool = false

var time_passed : float = 0
var initial_pos_x : float

func _ready() -> void:
	initial_pos_x = global_position.x

func _physics_process(delta: float) -> void:
	if is_dead: return
	
	time_passed += delta
	translate(direction * speed * delta)
	global_position.x = initial_pos_x + sin(time_passed * frequency) * amplitude

func take_damage(damage_taken) -> void:
	hp -= damage_taken
	if hp <= 0:
		emit_signal("enemy_died")

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage)

func _on_enemy_died() -> void:
	sprite.play("explosion")
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	is_dead = true

func _on_screen_exited() -> void:
	queue_free()

func _on_sprite_animation_finished() -> void:
	queue_free()
