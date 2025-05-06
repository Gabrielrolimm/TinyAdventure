extends CharacterBody2D

@onready var initial_position = global_position;
@export var isMove = false;
@export var isSubir = false;
@export var directional = false;

enum direcoes { 
	CIMA,BAIXO,ESQUERDA,DIREITA
}

var direcao = null

func _physics_process(delta: float) -> void:
	if(not isMove):
		return;
	
	if(directional):
		move(direcao)
		move_and_slide()
		return;
	
	if is_on_floor():
		velocity = Vector2(0,0);
	
	
	if(isSubir):
		if(int(global_position.y) <= int(initial_position.y)):
			isMove = false;
			return;
		velocity =  Vector2(0,1) * -50;
		move_and_slide()
		return;

	velocity =  Vector2(0,1) * 50;
	
	move_and_slide()
	
	
		
func move(valor: int):
	match valor:
		direcoes.CIMA:	
			velocity =  Vector2(0,1) * -50;
		direcoes.BAIXO:
			velocity =  Vector2(0,1) * 50;
		direcoes.ESQUERDA:
			velocity =  Vector2(1,0) * -50;
		direcoes.DIREITA:
			velocity =  Vector2(1,0) * 50;
			
func descer():
	directional = true;
	isMove = true;
	direcao = direcoes.BAIXO
	
func esq():
	directional = true;
	isMove = true;
	direcao = direcoes.ESQUERDA
	
func dir():
	directional = true;
	isMove = true;
	direcao = direcoes.DIREITA

func subir():
	directional = true;
	isMove = true;
	direcao = direcoes.CIMA
