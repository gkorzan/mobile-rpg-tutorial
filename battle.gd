extends Node

const BattleUnits = preload("res://BattleUnits.tres")

@export var enemies:Array[PackedScene]

@onready var actionButtons = $UI/ActionButtons
@onready var nextRoomButton = $UI/CenterContainer/NextRoomButton
@onready var enemyPosition = $EnemyPosition

func _ready():
	randomize()
	start_player_turn()
	var enemy = BattleUnits.Enemy
	var callable = Callable(self, "_on_enemy_dead")
	if enemy != null:
		enemy.dead.connect(callable)
		
	
func start_player_turn():
	actionButtons.show()
	BattleUnits.PlayerStats.ap = BattleUnits.PlayerStats.MAX_AP
	
func start_enemy_turn():
	actionButtons.hide()
	if BattleUnits.Enemy != null:
		await BattleUnits.Enemy.attack()
	start_player_turn()

func _on_enemy_dead():
	actionButtons.hide()
	nextRoomButton.show()
	BattleUnits.Enemy = null

func _on_player_stats_end_turn():
	start_enemy_turn()

func _on_enemy_end_turn():
	start_player_turn()

func create_new_enemy():
	enemies.shuffle()
	var Enemy = enemies.front()
	var enemy = Enemy.instantiate()
	enemyPosition.add_child(enemy)
	var callable = Callable(self, "_on_enemy_dead")
	if enemy != null:
		enemy.dead.connect(callable)

func _on_next_room_button_pressed():
	actionButtons.show() # Replace with function body.
	BattleUnits.PlayerStats.ap = BattleUnits.PlayerStats.MAX_AP
	create_new_enemy()
	nextRoomButton.hide()
