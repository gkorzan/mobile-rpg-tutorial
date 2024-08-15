extends Node

const BattleUnits = preload("res://BattleUnits.tres")

@onready var actionButtons = $UI/ActionButtons

func _ready():
	start_player_turn()
	
func start_player_turn():
	actionButtons.show()
	BattleUnits.PlayerStats.ap = BattleUnits.PlayerStats.MAX_AP
	
func start_enemy_turn():
	actionButtons.hide()
	if BattleUnits.Enemy != null:
		BattleUnits.Enemy.attack()

func _on_enemy_dead():
	actionButtons.hide()
	BattleUnits.Enemy = null

func _on_player_stats_end_turn():
	start_enemy_turn()

func _on_enemy_end_turn():
	start_player_turn()

