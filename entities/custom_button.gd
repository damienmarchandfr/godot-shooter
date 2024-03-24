class_name CustomButton
extends Area2D

@export var text_sprite = "start"
var mouse_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if text_sprite == "exit":
		$Start.visible = false
		$Exit.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if text_sprite == "exit":
			get_tree().quit()
			return
		if text_sprite == "start":
			get_tree().change_scene_to_file("res://scenes/game.tscn")
