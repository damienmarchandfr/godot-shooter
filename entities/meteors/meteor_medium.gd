class_name MeteorMedium
extends Meteor

var scene1 = preload("res://entities/meteors/last/meteor_last_1.tscn")
var scene2 = preload("res://entities/meteors/last/meteor_last_2.tscn")
var scene3 = preload("res://entities/meteors/last/meteor_last_3.tscn")
var scene4 = preload("res://entities/meteors/last/meteor_last_4.tscn")
var scene5 = preload("res://entities/meteors/last/meteor_last_5.tscn")
var scene6 = preload("res://entities/meteors/last/meteor_last_6.tscn")

func _ready():
	super._ready()
	number_of_last = 3


func spawn_small_meteors():
	var all_scenes = [scene1,scene2,scene3,scene4,scene5,scene6]
	for i in range(number_of_last):
		var scene = all_scenes.pick_random()
		var instance = scene.instantiate()
		instance.position = position
		instance.init(game_scene,storage)
		game_scene.add_child(instance)
	
