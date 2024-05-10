class_name Bullet
extends Area2D

var direction_and_speed : Vector2 = Vector2.ZERO

var speed : float = 1000

@onready
var sprite = $Sprite2D

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var new_index = 0
	

	var angle = atan2(self.direction_and_speed.y, self.direction_and_speed.x)
	sprite.rotation = angle
	$CollisionShape2D.rotation = angle
		
	self.position = self.position + self.direction_and_speed * delta

func set_angle(angle : float):
	self.direction_and_speed.x = (cos(angle) - sin(angle))*self.speed
	self.direction_and_speed.y = (sin(angle) + cos(angle))*self.speed
	
