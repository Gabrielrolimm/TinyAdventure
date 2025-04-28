extends Control

@onready var button = $VBoxContainer/Button
var index = 0;
@onready var child: Button = $VBoxContainer/Button
func _ready():
	button.grab_focus()

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("cont_A")):
		child.emit_signal("pressed")

	var direction := Input.get_axis("cont_down","cont_up")
	if(direction < 0):
		child = $VBoxContainer.get_child(1)
		child.grab_focus()
	if(direction > 0):
		child = $VBoxContainer.get_child(0)
		child.grab_focus()


func _on_button_pressed() -> void:
	print("Deu bom...")
	
func _on_button_2_pressed() -> void:
	print("Deu bom2...")
	
func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		Input.get_joy_name(event.device)
