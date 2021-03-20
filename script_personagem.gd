extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var mov = Vector2(0,0)
var velocidade = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
