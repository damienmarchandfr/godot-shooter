class_name MeteorBig
extends Meteor

func _ready():
	super._ready()
	number_of_meteor = 6

func _process(delta):
	super._process(delta)

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	super._on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index)
	
func explode():
	super.explode()
	print('Meteor big explode')
	
	
