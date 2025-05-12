extends Area2D

@onready var anim = $anim
@onready var sprite: Sprite2D = $cherries
var textures: Array[Texture2D] = [
	preload("res://assets/Free/Items/Fruits/Cherries.png"),
	preload("res://assets/Free/Items/Fruits/Bananas.png"),
	preload("res://assets/Free/Items/Fruits/Kiwi.png"),
	preload("res://assets/Free/Items/Fruits/Melon.png")
]

func _ready() -> void:
	sprite.texture = textures.pick_random()

func _on_body_entered(body: Node2D) -> void:
	Global.frutas += 1;
	$anim.play("collected")
	
func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "collected":
		queue_free()
