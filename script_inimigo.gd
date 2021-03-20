extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
var velocidade = -3
func _process(delta):
	translate(Vector2(0, velocidade))

func explodir():
	velocidade = 0
	ScriptGlobal.qtd_pontos += ScriptGlobal.valor_ponto_inimigo
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("explodindo")

func excluir_definitivamente(anim_name):
	queue_free()

func colisao_com_corpo(body):
	ScriptGlobal.qtd_vidas -= 1;
	if (ScriptGlobal.qtd_vidas == 0):
		get_tree().change_scene("res://cena_derrota.tscn")
	explodir()


	
	
