extends CanvasLayer

@onready var quantidade: Label = $Control/MarginContainer/frutas/quantidade
@onready var tempo: Label = $Control/MarginContainer/Timer/Tempo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quantidade.text = str("%04d" % Global.frutas)
	tempo.text = str("%02d" % Global.minutos) + ":" + str("%02d" % Global.segundos)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	quantidade.text = str("%04d" % Global.frutas)
	tempo.text = str("%02d" % Global.minutos) + ":" + str("%02d" % Global.segundos)

func _on_timer_timeout() -> void:
	if(Global.segundos >= 59):
		if(Global.minutos >= 59):
			Global.minutos = 0;
			Global.segundos = 0;
			return;
				
		Global.minutos+=1;
		Global.segundos = 0;
		return;
	
	Global.segundos+=1;
