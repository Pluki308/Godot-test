extends Node3D

@export var closed = true
@export var animation_player: AnimationPlayer


func interact():
	
	closed = !closed
	if closed == true:
		animation_player.play("open")
	else:
		animation_player.play_backwards("open")
		
	
