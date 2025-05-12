extends Area2D

var direction = 1
var velocity = Vector2.ZERO
var shoot_speed = -100

func _physics_process(delta: float) -> void:
	velocity.x = shoot_speed * delta * direction
	
	translate(velocity)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Dude" || "Pink":
		Global.frutas = 0
		get_tree().reload_current_scene()
