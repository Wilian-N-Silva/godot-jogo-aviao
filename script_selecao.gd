extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$OptionButton.add_item("Fácil")
	$OptionButton.add_item("Médio")
	$OptionButton.add_item("Difícil")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("pesquerda")):
		$AnimationPlayer.play("personagem1")
		ScriptGlobal.personagem = 1
	elif (Input.is_action_just_pressed("pdireita")):
		$AnimationPlayer.play("personagem2")
		ScriptGlobal.personagem = 2


func iniciar_jogo():
	ScriptGlobal.status_musica = $CheckBox_Musica.pressed
	ScriptGlobal.status_sons = $CheckBox_Som.pressed
	ScriptGlobal.nivel_dificuldade = $OptionButton.text
	get_tree().change_scene("res://cena_fase.tscn")
