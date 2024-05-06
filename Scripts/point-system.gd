extends Node

@export var player: RigidBody3D
@export var max_arial_points: int = 100

var points_to_add: int = 0

var total_points: int = 0
signal update_scoreUi(score)

func _on_skate_flipped():
	points_to_add += 5
	total_points += points_to_add
	points_to_add = 0
	emit_signal("update_scoreUi" , total_points)


func _on_skate_made_air_points(points):
	total_points += points
	emit_signal("update_scoreUi" , total_points)
