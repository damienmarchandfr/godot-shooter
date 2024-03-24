class_name MeteorSpawn
extends Node2D

var big_meteor_scene_1 = preload("res://entities/meteors/inherited/meteor_big.tscn")
var medium_meteor_scene_1 = preload("res://entities/meteors/inherited/meteor_medium.tscn")
var small_meteor_scene_1 = preload("res://entities/meteors/inherited/meteor_small.tscn")

const PLAYER_DISTANCE = 1000

@export
var player : Player

@export
var game_scene : Node2D

@export
var auto_spawn = true

func _ready():
	if !self.player or !self.game_scene:
		printerr('Missing player and/or game scene in spawner')

func _process(delta):
	pass
	
func _on_timer_meteor_timeout():
	if !auto_spawn:
		return
		
	var sizes = ["medium","big"]
	
	var size = sizes.pick_random()
	var instance = null
	
	
	if size == "medium":
		instance = medium_meteor_scene_1.instantiate()
	else:
		instance = big_meteor_scene_1.instantiate()
	
	# Move around player with random angle
	var random_angle = randf_range(0,2*PI)
	var spawn_x = player.position.x + PLAYER_DISTANCE * cos(random_angle)
	var spawn_y = player.position.y + PLAYER_DISTANCE * sin(random_angle)
	position = Vector2(spawn_x,spawn_y)
	
	instance.position = position
	instance.init(game_scene)
	game_scene.add_child(instance)

func spawn_small_meteors(nbr : int, meteor_position : Vector2):
	position = meteor_position
	for i in range(nbr):
		var instance = small_meteor_scene_1.instantiate()
		instance.position = position
		game_scene.add_child(instance)
