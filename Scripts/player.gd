extends CharacterBody2D
class_name Player

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray: RayCast2D = $AnimatedSprite2D/RayCast2D
@onready var mover: Area2D = $MoverDetector

var overlapping_areas : Array[Node2D]
var mover_forces : Vector2 = Vector2(0,0)
var distance_to_mover : float = 0
var is_force_applied : bool = false
var lingering_force : float = 0


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

signal advance_level()

func _physics_process(delta: float) -> void:
	
	
	_play_animations()
	
	if mover.has_overlapping_areas():
		for area in mover.get_overlapping_areas():
			if area is PlayerMover:
				mover_forces = Vector2(area.x_force, area.y_force)
				distance_to_mover = global_transform.origin.distance_to(area.global_position)
				mover_forces = 200 * (1/distance_to_mover) * mover_forces
				is_force_applied = true
	else:
		mover_forces = Vector2.ZERO
		is_force_applied = false
	
	# Add the gravity.
	if not is_on_floor():
		velocity += mover_forces + (get_gravity() * delta)


	# Handle jump.
	#if Input.is_action_just_pressed("Jump") and is_on_floor() and is_force_applied:
		#velocity.y = JUMP_VELOCITY + mover_forces.y
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY + mover_forces.y
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED + mover_forces.x + lingering_force
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED) + mover_forces.x + lingering_force
	
	move_and_slide()


func _play_animations() -> void:
	if is_on_floor():
		if velocity.x < 0:
			animated_sprite.flip_h = true
		else: 
			animated_sprite.flip_h = false
		if velocity.x:
			animated_sprite.play("walk")
		else:
			animated_sprite.play("idle")


func fly() -> void:
	animated_sprite.play("fall")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		if ray.is_colliding() and ray.get_collider() is Door:
			advance_level.emit()
