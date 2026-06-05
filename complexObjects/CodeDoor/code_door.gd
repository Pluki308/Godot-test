extends Node3D

var closed = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var letter1: Label3D = %letter1
@onready var letter2: Label3D = %letter2
@onready var letter3: Label3D = %letter3
@onready var letter4: Label3D = %letter4
@export var code:="0000"




func interact():
	if code==str(letter1.text,letter2.text,letter3.text,letter4.text):
		closed = !closed
		if closed == true:
			animation_player.play("open")
		else:
			animation_player.play_backwards("open")
	else:
		print("display code: ", letter1.text,letter2.text,letter3.text,letter4.text, " | real code: ", code)
