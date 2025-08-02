extends CanvasLayer

@export var progress_bar : ProgressBar

@export var target_progress : float = 0.0
@export var smoothing_factor : float = 5.0

func _ready():
	progress_bar.value = 0.0
	target_progress = 0.0
	ResourceLoader.load_threaded_request(Global.next_scene_path)
	set_process(true)

func _process(delta):
	progress_bar.value = lerp(progress_bar.value, target_progress, delta * smoothing_factor)
	var progress = []
	var status = ResourceLoader.load_threaded_get_status(Global.next_scene_path, progress)

	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			target_progress = progress[0] * 100

		ResourceLoader.THREAD_LOAD_LOADED:
			set_process(false)
			
			target_progress = 100
			
			var tween : Tween = create_tween()
			tween.tween_property(progress_bar, "value", 100.0, 1.5)
			
			await tween.finished
			
			var new_scene = ResourceLoader.load_threaded_get(Global.next_scene_path)
			get_tree().change_scene_to_packed(new_scene)

		ResourceLoader.THREAD_LOAD_FAILED:
			print("Load Failed")
			get_tree().change_scene_to_file("res://Scenes/MainMenu/loading_screen.tscn")
