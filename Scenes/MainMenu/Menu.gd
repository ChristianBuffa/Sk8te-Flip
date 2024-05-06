class_name MainMenu
extends Control


@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Button as Button
@onready var start_game = preload("res://Scenes/environment.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	
func on_start_pressed() -> void:
		get_tree().change_scene_to_packed(start_game)
