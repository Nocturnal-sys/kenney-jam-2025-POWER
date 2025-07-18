extends Area2D

@onready var path: PathFollow2D = $Path2D/PathFollow2D

func _process(delta: float) -> void:
	path.progress_ratio += 1 * delta
