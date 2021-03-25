extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if(ScriptGlobal.status_sons):
		$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
var mov = Vector2(0,-10)
func _process(delta):
	translate(mov)
	

func colisao(area):
	if(area.name=="Inimigo"):
		area.explodir()
		$CollisionShape2D.set_deferred("disabled", true)
		visible = false
		
	


func _on_AudioStreamPlayer_finished():
	if (not visible):
		queue_free()
