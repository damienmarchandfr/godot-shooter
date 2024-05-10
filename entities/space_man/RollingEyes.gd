class_name RollingEyes
extends Node2D

var eyes_rotate = false
var rotation_speed_left = deg_to_rad(-0.15)
var rotation_speed_right = deg_to_rad(-0.11)

func _process(delta):
	if eyes_rotate:
		$LeftEye.rotate(rotation_speed_left)
		$RightEye.rotate(rotation_speed_right)

func roll():
	eyes_rotate = true
	
func stop_roll():
	eyes_rotate = false
	$LeftEye.rotation = 0
	$RightEye.rotation = 0
	
