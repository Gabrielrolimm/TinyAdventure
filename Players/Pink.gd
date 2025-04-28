extends player

func _physics_process(delta) -> void:
	move(delta, "p2_jump","p2_left","p2_right");
