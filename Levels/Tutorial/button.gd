extends RigidBody2D

class_name button

signal press
signal notPress

@export var colisoes = []
@export var pressed = false;


func _process(delta: float) -> void:
	if(pressed):
		press.emit();
		return;
		
	notPress.emit();
	
func _on_area_2d_body_entered(body: Node2D) -> void:
		if(body is player or body is caixa):
			colisoes.push_back(body);
			pressed = true;
			$Sprite2D.animation = "Apertado";
			
func _on_area_2d_body_exited(body: Node2D) -> void:
	colisoes.erase(body)
	if(colisoes.size() == 0):
		notPress.emit();
		pressed = false;
		$Sprite2D.animation = "Parado";
