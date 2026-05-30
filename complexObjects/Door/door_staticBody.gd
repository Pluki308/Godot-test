extends StaticBody3D

@onready var door: Node3D = $".."

func interact():
	door.interact()
