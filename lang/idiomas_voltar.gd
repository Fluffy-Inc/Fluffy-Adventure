extends Control

func _on_ptbr_pressed():
	Idiomas.set_language("pt_BR")

func _on_en_pressed():
	Idiomas.set_language("en")


func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://cenas/opcoes.tscn")


func _on_ptpt_pressed():
	Idiomas.set_language("pt")


func _on_es_pressed():
	Idiomas.set_language("es")

func _on_fr_pressed():
	Idiomas.set_language("fr")
