extends Area3D

@export var time_to_scene_reset = 3.0

@onready var skeleton_3d = $"../RootNode/character_skate_boy/Skeleton3D"
@onready var character = $".."
@onready var timer = $"../Timer"


func _ready():
	print("process false")
	skeleton_3d.set_process(false)


func _process(delta):
	pass


func _on_body_entered(body):
	print("body entered")
	
	if(body.get_parent_node_3d() != null):
		if(body.get_parent_node_3d().is_in_group("Obstacle")):
			print("suca")
			timer.start(time_to_scene_reset)
			character.top_level = true
			skeleton_3d.set_process(true)
			skeleton_3d.physical_bones_start_simulation()


func _on_timer_timeout():
	get_tree().reload_current_scene()
