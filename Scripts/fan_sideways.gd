extends StaticBody2D


@onready var fan: StaticBody2D = $"."
@onready var ray: Area2D = $RayCast2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var bodies : Array[Node2D]
var body : Node
var distance : float
var strength : float

func _physics_process(_delta: float) -> void:
	if ray.has_overlapping_bodies():
		bodies = ray.get_overlapping_bodies()
		for node in bodies:
			if node is Player:
				body = node
				distance = global_transform.origin.distance_to(body.global_position)
				strength = 10000 * 1/(distance * distance)
				body.velocity.x += strength

func toggle_process() -> void:
	ray.toggle_process()


func toggle_animation() -> void:
	if animated_sprite.is_playing():
		animated_sprite.pause()
	else:
		animated_sprite.play("spinning")

func is_spinning() -> bool:
	if animated_sprite.is_playing():
		return true
	else:
		return false
