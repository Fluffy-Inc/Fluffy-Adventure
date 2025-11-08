#obsoleto
extends CanvasLayer

var label: Label
var visible_state: bool = false

func _ready():
	# Cria o label dinamicamente
	label = Label.new()
	label.name = "FPSLabel"
	label.text = ""
	label.visible = false
	label.position = Vector2(40, 40)
	label.add_theme_color_override("font_color", Color(1, 1, 0)) # Amarelo
	label.add_theme_font_size_override("font_size", 16)
	add_child(label)
	
	set_process(true)

func _process(_delta):
	if label.visible:
		label.text = "FPS: %d" % Engine.get_frames_per_second()

func _input(event):
	if event.is_action_pressed("toggle_fps"):
		visible_state = !visible_state
		label.visible = visible_state
