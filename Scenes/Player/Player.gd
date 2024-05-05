extends VehicleBody3D

@export var acceleration : float
@export var maxSpeed : float
@export var minSpeed : float

func _physics_process(delta):
	var movement = Input.get_axis("Decelerate", "Accelerate")
	engine_force += movement * acceleration 
	engine_force = clampf(engine_force, minSpeed, maxSpeed)
	print(engine_force)

	steering =  Input.get_axis("SwerveRight", "SwerveLeft")
