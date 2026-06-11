extends CharacterBody3D

@export var max_move_speed := 4.0
var move_speed := max_move_speed

@export var acceleration := 200.0
@export var gravity := 9.8
@export var jump_strength := 4.0

@export var detection_range := 20.0

var player: Node3D

func _ready() -> void:
	add_to_group("enemy")
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	if player == null:
		return

	var direction := player.global_position - global_position
	var distance := direction.length()

	# Stop chasing if too far (optional)
	if distance > detection_range:
		velocity.x = move_toward(velocity.x, 0, acceleration * delta)
		velocity.z = move_toward(velocity.z, 0, acceleration * delta)
		move_and_slide()
		return

	direction = direction.normalized()

	# Horizontal movement toward player
	var target_velocity = direction * move_speed

	velocity.x = move_toward(velocity.x, target_velocity.x, acceleration * delta)
	velocity.z = move_toward(velocity.z, target_velocity.z, acceleration * delta)

	# Gravity (same as your player)
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0.0

	move_and_slide()
