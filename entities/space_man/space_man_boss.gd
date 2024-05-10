class_name SpaceManBoss
extends Node2D


var player : Player = null

var health = 50

var flash_time = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player:
		print('fire !')

# ----------------------- COLLISIONS -----------

func _on_hit_collision_area_entered(area):
	if area is Bullet:
		$RollingEyesTimer.start()
		$RollingEyes.roll()
		$TimerFlash.start()
		$Helmet.visible = false

func _on_kill_zone_body_entered(body):
	if body is Player:
		player = body

func _on_kill_zone_body_exited(body):
	if body is Player:
		player = null

# ------------------- TIMERS END ------------------

func _on_rolling_eyes_timer_timeout():
	$RollingEyes.stop_roll()

func _on_timer_flash_timeout():
	if flash_time > 0:
		flash_time = flash_time - 1
		$Helmet.visible = !$Helmet.visible
	else:
		flash_time = 10
		$TimerFlash.stop()
		$Helmet.visible = true


# -------------- BULLETS ------------------










