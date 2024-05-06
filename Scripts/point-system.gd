extends Node

@export var player: RigidBody3D
@export var max_arial_points: int = 100

var points_to_add: int = 0

var total_points: int = 0


func _on_skate_flipped():
	points_to_add += 50
	total_points += points_to_add
	points_to_add = 0
	print(total_points)


func _on_skate_made_air_points(points):
	total_points += points
	print(total_points)
