extends Control

@onready var button = $VBoxContainer/Start
@onready var child: Button = $VBoxContainer/Start

var index = 0;
var local: String;
var inicio = true;

func _ready() -> void:
	$RichTextLabel4.text = str("%02dx" % Global.frutas)
	$RichTextLabel5.text = str("%02d" % Global.minutos) + ":" + str("%02d" % Global.segundos)
	Transition.acabou.connect(self.transition_acabou, CONNECT_DEFERRED)
	$VBoxContainer/Start.grab_focus()
	
func transition():
	Global.reset();
	Transition.play1();
	
func _on_start_pressed() -> void:
	local = "res://Levels/Level1/Level1.tscn"
	transition()
	
func _on_options_pressed() -> void:
	local = "res://Main/fases.tscn"
	transition()
	
func transition_acabou() -> void:
	assert(get_tree().change_scene_to_file(local) == OK);
