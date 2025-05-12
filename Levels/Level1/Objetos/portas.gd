extends StaticBody2D

signal fecharPortas

	
func _on_trigger_body_entered(body: Node2D) -> void:
	$AnimationPlayer.play("disable")
	fecharPortas.emit();
