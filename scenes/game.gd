class_name GameScene
extends Node2D

var player : Player
var storage : Storage


# Called when the node enters the scene tree for the first time.
func _ready():
	player = $Player
	storage = $Storage

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
