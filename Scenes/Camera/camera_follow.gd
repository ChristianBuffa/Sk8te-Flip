extends Node3D

var direction = Vector3.FORWARD
@export_range (1,10,0.1) var smooth_speed: float = 4

@onready var skate = $".."
@onready var skeleton_3d = $"../Character_Ragdoll/RootNode/character_skate_boy/Skeleton3D"

var is_following_ragdoll: bool = false

func _process(delta):
	if is_following_ragdoll:
		look_at(skeleton_3d.global_position, Vector3.UP)
	else:
		var current_velocity = get_parent().get_linear_velocity()
		current_velocity.y = 0 
		
		if current_velocity.length_squared() > 0.01:
			direction = lerp(direction, -current_velocity.normalized(), smooth_speed * delta)
		else:
			direction = lerp(direction, -skate.global_transform.basis.z, smooth_speed * delta)
			
		global_transform.basis = get_rotation_from_direction(direction)

func get_rotation_from_direction(look_direction: Vector3) -> Basis:
	look_direction = look_direction.normalized()
	var x_axis = look_direction.cross(Vector3.UP)
	return Basis(x_axis, Vector3.UP, -look_direction)


func _on_area_3d_is_dead():
	skate.remove_child(self)
	skeleton_3d.add_child(self)
	is_following_ragdoll = true
