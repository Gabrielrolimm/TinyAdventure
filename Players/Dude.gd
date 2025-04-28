extends player

func _physics_process(delta) -> void:
	move(delta, "p1_jump","p1_left","p1_right");
