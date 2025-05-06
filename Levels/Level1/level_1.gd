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

func _on_esq_press() -> void:
	elevador.esq();
	
func _on_esq_not_press() -> void:
	elevador.isMove = false;

func _on_dir_press() -> void:
	elevador.dir();
	
func _on_dir_not_press() -> void:
	elevador.isMove = false;

func _on_cima_press() -> void:
	elevador.subir();
	
func _on_cima_not_press() -> void:
	elevador.isMove = false;
	
func _on_baixo_press() -> void:
	elevador.descer()
	
func _on_baixo_not_press() -> void:
	elevador.isMove = false;
	
func _on_plantas_puzzle_morreram_todos() -> void:
	terreno.collision_enabled = true
	terreno.show();

#---------------------------------------------BOSS-------------------------------------------#

func _on_area_2d_body_entered(body: Node2D) -> void:
	if($"Boss/Collisão/Area2D".global_position.x > $Players/Man.global_position.x and $"Boss/Collisão/Area2D".global_position.x > $Players/Woman.global_position.x):
		$Players/Man.global_position = $"Boss/Collisão/Area2D".global_position+Vector2(30,0);
		$Players/Woman.global_position = $"Boss/Collisão/Area2D".global_position+Vector2(40,0);
	
	body.global_position = $"Boss/Collisão/Area2D".global_position+Vector2(20,0);
