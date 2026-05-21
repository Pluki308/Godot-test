extends Control
class_name InventoryController

var item_slots_counter = 20
var inventory_slot_prefab: PackedScene = load("res://complexObjects/Player/inventory_slot.tscn")
@onready var inventory_grid: GridContainer = %GridContainer
#var inventory_slots: Array[] = []
