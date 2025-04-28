extends CharacterBody2D

class_name player

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
var isMove = true
var dead = false;

@onready var animation :AnimatedSprite2D = $AnimatedSprite2D;

func move(delta: float,jump: String,left: String,right: String):
	if(!isMove):
		return;
		
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed(jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis(left, right)
	if direction:
		velocity.x = direction * SPEED
		sprite("run", direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite("idle", 0)
		
	
	move_and_slide()

func sprite(nome: String, direction: float):
	animation.animation = nome
	animation.play()
	
	if(direction < 0):
		animation.flip_h = true;
		return;
	
	if(direction > 0):
		animation.flip_h = false;
