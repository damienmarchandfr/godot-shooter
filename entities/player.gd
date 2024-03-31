class_name Player
extends CharacterBody2D

# Scene where bullet will be instanciated
@export
var game_scene : Node2D

@export 
var storage: Storage

var rotation_speed : float = deg_to_rad(150)
var speed = 350

var current_angle : float = deg_to_rad(-45)

var bullet_scene = preload("res://entities/bullet.tscn")

func _ready():
	if !game_scene:
		printerr('Missing argument game_scene for Player')
	if !storage:
		printerr('Missing storage')

func _process(delta):
	var angle = 0
	if Input.is_action_pressed("left"):
		angle = -rotation_speed*delta
	if Input.is_action_pressed("right"):
		angle = rotation_speed*delta
		
	current_angle += angle
	rotate(angle)
	
	if Input.is_action_pressed("engine"):
		velocity.x += (cos(current_angle) - sin(current_angle))*speed*delta
		velocity.y += (sin(current_angle) + cos(current_angle))*speed*delta
		
	move_and_slide()
	
	if Input.is_action_pressed("fire"):
		if $FireTimer.is_stopped():
			fire()
			$FireTimer.start()
	if Input.is_action_just_released("fire"):
		$FireTimer.stop()

func fire():
	var spawner_position = $BulletSpawner.global_position
	var bullet = bullet_scene.instantiate()
	bullet.position = spawner_position
	bullet.set_angle(current_angle)
	game_scene.add_child(bullet)
	storage.add_bullet(bullet)

func back():
	velocity = - velocity

