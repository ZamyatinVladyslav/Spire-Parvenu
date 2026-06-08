class_name Entity
extends Node2D

@export var data: EntityData

var current_hp: int
var current_block: int = 0

@onready var hp_text = $Health/Label
@onready var block_text = $Armor/Label

func _ready():
	if data:
		init_entity(data)

# Entity initialisation
func init_entity(entity_data: EntityData):
	data = entity_data
	current_hp = data.max_hp
	current_block = 0
	
	update_ui()

func update_ui():
	hp_text.text = str(current_hp)
	
	# Show only if > 0
	if current_block > 0:
		block_text.text = "[" + str(current_block) + "]"
		block_text.show()
	else:
		block_text.hide()

func take_damage(amount: int):
	if amount <= 0: return
	
	if current_block > 0:
		if amount <= current_block:
			current_block -= amount
			amount = 0
		else:
			amount -= current_block
			current_block = 0
			
	current_hp = max(0, current_hp - amount)
	update_ui()
	
	#print(data.name, " получил урон. HP: ", current_hp)
	
	if current_hp <= 0:
		die()

func add_block(amount: int):
	current_block += amount
	update_ui()

func clear_block():
	current_block = 0
	update_ui()

# Death - WIP
func die():
	print(data.name, " dead. WIP")
