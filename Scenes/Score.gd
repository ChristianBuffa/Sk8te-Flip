extends Control

var score = 0
@onready var scoreLabel = $Score

func _ready():
	reset_score()

func reset_score():
	score = 0
	update_score_ui()

func _on_point_system_update_score_ui(new_score):
	score = new_score
	update_score_ui()

func update_score_ui():
	scoreLabel.text = "Score: %d" % score
