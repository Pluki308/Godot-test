extends Node3D

var closed = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func interact():
	
	closed = !closed
	if closed == true:
		animation_player.play("open")
	else:
		animation_player.play_backwards("open")
		
	
