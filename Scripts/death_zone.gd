extends Node2D


signal die(body : Node2D)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		print("ouch")
		die.emit(body)
