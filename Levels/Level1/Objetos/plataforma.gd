extends RigidBody2D

class_name plat

@onready var sprite = $AnimatedSprite2D
@onready var animation_pl = $AnimationPlayer
@onready var timer_volta = $Timer
@onready var reset = global_position
@onready var collision = $CollisionShape2D

func ready():
	if(hidden):
		pass

func _process(delta: float) -> void:
	collision.position = sprite.position
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is player):
		animation_pl.play("AntesCair")
		
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "AntesCair"):
		gravity_scale = 1
		timer_volta.start(1.7)
		
func _on_timer_timeout() -> void:
	gravity_scale = 0
	linear_velocity = Vector2(0,0)
	global_position = reset
	
func collisionOFF():
	$CollisionShape2D.set_deferred("disabled", true)
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	sleeping = true
	

func collisionON():
	$CollisionShape2D.set_deferred("disabled", false)
	$Area2D/CollisionShape2D.set_deferred("disabled", false)
	sleeping = false

	
