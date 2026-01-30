extends Node2D

@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var idle : Sprite2D
@export var move : Sprite2D
@export var jump : Sprite2D
@export var fall : Sprite2D

func _process(_delta):
	if player_controller.direction == 1:
		idle.flip_h = false
		move.flip_h = false
		jump.flip_h = false
		fall.flip_h = false
	elif player_controller.direction == -1:
		idle.flip_h = true
		fall.flip_h = true
		jump.flip_h = true
		move.flip_h = true
	if abs(player_controller.velocity.x) > 0.0:
		move.show()
		fall.hide()
		jump.hide()
		idle.hide()
		animation_player.play("move")
	else:
		move.hide()
		fall.hide()
		jump.hide()
		idle.show()
		animation_player.play("idle")
		
	if player_controller.velocity.y < 0.0:
		move.hide()
		fall.hide()
		jump.show()
		idle.hide()
		animation_player.play("jump")
	elif player_controller.velocity.y > 0.0:
		move.hide()
		fall.show()
		jump.hide()
		idle.hide()
		animation_player.play("fall")
