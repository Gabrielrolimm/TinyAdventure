extends CharacterBody2D

class_name Boss

signal morreu

var direction = -1
var SPEED = 120
var isMove;
var isCair;
var vida = 10;

func _ready() -> void:
	set_physics_process(false)
	isMove = false;
	isCair = false;
	
func _process(delta: float) -> void:
	if not is_on_floor() and isCair:
		velocity += get_gravity() * delta
	
	if(vida <= 0):
		SPEED = 0;
		$AnimationPlayer.play("die")
		return;
	
	if(not isMove):
		return;
	
	if(direction == 1):
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	
	
	if($push.is_colliding()):
		$AnimationPlayer.play("idle")
	elif(vida >= 5):
		$AnimationPlayer.play("run")
	elif(vida < 5):
		$AnimationPlayer.play("run2")
		SPEED = 150
	
	velocity.x = direction * SPEED
	move_and_slide();

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "idle"):
		$Sprite2D.flip_h != $Sprite2D.flip_h
		$push.scale.x *=-1
		direction*=-1
		$AnimationPlayer.play("run")
	if(anim_name == "hit"):
		isMove = true;
		vida -= 1;
	if(anim_name == "die"):
		morreu.emit();
		queue_free()
	
func _on_static_body_2d_fechar_portas() -> void:
	set_physics_process(true)
	isCair = true;
	$Andar.start(1.5)
	
func _on_andar_timeout() -> void:
	isMove = true;
	$Andar.stop();

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.velocity.y = body.JUMP_VELOCITY*2
	isMove = false;
	velocity.x = 0;
	$AnimationPlayer.play("hit")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
