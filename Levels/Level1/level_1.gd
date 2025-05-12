extends Node2D

@export var fimPuzzle1 = false;
@onready var elevador = $Objetos/Elevador/Ele2
@export var pisou = false;
@onready var terreno = $Objetos/terreno/TileMapLayer;
var terminouLevel = false

func _ready() -> void:
	$Objetos/Plataformas/Puzzle/Plataforma.collisionOFF();
	$Objetos/Plataformas/Puzzle/Plataforma2.collisionOFF();
	$Objetos/terreno/TileMapLayer.collision_enabled = false	
	elevador = $Objetos/Elevador/Ele2

#---------------------------------------------FALLZONE-------------------------------------------#

func _on_fallzone_1_body_entered(body: Node2D) -> void:
	if(body is player):
		$Players/Morte.start(0.5)

func _on_morte_timeout() -> void:
	Global.frutas = 0;
	get_tree().reload_current_scene()
	$Players/Morte.stop()

			
#---------------------------------------------Checkpoint-------------------------------------------#

func _on_check_1_body_entered(body: Node2D) -> void:
	if(body is player):
		checkPlayers($Checkpoints/Check1);

func checkPlayers(checkpoint: Area2D):
	var gap = Vector2(20,20);
	for pl in $Players.get_children():
		if(pl is player):
			pl.pos_initial = checkpoint.global_position+gap
#--------------------------------------------- Puzzle 1 -------------------------------------------#


func _on_plataforma_press() -> void:
	if(fimPuzzle1):
		return;
		
	$Objetos/Plataformas/Puzzle/Plataforma.show();
	$Objetos/Plataformas/Puzzle/Plataforma.collisionON();

func _on_plataforma_not_press() -> void:
	if(fimPuzzle1):
		return;
	
	$Objetos/Plataformas/Puzzle/Plataforma.hide();
	$Objetos/Plataformas/Puzzle/Plataforma.collisionOFF();
	
func _on_plataforma_2_press() -> void:
	if(fimPuzzle1):
		return;
		
	$Objetos/Plataformas/Puzzle/Plataforma2.show();
	$Objetos/Plataformas/Puzzle/Plataforma2.collisionON();
	
func _on_plataforma_2_not_press() -> void:
	if(fimPuzzle1):
		return;
	$Objetos/Plataformas/Puzzle/Plataforma2.hide();
	$Objetos/Plataformas/Puzzle/Plataforma2.collisionOFF();

func _on_fim_press() -> void:
	fimPuzzle1 = true
	
	$Objetos/Plataformas/Puzzle/Plataforma.show();
	$Objetos/Plataformas/Puzzle/Plataforma.collisionON();
	
	$Objetos/Plataformas/Puzzle/Plataforma2.show();
	$Objetos/Plataformas/Puzzle/Plataforma2.collisionON();

#--------------------------------------------- Puzzle 2 -------------------------------------------#

var pilhaButoes := [];

func _on_esq_press() -> void:
	if(pilhaButoes.is_empty()):
		pilhaButoes.append("esq");
		elevador.esq();
	
func _on_esq_not_press() -> void:
	if(pilhaButoes.is_empty()):
		return;
		
	if(pilhaButoes.front() == "esq"):
		pilhaButoes.pop_front();
		elevador.isMove = false;

func _on_dir_press() -> void:
	if(pilhaButoes.is_empty()):
		pilhaButoes.append("dir");
		elevador.dir();
	
func _on_dir_not_press() -> void:
	if(pilhaButoes.is_empty()):
		return;
		
	if(pilhaButoes.front() == "dir"):
		pilhaButoes.pop_front();
		elevador.isMove = false;

func _on_cima_press() -> void:
	if(pilhaButoes.is_empty()):
		pilhaButoes.append("cima");
		elevador.subir();
		
func _on_cima_not_press() -> void:
	if(pilhaButoes.is_empty()):
		return;
	
	if(pilhaButoes.front() == "cima"):
		pilhaButoes.pop_front();
		elevador.isMove = false;
	
func _on_baixo_press() -> void:
	
	if(pilhaButoes.is_empty()):
		pilhaButoes.append("baixo");
		elevador.descer()
	
func _on_baixo_not_press() -> void:
	if(pilhaButoes.is_empty()):
		return;
		
	if(pilhaButoes.front() == "baixo"):
		pilhaButoes.pop_front();
		elevador.isMove = false;
	
func _on_plantas_puzzle_morreram_todos() -> void:
	terreno.collision_enabled = true
	terreno.show();

#---------------------------------------------BOSS-------------------------------------------#

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Players/Woman.global_position = Vector2(3171, 590);
	$Players/Man.global_position = Vector2(3035, 588);
	$Camera2D.global_position = Vector2(3155, 500);
	$Camera2D.velocidade = 0;
	$"Boss/Collisão/Trigger".queue_free();

func _on_boss_morreu() -> void:
	$Camera2D.velocidade = 0.1
	$Boss/Objetos/Ports/StaticBody2D/AnimationPlayer.play("ativo")
	$Boss/Objetos/Ports/StaticBody2D2/AnimationPlayer.play("ativo")
