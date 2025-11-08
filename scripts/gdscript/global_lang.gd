#   ---------- obsoleto ----------
extends Node

const SAVE_PATH := "user://lang.cfg"

func _ready():
	#carrega o idioma salvo (se existir)
	if FileAccess.file_exists(SAVE_PATH):
		var f = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var lang = f.get_line()
		f.close()
		TranslationServer.set_locale(lang)
	else:
			#idioma padrão
			TranslationServer.set_locale("pt_BR")

func set_language(lang: String):
	TranslationServer.set_locale(lang)
	var f = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	f.store_line(lang)
	f.close()
