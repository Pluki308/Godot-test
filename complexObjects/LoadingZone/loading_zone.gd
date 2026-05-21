extends Node3D

@export var next_scene: PackedScene

func _ready():
	$Area3D.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D):
	print("hit: ", body.name, " | scene: ", next_scene)
	if body.name == "Player":
		if next_scene:
			get_tree().change_scene_to_packed(next_scene)
		else:
			push_warning("next_scene is not set!")
