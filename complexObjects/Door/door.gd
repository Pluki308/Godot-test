extends Node3D

@export var closed = true
@export var interactable = true
@export var animation_player: AnimationPlayer


func interact():
	if interactable:
		closed = !closed
		if closed == true:
			animation_player.play("open")
		else:
			animation_player.play_backwards("open")
			
	
