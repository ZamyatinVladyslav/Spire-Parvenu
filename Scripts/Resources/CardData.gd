extends Resource
class_name CardData

@export var card_name: String = "Name"
@export var card_description: String = "Description"
@export var image: Texture2D

func can_be_played(battle_manager) -> bool:
	if not check_custom_conditions(battle_manager):
		return false
		
	return true

func check_custom_conditions(_battle_manager) -> bool:
	return true 
