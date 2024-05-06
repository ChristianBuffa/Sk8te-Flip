extends RigidBody3D

@export var JUMP_FORCE : float = 5
@export var IMPULSE_FORCE : float = 10
@export var SWERVE_FORCE : float = 5
@export var ROTATION_ANGLE : float = 1
@export var MAX_VELOCITY : float = 20

var is_dead = false
signal flipped

@onready var animation_player = $Character_Ragdoll/AnimationPlayer2

func _ready():
	animation_player.play("skate-stand")
	

func _process(delta):
	if(Input.is_action_just_pressed("Emote 1")):
		animation_player.play("emote-yes")

func _physics_process(delta):
	if is_dead:
		return
	
	var is_on_floor = check_is_on_floor()
	
	if(is_on_floor):
		get_grounded_input(delta)
	else:
		get_air_input(delta)

func check_is_on_floor() -> bool :
	return $RayCast3D.is_colliding()

func get_grounded_input(delta):
	if(Input.is_action_just_pressed("Accelerate")):
		var forward = global_transform.basis * Vector3.FORWARD
		var impulse = -forward * IMPULSE_FORCE
		apply_central_impulse(impulse)
		animation_player.play("skate")
		
	if Input.is_action_pressed("SwerveLeft"):
		apply_torque_impulse(Vector3(0, ROTATION_ANGLE, 0) * delta)
		
	if Input.is_action_pressed("SwerveRight"):
		apply_torque_impulse(Vector3(0, -ROTATION_ANGLE, 0) * delta)
			
	if Input.is_action_just_pressed("Flip"):
		$SkateBoard_cs/AnimationPlayer.play("flip_animation")
		apply_central_impulse(Vector3(0, JUMP_FORCE, 0))

func get_air_input(delta):
	if Input.is_action_pressed("SwerveLeft"):
			apply_torque_impulse(Vector3(0, ROTATION_ANGLE, 0) * delta)
			
	if Input.is_action_pressed("SwerveRight"):
		apply_torque_impulse(Vector3(0, -ROTATION_ANGLE, 0) * delta)
		
	if Input.is_action_just_pressed("Flip"):
		$SkateBoard_cs/AnimationPlayer.play("flip_animation")
		flipped.emit()

func _on_area_3d_is_dead():
	is_dead = true
