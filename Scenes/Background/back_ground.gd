extends ParallaxBackground

@export var scroll_speed = 100.0

func _process(delta: float) -> void:
	scroll_offset.y += scroll_speed * delta
