extends State
class_name IdleState

@onready var state_machine : Node = get_parent()

func enter() -> void:
	player.spaceship_sprite.play("idle")
	player.booster_sprite.play("idle")

func physics_update(_delta: float) -> State:
	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	player.move(Vector2.ZERO)
	
	if Input.is_action_pressed("shoot"):
		player.shoot()
	
	if input_dir != Vector2.ZERO:
		return state_machine.get_node("move")
	
	return null
