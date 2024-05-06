extends SpringArm3D

@export var follow_target: Node3D
@onready var spring_arm_3d = $"."

func _ready():
	pass 


func _process(delta):
	spring_arm_3d.position = follow_target.position
	spring_arm_3d.rotation.y = follow_target.rotation.y
