extends KinematicBody2D

const GRAVITY: int = 10
const MOVE_SPEED: int = 230 # Скорость перемещения персонажа в пикселях
const JUMP_POWER: int = 400 # Скорость прыжка

# Переменные
var velocity: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	move_character()
	jump()
	self.velocity.y += GRAVITY
	self.velocity = self.move_and_slide(self.velocity, Vector2(0, -1))

func move_character() -> void:
	var direction: float = Input.get_action_strength("right") - Input.get_action_strength("left") 
	self.velocity.x = direction * MOVE_SPEED
	if Input.is_action_pressed("right"):
		$AnimatedSprite.play('run')
	if Input.is_action_just_released("right") and not Input.is_action_pressed('left'):
		$AnimatedSprite.play("idle")
	if Input.is_action_pressed("left"):
		$AnimatedSprite.play("runinvert")
	if Input.is_action_just_released("left") and not Input.is_action_pressed("right"):
		$AnimatedSprite.play("idle")
	
	

func jump() -> void:
	if self.is_on_floor():
		$AnimatedSprite.play('idle')
		if Input.is_action_pressed("jump"):
			self.velocity.y -= JUMP_POWER
			$AnimatedSprite.play('jump')

	



