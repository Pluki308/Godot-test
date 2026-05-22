extends Node3D

@export_file var next_scene

func _ready():
	$Area3D.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D):
	#print("hit: ", body.name, " | scene: ", next_scene)
	if body.is_in_group("player"):
		if next_scene:
			get_tree().call_deferred("change_scene_to_file", next_scene)
		else:
			push_warning("next_scene is not set!")
