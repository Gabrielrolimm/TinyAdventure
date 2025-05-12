extends Area2D

var local: String = "res://Levels/Level1/Objetos/FimLevel1.tscn";

func _on_body_entered(body: Node2D) -> void:
	if(body is player):
		Global.pos_check = Vector2(22, 587)
		$confetti.emitting = true
		Transition.acabou.connect(self.transition_acabou, CONNECT_DEFERRED)
		Transition.play1_time(0.5,"telas");
		

func transition_acabou() -> void:
	assert(get_tree().change_scene_to_file(local) == OK);
