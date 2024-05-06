extends Control

var score = 0
@onready var scoreLabel = $Score


func _ready():
	pass
	
func _process(delta):
	pass
		


func _on_point_system_update_score_ui(score):
	pass # Replace with function body.
	scoreLabel.text = "Score %d" %score
