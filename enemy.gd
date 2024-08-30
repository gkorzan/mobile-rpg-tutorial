extends Node2D

const BattleUnits = preload("res://BattleUnits.tres")

@export var hp:int = 25:
	set = set_hp
@export var damage:int = 4
@onready
var hpLabel = $HPLable
@onready
var animationPlayer = $AnimationPlayer

signal dead
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	if hpLabel != null:
		hpLabel.text = str(hp) + 'hp'

func attack() -> void:
	await get_tree().create_timer(0.4)
	animationPlayer.play("ATTACK")
	await animationPlayer.animation_finished
	emit_signal("end_turn")
	
func deal_damage(amount):
		BattleUnits.PlayerStats.hp -= damage
	
func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("dead")
		queue_free()
	else: 
		animationPlayer.play("SHAKE")
		await animationPlayer.animation_finished

func is_dead():
	return hp <= 0
	
func _ready():
	BattleUnits.Enemy = self
	
func _exit_tree():
	BattleUnits.Enemy = null

