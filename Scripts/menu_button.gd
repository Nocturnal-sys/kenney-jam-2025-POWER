extends MarginContainer

signal pressed()


func _ready() -> void:
	pass


func _on_button_pressed() -> void:
	pressed.emit()
