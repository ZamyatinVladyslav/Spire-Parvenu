extends Resource
class_name CardData

@export var card_name: String = "Name"
@export var card_description: String = "Description"
@export var image: Texture2D

@export var effects: Array[CardEffect] = []

enum TargetType { ENEMY, PLAYER, ALL_ENEMIES }
@export var target_type: TargetType = TargetType.ENEMY

func can_be_played(battle_manager) -> bool:
	if not check_custom_conditions(battle_manager):
		return false
		
	return true

func check_custom_conditions(_battle_manager) -> bool:
	return true 

func play(user: Entity, target: Entity) -> void:
	print("--- Card Playyed: ", card_name, " ---")
	for effect in effects:
		if effect:
			effect.apply_effect(user, target)
