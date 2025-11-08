extends HBoxContainer

func _ready():
	$jogar.text = tr("Jogar")
	$opcoes.text = tr("Opcoes")
	$sair.text = tr("Sair")
	$"../LinkButton".text = tr("Traducoes")
	$"../LinkButton2".text = tr("Reportar bugs")
