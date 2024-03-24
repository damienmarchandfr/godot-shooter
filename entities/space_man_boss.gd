class_name SpaceManBoss
extends Node2D

@export
var player : Player

var fire = false
var health = 50

var flash_time = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player:
		fire = true

func _on_area_2d_body_exited(body):
	if body is Player:
		fire = false


func _on_area_2d_collision_area_entered(area):
	if area is Bullet:
		health = health -1
		self.flash()

func _on_area_2d_collision_body_entered(body):
	if body is Player:
		body.back()

func flash():
	$TimerFlash.start()
	$Helmet.visible = false
	return

func _on_timer_flash_timeout():
	if flash_time > 0:
		flash_time = flash_time - 1
		$Helmet.visible = !$Helmet.visible
	else:
		flash_time = 10
		$TimerFlash.stop()
		$Helmet.visible = true
