extends "res://ActionButton.gd"

func _on_pressed():
	var playerStats = BattleUnits.PlayerStats
	if playerStats:
		if playerStats.mp >= 8:
			playerStats.ap -= 1
			playerStats.hp += 5
			playerStats.mp -= 8
