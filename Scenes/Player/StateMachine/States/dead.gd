extends State
class_name DeadState

@onready var state_machine : Node = get_parent()

func enter() -> void:
	player.collision.disabled = true
	player.move(Vector2.ZERO)
	player.anim.play("explosion")

func physics_update(_delta: float) -> State:
	
	if not player.anim.is_playing():
		player.queue_free()
	
	return null
