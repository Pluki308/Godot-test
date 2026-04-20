extends CharacterBody3D

@export_group("Camera")
@export_range(0.0,1.0) var mouse_sensitivity :=0.25

@export_group("Movement")
@export var max_move_speed:= 4.0
var move_speed:=max_move_speed
@export var crouching=false
@export var sprinting=false
@export var jump_strength= 4.0
@export var acceleration:= 200.0
@export var gravity := 9.8
@export var camera_x_limit := PI / 2.0 - 0.01
var jump:=false

@onready var _camera: Camera3D = %Camera3D

var _camera_input_direction:=Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("ui_escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event.is_action_pressed("crouch"):
		if crouching:
			move_speed=max_move_speed
			crouching=false
			sprinting=false
		elif not crouching:
			move_speed=max_move_speed/2
			crouching=true
			sprinting=false
	if event.is_action_pressed("sprint"):
		if sprinting:
			move_speed=max_move_speed
			sprinting=false
			crouching=false
		elif not sprinting:
			move_speed=max_move_speed*2
			sprinting=true
			crouching=false

		

func _unhandled_input(event: InputEvent) -> void:
	var is_camera_motion:=(event is InputEventMouseMotion and Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED)
	if is_camera_motion:
		_camera_input_direction = event.screen_relative*mouse_sensitivity

func _physics_process(delta: float) -> void:
	_camera.rotation.x-=_camera_input_direction.y*delta
	_camera.rotation.x = clamp(_camera.rotation.x, -camera_x_limit, camera_x_limit)
	_camera.rotation.y-=_camera_input_direction.x*delta
	_camera_input_direction=Vector2.ZERO

	var raw_input := Input.get_vector("left","right", "forwards", "backwards")
	var forward := Vector3(_camera.global_basis.z.x, 0, _camera.global_basis.z.z).normalized()
	var right   := Vector3(_camera.global_basis.x.x, 0, _camera.global_basis.x.z).normalized()
	
	
	var move_direction := forward * raw_input.y + right * raw_input.x
	
	move_direction=move_direction.normalized()
	
	if not is_on_floor():
		velocity.y-=gravity*delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y=jump_strength

		else:
			velocity.y=0.0
	
	velocity.x = move_toward(velocity.x, move_direction.x * move_speed, acceleration * delta)
	velocity.z = move_toward(velocity.z, move_direction.z * move_speed, acceleration * delta)

	move_and_slide()
	
	
	
	
	
