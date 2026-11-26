extends Node

signal scene_finished
signal process_change

var scene_name : String
var packed_scene : PackedScene
var transition_manager : PackedScene
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
		
	set_up_with_transition	
	set_process(true)
	
func _process(delta: float) -> void:
	ResourceLoader.load_threaded_request()
	
	
