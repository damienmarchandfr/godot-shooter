class_name MeteorSpawn
extends Node2D

const PLAYER_DISTANCE = 1000

@export
var player : Player

@export
var game_scene : Node2D

@export
var storage : Storage

@export
var auto_spawn = true

var medium_meteor_scene_1 = preload("res://entities/meteors/medium/meteor_medium_1.tscn")
var medium_meteor_scene_2 = preload("res://entities/meteors/medium/meteor_medium_2.tscn")
var medium_meteor_scene_3 = preload("res://entities/meteors/medium/meteor_medium_3.tscn")
var medium_meteor_scene_4 = preload("res://entities/meteors/medium/meteor_medium_4.tscn")
var medium_meteor_scene_5 = preload("res://entities/meteors/medium/meteor_medium_5.tscn")

var big_meteor_scene_1 = preload("res://entities/meteors/big/meteor_big_1.tscn")
var big_meteor_scene_2 = preload("res://entities/meteors/big/meteor_big_2.tscn")
var big_meteor_scene_3 = preload("res://entities/meteors/big/meteor_big_3.tscn")

func _ready():
	if !player or !game_scene:
		printerr('Missing player and/or game scene in spawner')
	if !storage:
		printerr("Missing storage")

func _process(delta):
	pass
	
func _on_timer_meteor_timeout():
	if !auto_spawn:
		return
		
	var sizes = ["medium","big"]
	
	var size = sizes.pick_random()
	var instance = null
	
	
	if size == "medium":
		var choice = [medium_meteor_scene_1,medium_meteor_scene_2,medium_meteor_scene_3,medium_meteor_scene_4,medium_meteor_scene_5].pick_random()
		instance = choice.instantiate()
	else:
		var choice = [big_meteor_scene_1,big_meteor_scene_2,big_meteor_scene_3].pick_random()
		instance = choice.instantiate()
	
	# Move around player with random angle
	var random_angle = randf_range(0,2*PI)
	var spawn_x = player.position.x + PLAYER_DISTANCE * cos(random_angle)
	var spawn_y = player.position.y + PLAYER_DISTANCE * sin(random_angle)
	position = Vector2(spawn_x,spawn_y)
	
	instance.position = position
	instance.init(game_scene,storage)
	game_scene.add_child(instance)
	storage.add_meteor(instance)

