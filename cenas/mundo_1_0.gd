extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$HUD/control/container/coins_container/coins_label.text = tr("Moedas")
	$HUD/control/container/score_container/score_label.text = tr("Pontos")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
