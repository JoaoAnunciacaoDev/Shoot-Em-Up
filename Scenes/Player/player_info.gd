extends CanvasLayer

@export var player_icon : Texture2D
@export var container_icon : HBoxContainer
@export var player : CharacterBody2D
@export var label : Label

var score : int = 0

func  _ready() -> void:
	for i in range(player.hp):
		add_hp()

func update_score() -> void:
	score += 1
	label.text = "Score: " + str(score)

func add_hp() -> void:
	var texture_rect = TextureRect.new()
	texture_rect.texture = player_icon
	texture_rect.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	texture_rect.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	container_icon.add_child(texture_rect)

func minus_hp() -> void:
	container_icon.get_child(0).queue_free()

func get_score() -> int:
	return score
