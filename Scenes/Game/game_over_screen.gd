extends CanvasLayer

@export var loading_scene : PackedScene

@export var bg : ColorRect
@export var vbox : VBoxContainer
@export var player_info : CanvasLayer
@export var score_label : Label

var tween : Tween

func start_game_over_sequence() -> void:
	score_label.text = "Score: " + str(player_info.get_score())
	
	show()
	
	tween = create_tween().set_parallel()
	tween.tween_property(Engine, "time_scale", 0.2, 2.5).set_ease(Tween.EASE_IN)
	tween.tween_property(bg, "color:a", 0.6, 1.5)
	
	var ui_tween = create_tween()
	ui_tween.tween_interval(0.5)
	ui_tween.tween_property(vbox, "modulate:a", 1.0, 2.0)

func _on_try_again_btn_pressed() -> void:
	if tween:
		tween.kill()
		
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

func _on_main_menu_btn_pressed() -> void:
	if tween:
		tween.kill()
	
	Engine.time_scale = 1.0
	Global.next_scene_path = "res://Scenes/MainMenu/main_menu.tscn"
	var loading_instance = loading_scene.instantiate()
	hide()
	add_child(loading_instance)
