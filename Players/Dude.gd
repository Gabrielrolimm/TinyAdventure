extends player

func _ready() -> void:
	self.global_position = Global.pos_check
	pass
		
func _physics_process(delta) -> void:
	move(delta, "p1_jump","p1_left","p1_right");
