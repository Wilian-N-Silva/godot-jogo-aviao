extends KinematicBody2D

func ajustar_posicao():
	
	var largura = ($Personagem1.texture.get_size().x * $Personagem1.scale.x) / 2
	var altura = ($Personagem1.texture.get_size().y * $Personagem1.scale.y) /2
	
	if (global_position.x < largura - 30):
		global_position.x = largura - 30
	if (global_position.x > get_viewport().size.x-largura + 30):
		global_position.x = get_viewport().size.x-largura + 30
		
	if (global_position.y < 60):
		global_position.y = 60
	if (global_position.y > get_viewport().size.y-60):
		global_position.y = get_viewport().size.y-60

# Called when the node enters the scene tree for the first time.
func _ready():
	$Personagem1.visible = false
	$Personagem2.visible = false
	if (ScriptGlobal.personagem==1):
		$Personagem1.visible = true
	elif (ScriptGlobal.personagem==2):
		$Personagem2.visible = true

var mov = Vector2(0,0)
var velocidade = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	ajustar_posicao()
	
	mov.y = 0
	mov.x = 0
	
	if (Input.is_action_just_pressed("tiro")):
		var cena_tiro = preload("res://cena_tiro.tscn")
		var objeto_tiro = cena_tiro.instance()
		objeto_tiro.global_position = $Position2D.global_position
		get_tree().root.add_child(objeto_tiro)

	if (Input.is_action_pressed("pcima")):
		mov.y = -velocidade
	elif (Input.is_action_pressed("pbaixo")):
		mov.y = velocidade
		
	if (Input.is_action_pressed("pesquerda")):
		mov.x = -velocidade
	elif (Input.is_action_pressed("pdireita")):
		mov.x = velocidade
	
	move_and_slide(mov)
