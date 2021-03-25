extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if (ScriptGlobal.nivel_dificuldade=="Fácil"):
		$Tempo_inimigo.wait_time = 10
	elif (ScriptGlobal.nivel_dificuldade=="Médio"):
		$Tempo_inimigo.wait_time = 5
	elif (ScriptGlobal.nivel_dificuldade=="Difícil"):
		$Tempo_inimigo.wait_time = 0.5
		
	$Tempo_inimigo.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func criar_inimigo():
	var cena_inimigo = preload("res://cena_inimigo.tscn")
	var objeto_inimigo = cena_inimigo.instance()
	objeto_inimigo.global_position.x = rand_range(10, 1000)
	objeto_inimigo.global_position.y = -80
	get_tree().root.add_child(objeto_inimigo)
