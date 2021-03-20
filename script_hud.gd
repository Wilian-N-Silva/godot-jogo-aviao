extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Tempo_jogo.wait_time = ScriptGlobal.tempo_jogo
	$Tempo_jogo.start()

func atualizar_hud():
	$Vidas.text = "x" + str(ScriptGlobal.qtd_vidas)
	$Tempo.text = str(int($Tempo_jogo.time_left))
	$Moedas.text = str(ScriptGlobal.qtd_pontos)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	atualizar_hud()

func ir_para_vitoria():
	get_tree().change_scene("res://cena_vitoria.tscn")
