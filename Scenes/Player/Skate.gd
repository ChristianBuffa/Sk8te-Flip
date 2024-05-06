extends RigidBody3D

const JUMP_FORCE = 5
const IMPULSE_FORCE = 10
const SWERVE_FORCE = 5
const ROTATION_ANGLE = 1
@onready var animation_player = $Character_Ragdoll/AnimationPlayer

func _ready():
	animation_player.play("idle")
	

func _process(delta):
	if(Input.is_action_just_pressed("Emote 1")):
		animation_player.play("emote-yes")

func _physics_process(delta):
	var is_on_floor = check_is_on_floor()
	
	if(is_on_floor):
		if(Input.is_action_just_pressed("Accelerate")):
			var forward = global_transform.basis * Vector3.FORWARD
			var impulse = -forward * IMPULSE_FORCE
			apply_central_impulse(impulse)
			
		if Input.is_action_pressed("SwerveLeft"):
			apply_torque_impulse(Vector3(0, ROTATION_ANGLE, 0) * delta)
			
		if Input.is_action_pressed("SwerveRight"):
			apply_torque_impulse(Vector3(0, -ROTATION_ANGLE, 0) * delta)
			
		if Input.is_action_just_pressed("Flip"):
			$SkateBoard_cs/AnimationPlayer.play("flip_animation")
			apply_central_impulse(Vector3(0, JUMP_FORCE, 0))

func check_is_on_floor() -> bool :
	return $RayCast3D.is_colliding()
