extends Node2D

signal morreramTodos

func _process(delta: float) -> void:
	if($".".get_children().size() == 0):
		morreramTodos.emit();
