extends RigidBody3D

@export var acceleration : float
@export var maxSpeed : float
@export var minSpeed : float

func _physics_process(delta):
	var movement = Input.get_axis("Decelerate", "Accelerate")
	
