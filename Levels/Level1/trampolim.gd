extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if(body is player):
		body.velocity.y = body.JUMP_VELOCITY*2
		$AnimatedSprite2D.play("pulou")
