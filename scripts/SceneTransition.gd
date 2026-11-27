extends Node

signal scene_finished
signal process_change

var scene_name : String
var packed_scene : PackedScene
var transition_manager : PackedScene = preload("res://scenes/transition.tscn")
var process : Array = []

func _ready() -> void:
	set_process(false)

func start_load(scenename : String) -> void:
	scene_name = scenename
	if (scene_name.is_empty() or scene_name == null):
		printerr("Err, the scene path '%s' it's an invalid path", %scene_name)
		var res = ResourceLoader.load_threaded_get_status("res://scenes/main.tscn")
		if res != OK:
			printerr("Err to change to main scene")
			return
		set_process(true)
	var res = ResourceLoader.load_threaded_get_status(scene_name)
	if res != OK:
		printerr("Err, scene_name %s not found", %scene_name)
		return

	set_process(true)
	
func _process(delta: float) -> void:
	var res_scene = ResourceLoader.load_threaded_get_status(scene_name, process)
	process_change.emit(process[0])
	match res_scene:
		ResourceLoader.THREAD_LOAD_LOADED:
			packed_scene = ResourceLoader.load_threaded_get(scene_name)
			var trans = transition_manager.
			get_tree().change_scene_to_packed(packed_scene)
		ResourceLoader.THREAD_LOAD_INVALID_RESOURCE or ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
			printerr("Error to change to another scene\n")
			set_process(false)
			return
			
	
	
	
