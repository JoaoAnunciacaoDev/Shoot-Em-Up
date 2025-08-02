extends ParallaxBackground

@export var scroll_speed = 100.0
@export var parallax_layer : ParallaxLayer
@export var bg : Sprite2D

# Uso para Modo Expand
#func _ready() -> void:
	#get_tree().get_root().connect("size_changed", _on_window_size_changed)

func _process(delta: float) -> void:
	parallax_layer.motion_offset.y += scroll_speed * delta

#func _on_window_size_changed() -> void:
	#var viewport_size = get_viewport().get_visible_rect().size
	#bg.region_rect.size = viewport_size
