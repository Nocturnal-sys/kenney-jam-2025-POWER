class_name PlayerMover
extends Area2D


@export var y_force : float
@export var x_force : float


func toggle_process() -> void:
	if process_mode == Node.PROCESS_MODE_DISABLED:
		process_mode = Node.PROCESS_MODE_INHERIT
	else:
		process_mode = Node.PROCESS_MODE_DISABLED
