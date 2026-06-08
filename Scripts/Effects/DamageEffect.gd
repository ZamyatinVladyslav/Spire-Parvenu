class_name DamageEffect
extends CardEffect

@export var damage_value: int = 0

func apply_effect(user: Entity, target: Entity) -> void:
	print("TEST - played attack")
	if target:
		print("Act: Damage dealt -> ", damage_value)
		target.take_damage(damage_value)
