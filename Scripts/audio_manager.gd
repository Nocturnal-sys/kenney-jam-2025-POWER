extends Node2D
@onready var jump: AudioStreamPlayer2D = $SFX/Jump
@onready var lever: AudioStreamPlayer2D = $SFX/Lever

func play_jump():
	jump.play()


func play_lever():
	lever.play()
