extends CharacterBody2D

var direction := 1
const SPEED = 40.0

@onready var wall_detector := $wall_detector as RayCast2D
@onready var texture := $texture as Sprite2D

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.target_position.x *= -1

	texture.flip_h = direction == 1 # mesmo que -> if == 1 flip_h true else flip_h false
	velocity.x = direction * SPEED

	move_and_slide()
