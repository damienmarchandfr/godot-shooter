class_name Player
extends CharacterBody2D

# Scene where bullet will be instanciated
@export
var game_scene : Node2D

var rotation_speed : float = deg_to_rad(150)
var speed = 350

var current_angle : float = deg_to_rad(-45)

var bullet_scene = preload("res://entities/bullet.tscn")

func _ready():
	if !self.game_scene:
		print('Missing argument game_scene for Player')


func _process(delta):
	var angle = 0
	if Input.is_action_pressed("left"):
		angle = -self.rotation_speed*delta
	if Input.is_action_pressed("right"):
		angle = self.rotation_speed*delta
		
	self.current_angle += angle
	self.rotate(angle)
	
	if Input.is_action_pressed("engine"):
		self.velocity.x += (cos(self.current_angle) - sin(self.current_angle))*self.speed*delta
		self.velocity.y += (sin(self.current_angle) + cos(self.current_angle))*self.speed*delta
		
	self.move_and_slide()
	
	if Input.is_action_pressed("fire"):
		if $FireTimer.is_stopped():
			self.fire()
			$FireTimer.start()
	if Input.is_action_just_released("fire"):
		$FireTimer.stop()

func fire():
	var spawner_position = $BulletSpawner.global_position
	var bullet = bullet_scene.instantiate()
	bullet.position = spawner_position
	bullet.set_angle(self.current_angle)
	self.game_scene.add_child(bullet)

func back():
	self.velocity = - self.velocity

func _on_fire_timer_timeout():
	self.fire()
