extends Level

@export var paths: Array[PathFollow2D]


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	for path in paths:
		path.progress_ratio += 0.6 * delta
