extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
var velocidade = -2
func _process(delta):
	translate(Vector2(0, velocidade))

func explodir():
	velocidade = 0
	$CollisionShape2D.queue_free()
	$AnimationPlayer.play("explodindo")

func excluir_definitivamente(anim_name):
	queue_free()
