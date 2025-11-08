extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -558.0

var can_jump := true
@onready var animation := $anim as AnimatedSprite2D
@onready var remote_transform := $remote as RemoteTransform2D
@onready var jump_sfx: AudioStreamPlayer2D = $jump_sfx as AudioStreamPlayer2D


func _physics_process(delta: float) -> void:
	# Aplica gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Movimento lateral
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		animation.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Pulo: só se estiver no chão e puder pular
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and can_jump:
		can_jump = false
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()

	move_and_slide()

	# Controle de animação
	if not is_on_floor():
		if velocity.y < 0:
			animation.play("jump")   # subindo
		else:
			animation.play("falling")   # caindo
	else:
		can_jump = true                # libera o pulo
		if abs(direction) > 0:
			animation.play("run")
		else:
			animation.play("idle")

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		get_tree().change_scene_to_file("res://cenas/gameover.tscn")
