extends StaticBody2D

#@onready var air: Area2D = $FanAir
@onready var air: CollisionShape2D = $FanAir/CollisionShape2D
@onready var fan: StaticBody2D = $"."
@onready var ray: RayCast2D = $RayCast2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var body

func _physics_process(delta: float) -> void:
	if ray.is_colliding():
		body = ray.get_collider()
		if body is Player:
			body.velocity.y -= 20
			body.fly()

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
