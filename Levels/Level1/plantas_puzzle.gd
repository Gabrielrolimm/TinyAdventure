extends Node2D

signal morreramTodos

var isCaracterBody = true

func _process(delta: float) -> void:
	if(not temCharacterBody2D()):
		morreramTodos.emit();

func temCharacterBody2D():
	for inimigo in $".".get_children():
		if(inimigo is CharacterBody2D):
			return true;
			
	return false;
