extends Control

@onready var button = $VBoxContainer/Start
@onready var child: Button = $VBoxContainer/Start

var index = 0;
var local: String;
var inicio = true;

func _ready() -> void:
	Transition.acabou.connect(self.transition_acabou, CONNECT_DEFERRED)

func transition():
	Transition.play1();


func _on_start_pressed() -> void:
	local = "res://Main/fases.tscn"
	transition()
	
func _on_options_pressed() -> void:
	pass
	
func _on_quit_pressed() -> void:
	get_tree().quit(1)

func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		Input.get_joy_name(event.device)
		
func transition_acabou() -> void:
	assert(get_tree().change_scene_to_file(local) == OK);
