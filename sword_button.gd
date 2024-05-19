extends "res://ActionButton.gd"

const Slash = preload("res://slash.tscn")

func _on_pressed():
	var battle = get_tree().current_scene
	var enemy = battle.find_child('Enemy')
	var playerStats = battle.find_child('PlayerStats')
	if enemy and playerStats:
		create_slash(enemy.global_position)
		enemy.take_damage(4)
		playerStats.mp += 2
		playerStats.ap -= 1

func create_slash(position):
	var slash = Slash.instantiate()
	var battle = get_tree().current_scene
	battle.add_child(slash)
	slash.global_position = position
