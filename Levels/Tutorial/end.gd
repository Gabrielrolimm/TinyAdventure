extends Area2D

var local: String = "res://Levels/Level1/Level1.tscn";

func _on_body_entered(body: Node2D) -> void:
	if(body is player):
		$confetti.emitting = true
		Transition.acabou.connect(self.transition_acabou, CONNECT_DEFERRED)
		Transition.play1_time(0.5);

func transition_acabou() -> void:
	assert(get_tree().change_scene_to_file(local) == OK);
