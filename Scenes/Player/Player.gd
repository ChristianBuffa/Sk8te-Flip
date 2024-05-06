extends VehicleBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TORQUE_ANGLE = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("SwerveLeft", "SwerveRight", "Accelerate", "Decelerate")

	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		steering = input_dir.x * TORQUE_ANGLE;
		linear_velocity.z = direction.z * SPEED
	else:
		linear_velocity.z = move_toward(linear_velocity.z, 0, SPEED)
