extends CharacterBody2D

var facing_left = true
var health = 5
var player_in_range = false

@onready var bullet_scene = preload("res://Enemies/seed.tscn")
@onready var spawn_shoot = $spawnShoot
@onready var anim = $anim

func _physics_process(delta: float) -> void:
	var players = get_tree().get_nodes_in_group("players")
	var closest_player = null
	var min_distance = INF

	for p in players:
		var dist = global_position.distance_to(p.global_position)
		
		if dist < min_distance:
			min_distance = dist
			closest_player = p

	if closest_player:
		var x_distance = closest_player.global_position.x - global_position.x
		facing_left = x_distance >= 0

	scale.x = -1 if facing_left else 1

func shoot():
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = spawn_shoot.global_position
	
	if facing_left:
		bullet.direction = -1
	else:
		bullet.direction = 1


func _on_player_detector_body_entered(body: Node2D) -> void:
	player_in_range = true
	$anim.play("attack")

func _on_player_detector_body_exited(body: Node2D) -> void:
	player_in_range = false

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack":
		if player_in_range:
			$anim.play("attack")
		else:
			$anim.play("idle")
	
	elif anim_name == "hit":
		if player_in_range:
			$anim.play("attack")
		else:
			$anim.play("idle")


func _on_hurtbox_body_entered(body: Node2D) -> void:
	var player_velocity = body.velocity
	
	if player_velocity.y > 0 and body.global_position.y < global_position.y:
		health -= 1
		
		if health <= 0:
			queue_free()
		else:
			$anim.play("hit")
