extends Camera2D

@onready var p1: CharacterBody2D = get_tree().get_nodes_in_group("man")[0]
@onready var p2: CharacterBody2D = get_tree().get_nodes_in_group("woman")[0]
@export var velocidade = 0.1	
@export var margin = 50
@export var min_zoom = 2.4
@export var max_zoom = 2.5

func _ready() -> void:
	pass 
	
func _process(delta: float) -> void:
	var meio = (p1.global_position+p2.global_position)/2.0
	global_position = lerp(global_position, meio, velocidade)
	global_position.y = 500
	var diferenca = p1.global_position.distance_to(p2.global_position)
	var modelar = clamp(0.5+ (diferenca - margin) / 400.0, min_zoom, max_zoom)
	if(modelar > 2.0):
		global_position += Vector2(0,0)
		
	zoom = lerp(zoom, Vector2(modelar, modelar), 0.05)
