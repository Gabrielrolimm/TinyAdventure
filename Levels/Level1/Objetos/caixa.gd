extends CharacterBody2D

class_name caixa

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	#1519, 603
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
	velocity.x = move_toward(velocity.x, 0, SPEED)


func _on_area_2d_area_entered(area: Area2D) -> void:
	global_position = Vector2(1519, 605);
