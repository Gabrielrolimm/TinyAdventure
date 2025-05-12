extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if(body is player):
		Global.pos_check = self.position;
		$Sprite2D.play("animation")
