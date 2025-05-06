extends Node2D

@onready var madeira = $Objects/Madeira
@export var pos_segura = Vector2(590,400)
@export var pos_initial = Vector2(590,400)

func _on_button_press() -> void:
	madeira.gravity_scale = 1
	
func _on_fallzone_body_entered(body: Node2D) -> void:
	if(body is player):
		body.velocity = Vector2(0,0)
		body.global_position = pos_segura


func _on_fallzone_2_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
