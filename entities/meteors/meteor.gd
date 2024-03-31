class_name Meteor
extends Area2D

var game_scene : GameScene
var storage : Storage
var direction : Vector2 = Vector2.ZERO
var speed : float = 0
var rotation_speed : float = deg_to_rad(30)

var number_of_last = 0

var invincibility = true

func _ready():
	var random_angle = deg_to_rad(randi_range(0,360))	
	self.speed = randf_range(20,40)

	self.direction.x += (cos(random_angle) - sin(random_angle)) * self.speed
	self.direction.y += (sin(random_angle) + cos(random_angle)) * self.speed
	var sign_value = sign(randi_range(-1,1)) 
	var sign = 1 if sign_value == 0 else sign_value
	self.rotation_speed = sign * deg_to_rad(randf_range(10,30))

func _process(delta):	
	self.position += self.direction * delta
	
	var angle = -self.rotation_speed*delta
	self.rotate(angle)


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var is_bullet = area.is_in_group("bullet")
	if is_bullet && !invincibility:
		area.queue_free()
		call_deferred('spawn_small_meteors')
		queue_free()
		game_scene.storage.increment_score()

func init(game : GameScene,s : Storage):
	game_scene = game
	storage = s

func spawn_small_meteors():
	print('Must increment spawn_small_meteors')
	
func _on_timer_invincibility_timeout():
	invincibility = false
