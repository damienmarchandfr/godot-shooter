class_name MeteorMedium
extends Meteor

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	number_of_meteor = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func explode():
	super.explode()
	print('Medium explode')
