extends Node

signal loading_screen_ready
@export var AP : AnimationPlayer

func _ready() -> void:
	print("Reach here1")
	AP.play("fade_in")
	await AP.animation_finished
	remove_transition()

func remove_transition() -> void:
	print("Reach here2")
	AP.play_backwards("fade_in")
	await AP.animation_finished
	queue_free()
