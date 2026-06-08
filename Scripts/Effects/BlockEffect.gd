class_name BlockEffect
extends CardEffect

@export var block_value: int = 0

func apply_effect(user: Entity, target: Entity) -> void:
	# Броню мы накладываем на того, КТО сыграл карту (на user)
	if user:
		print("Act: Blocked -> ", block_value)
		user.add_block(block_value)
