extends RigidBody2D

signal press

@onready var madeira = $"../Madeira"

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if(body is player):
		madeira.gravity_scale = 1
		$Sprite2D.animation = "Apertado"
