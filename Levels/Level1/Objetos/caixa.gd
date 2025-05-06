extends CharacterBody2D

class_name caixa

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
	velocity.x = move_toward(velocity.x, 0, SPEED)
