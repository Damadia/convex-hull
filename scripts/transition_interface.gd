extends Node

signal loading_screen_ready
@export var AP : AnimationPlayer

func _ready() -> void:
	AP.autoplay
	print("Reach here1")
	AP.play("fade_out")
	await AP.animation_finished
	emit_signal("loading_screen_ready")

func fade_in() -> void:
	print("Reach here2")
	AP.play_backwards("fade_out")
	await AP.animation_finished
	emit_signal("loading_screen_ready")
	queue_free()
