class_name Character
extends Entity

@export var character_data: CharacterData

func _ready():
	if character_data:
		init_player(character_data)

func init_player(c_data: CharacterData):
	character_data = c_data
	
	init_entity(c_data)
