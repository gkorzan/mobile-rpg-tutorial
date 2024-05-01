extends Node2D

var hp = 25:
	set = set_hp

@onready
var hpLabel = $HPLable
@onready
var animationPlayer = $AnimationPlayer

signal dead

func set_hp(new_hp):
	hp = new_hp
	hpLabel.text = str(hp) + 'hp'
	
	if (hp <= 0):
		emit_signal("dead")
		queue_free()
	else:
		animationPlayer.play("SHAKE")
		await animationPlayer.animation_finished
		animationPlayer.play("ATTACK")
		await animationPlayer.animation_finished
		
		var battle = get_tree().current_scene
		var player = battle.find_child("PlayerStats")
		player.hp -= 3
