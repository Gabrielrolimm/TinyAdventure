extends CharacterBody2D

@onready var pos_initial = global_position;
@export var isSubir = false;
@export var isMove = false;

func _process(delta: float) -> void:
	if(not isMove):
		return;
		
	if(isSubir):
		subir()
		return;
		
	descer()
	
func descer():
	linear_velocity.y = 50
	
func subir():
	if(int(global_position.y) <= int(pos_initial.y)):
		isMove = false;
		linear_velocity.y = 0
		return;
		
	linear_velocity.y = -50
