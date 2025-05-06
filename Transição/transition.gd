extends CanvasLayer

signal acabou

var tela_inicio = true;

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(tela_inicio):
		tela_inicio = false;
		acabou.emit()
		play2();
		return;
	
	self.hide();
	
func play1_time(speed:float):
	tela_inicio = true;
	$ColorRect.material.set_shader_parameter("Type",0)
	self.show();
	$AnimationPlayer.speed_scale = speed;
	$AnimationPlayer.play("levels")

func play1():
	tela_inicio = true;
	self.show();
	$AnimationPlayer.play("telas")
	
func play2():
	$AnimationPlayer.speed_scale = 1;
	$AnimationPlayer.play("telas_out")
