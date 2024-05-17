extends Node

@onready var enemy = $Enemy
@onready var playerStats = $PlayerStats
@onready var actionButtons = $UI/ActionButtons

func _ready():
	start_player_turn()
	
func start_player_turn():
	actionButtons.show()
	playerStats.ap = playerStats.MAX_AP
	
func start_enemy_turn():
	actionButtons.hide()
	if enemy != null:
		enemy.attack(playerStats)

func _on_enemy_dead():
	actionButtons.hide()
	enemy = null


func _on_player_stats_end_turn():
	start_enemy_turn()

func _on_enemy_end_turn():
	start_player_turn()
