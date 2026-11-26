extends Button

var trans : PackedScene = preload("res://scenes/transition.tscn")

func _ready() -> void:
	pressed.connect(on_button_pressed)


func _process(delta: float) -> void:
	pass

func on_button_pressed() -> void:
	var inst = trans.instantiate()
	add_child(inst)
	await inst.AP.animation_finished
	get_tree().quit()
