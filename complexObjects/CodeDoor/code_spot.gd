extends StaticBody3D

@export var label: Label3D

func interact():
	if int(label.text) < 9:
		label.text = str(int(label.text) + 1)
	else:
		label.text = "0"
