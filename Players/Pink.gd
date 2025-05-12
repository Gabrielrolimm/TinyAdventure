extends player

func _ready() -> void:
	self.global_position = Global.pos_check+Vector2(40,0)
	pass

func _physics_process(delta) -> void:
	move(delta, "p2_jump","p2_left","p2_right");
