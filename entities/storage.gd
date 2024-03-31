class_name Storage
extends Node

var meteors : Array[Meteor] = []
var bullets : Array[Bullet] = []

var score : int = 0

func add_meteor(m : Meteor):
	meteors.append(m)
	
func add_bullet(b: Bullet):
	bullets.append(b)

func clean_all():
	for meteor in meteors:
		meteor.queue_free()
	for bullet in bullets:
		bullet.queue_free()

func increment_score():
	score = score+1
