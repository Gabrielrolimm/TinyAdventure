extends Node

var frutas = 0;
var pos_check: Vector2 = Vector2(22, 587);

var minutos = 0;
var segundos = 0;

func _ready() -> void:
	pass

func reset():
	frutas = 0;
	pos_check = Vector2(22, 587);
	minutos = 0;
	segundos = 0;
