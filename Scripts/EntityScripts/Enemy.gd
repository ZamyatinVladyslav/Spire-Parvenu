class_name Enemy
extends Entity

@export var enemy_data: EnemyData

enum IntentType { ATTACK, DEFEND, BUFF }

var current_intent: IntentType
var intent_value: int = 0

@onready var intent_label = $Intent/Label 

func _ready():
	if enemy_data:
		init_entity(enemy_data)
		plan_next_move()

func plan_next_move():
	if randf() > 0.4:
		current_intent = IntentType.ATTACK
		intent_value = enemy_data.base_damage
		intent_label.text = "Atack: " + str(intent_value)
	else:
		current_intent = IntentType.DEFEND
		intent_value = enemy_data.base_shield
		intent_label.text = "Block: " + str(intent_value)
	
	intent_label.show()

func take_turn(target_player: Character):
	clear_block()
	
	match current_intent:
		IntentType.ATTACK:
			target_player.take_damage(intent_value)
		IntentType.DEFEND:
			add_block(intent_value)
			
	plan_next_move()
