extends Area2D

var coins := 1
@onready var coin_sfx: AudioStreamPlayer2D = $coin_sfx as AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	$anim.play("collect")
	#evita a colisão dupla de moedas
	coin_sfx.play()
	await $collision.call_deferred("queue_free")
	Globals.coins += coins
	print(Globals.coins)

func _on_anim_animation_finished() -> void:
	queue_free()
