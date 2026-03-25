extends SmallLoot

class_name Essence

var essence_type: Enums.DamageType = Enums.DamageType.NORMAL

const DEBUG_PROJECTILE = preload("res://materials/projectiles/debug_projectile.tres")
const NORMAL_PROJECTILE = preload("res://materials/projectiles/normal_projectile.tres")
const FIRE_PROJECTILE = preload("res://materials/projectiles/fire_projectile.tres")
const PLANT_PROJECTILE = preload("res://materials/projectiles/plant_projectile.tres")
const ELECTRIC_PROJECTILE = preload("res://materials/projectiles/electric_projectile.tres")

func _init() -> void:
	value = 1

func _ready() -> void:
	super._ready()


func set_type(new_type: Enums.DamageType) -> void:
	essence_type = new_type


func _on_area_3d_area_entered(_area: Area3D) -> void:
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		player.gain_essence(essence_type, value)
		queue_free()
	else:
		push_error("player not found !")
