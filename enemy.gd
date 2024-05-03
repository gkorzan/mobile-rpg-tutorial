extends Node2D

var hp = 25:
	set = set_hp
var target = null
@onready
var hpLabel = $HPLable
@onready
var animationPlayer = $AnimationPlayer

signal dead
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	hpLabel.text = str(hp) + 'hp'

func attack(target) -> void:
	await get_tree().create_timer(0.4)
	animationPlayer.play("ATTACK")
	self.target = target
	await animationPlayer.animation_finished
	self.target = null
	emit_signal("end_turn")
	
func deal_damage(amount):
		target.hp -= 4
	
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
