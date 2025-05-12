extends CanvasLayer

signal acabou

var tela_inicio = true;
var anim : String;

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(tela_inicio):
		tela_inicio = false;
		acabou.emit()
		play2();
		return;
	
	self.hide();
	
func play1_time(speed: float ,anim_name: String):
	tela_inicio = true;
	self.show();
	$AnimationPlayer.speed_scale = speed;
	anim = anim_name;
	$AnimationPlayer.play(anim_name)

func play1():
	tela_inicio = true;
	self.show();
	anim = "telas";
	$AnimationPlayer.play("telas")
	
func play2():
	$AnimationPlayer.speed_scale = 1;
	$AnimationPlayer.play(anim+"_out")
