extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Dude" || "Pink":
		print("collided with " + body.name)
		get_tree().reload_current_scene()
