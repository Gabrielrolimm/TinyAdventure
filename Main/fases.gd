extends Control

var levels = [preload("res://Levels/Level1/Level1.tscn"),preload("res://Levels/Level1/Level1.tscn"),preload("res://Levels/Level1/Level1.tscn")]
var buttonsLiberados = [true];
var local: String;
var inicio = true;

func _ready() -> void:
	Transition.acabou.connect(self.transition_acabou, CONNECT_DEFERRED)
	$VBoxContainer/Level1.grab_focus()
	leveisTerminados();
	botoesSelecionados()
	
func transition():
	Transition.play1();

func leveisTerminados():
	for i in range(0,$VBoxContainer.get_children().size()-1):
		var insta = levels[i].instantiate()
		buttonsLiberados.push_back(insta.terminouLevel)

func botoesSelecionados():
	var tam = 0
	for i in $VBoxContainer.get_children():
		if(not buttonsLiberados[tam]):
			i.disabled = true
			tam+=1
			continue;
		
		tam+=1

func _on_voltar_pressed() -> void:
	local = "res://Main/telaInicial.tscn"
	transition();

func _on_level_1_pressed() -> void:
	local = "res://Levels/Tutorial/tutorial.tscn"
	transition();
	
func transition_acabou() -> void:
	assert(get_tree().change_scene_to_file(local) == OK);
