class_name Bullet
extends Area2D

var direction_and_speed : Vector2 = Vector2.ZERO

var speed : float = 10

@onready
var sp_1 = $Sprite1
@onready
var sp_2 = $Sprite2
@onready
var sp_3 = $Sprite3
@onready
var sp_4 = $Sprite4

var current_sprite_index : int = -1

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var sprites = [self.sp_1,self.sp_2,self.sp_3,self.sp_4]
	var new_index = 0
	
	if self.current_sprite_index == -1:
		new_index = randi_range(0,len(sprites) - 1)
	
	if self.current_sprite_index == -1 && sprites[new_index]:
		self.current_sprite_index = new_index
		sprites[self.current_sprite_index].visible = true
		var angle = atan2(self.direction_and_speed.y, self.direction_and_speed.x)
		sprites[self.current_sprite_index].rotation = angle
		$CollisionShape2D.rotation = angle
		
	self.position = self.position + self.direction_and_speed

func set_angle(angle : float):
	self.direction_and_speed.x += (cos(angle) - sin(angle))*self.speed
	self.direction_and_speed.y += (sin(angle) + cos(angle))*self.speed
	
