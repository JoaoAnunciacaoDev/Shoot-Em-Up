extends CanvasLayer

@export var player_icon : Texture2D
@export var container_icon : HBoxContainer
@export var player : CharacterBody2D

func  _ready() -> void:
	for i in range(player.hp):
		var texture_rect = TextureRect.new()
		texture_rect.texture=player_icon
		container_icon.add_child(texture_rect)

func update_score() -> void:
	pass
