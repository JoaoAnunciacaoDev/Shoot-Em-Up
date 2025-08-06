extends EnemyBase
class_name FloatingEnemy

@export var frequency : float
@export var amplitude : float

var time_passed : float = 0
var initial_pos_x : float

func _ready() -> void:
	initial_pos_x = global_position.x

func _physics_process(delta: float) -> void:
	if is_dead: return
	
	time_passed += delta
	translate(direction * speed * delta)
	global_position.x = initial_pos_x + sin(time_passed * frequency) * amplitude

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage)

func _on_screen_exited() -> void:
	queue_free()

func _on_sprite_animation_finished() -> void:
	queue_free()
