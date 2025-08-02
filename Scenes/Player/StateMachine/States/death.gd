extends State
class_name DeathState

@onready var state_machine : Node = get_parent()

func enter() -> void:
	player.zero_velocity()
	player.collision.set_deferred("disabled", true)
	
	player.spaceship_sprite.play("explosion")
	player.booster_sprite.hide()
	
	SfxPlayer.play_sfx("explosion")

func physics_update(_delta: float) -> State:
	
	if not player.spaceship_sprite.is_playing():
		player.queue_free()
	
	return null
