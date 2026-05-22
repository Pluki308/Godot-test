extends RayCast3D

@onready var crosshair = %crosshair

func _ready():
	add_exception(get_owner())
	var mat = crosshair.get_active_material(0).duplicate()
	crosshair.set_surface_override_material(0, mat)

func _process(_delta: float) -> void:
	
	if is_colliding():
		var hitObj = get_collider()
		#print(hitObj.name)
		if hitObj.has_method("interact"):
			crosshair.get_surface_override_material(0).albedo_color = Color.GREEN
			if Input.is_action_just_pressed("left_click"): #door heeft func interact
				hitObj.interact()
		else:
			crosshair.get_surface_override_material(0).albedo_color = Color.RED
	else:
		crosshair.get_surface_override_material(0).albedo_color = Color.RED
			
