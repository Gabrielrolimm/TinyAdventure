extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if(event.is_action_pressed("ui_cancel")):
		visible = !visible;
		get_tree().paused = !get_tree().paused;
		$HBoxContainer/Resume.grab_focus()
	
func _on_resume_pressed() -> void:
	get_tree().paused = false;
	visible = false;

func _on_menu_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit();
