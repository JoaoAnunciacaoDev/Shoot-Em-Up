extends Area2D

@export var speed : float
@export var damage : int
@export var direction : Vector2
@export var sprite : AnimatedSprite2D
@export var sprite_frames : SpriteFrames

func _ready() -> void:
	sprite.sprite_frames = sprite_frames
	sprite.play("idle")

func _physics_process(delta: float) -> void:
	translate(direction * speed * delta)
	if global_position.y > 480:
		queue_free()

func _on_screen_exited() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	area.take_damage(damage)
	queue_free()

func take_damage(_damage) -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage)
