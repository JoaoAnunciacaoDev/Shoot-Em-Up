extends State
class_name MoveState

@onready var state_machine : Node = get_parent()

func handle_input(event : InputEvent) -> State:
	if event.is_action_pressed("shoot"):
		player.shoot()
	return null

func physics_update(_delta: float) -> State:
	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	player.move(input_dir)
	player.flip_sprite(input_dir)
	
	if Input.is_action_pressed("shoot"):
		player.shoot()
	
	if input_dir.x != 0:
		player.spaceship_sprite.play("move")
		player.booster_sprite.play("idle")
	
	if input_dir == Vector2.ZERO:
		return state_machine.get_node("idle")
	
	return null

func exit() -> void:
	player.move(Vector2.ZERO)
