extends Node2D
class_name EnemyBase

signal enemy_damaged
signal enemy_died

@export var hp : int 
@export var speed : float
@export var damage : int
@export var direction : Vector2
@export var hurtbox : Area2D
@export var projectiles_container : Node2D
@export var animation_player : AnimationPlayer
@export var sprite : AnimatedSprite2D

var is_dead : bool = false

func take_damage(damage_taken : int) -> void:
	if is_dead: return
	
	hp -= damage_taken
	emit_signal("enemy_damaged")
	if hp <= 0:
		die()
	else:
		show_damage_effect()

func die() -> void:
	if is_dead: return
	
	is_dead = true
	
	hurtbox.set_deferred("monitoring", false)
	hurtbox.set_deferred("monitorable", false)
	emit_signal("enemy_died")
	play_death_animation()

func show_damage_effect() -> void:
	SfxPlayer.play_sfx("damaged")
	animation_player.play("taken_damage")
	
func play_death_animation() -> void:
	SfxPlayer.play_sfx("explosion")
	sprite.play("explosion")
