#-------------------------------------------------------------------------------
# Snapshot Manager
#-------------------------------------------------------------------------------
# Directions:
# - Set this as an autoload (project > project settings > autoload)
# - Whenever you want to save or load a state, call the corresponding functions
#	or emit the signals manually.
#-------------------------------------------------------------------------------

extends Node

signal save_state(key)
signal load_state(key)

func save_state(key) -> void:
	emit_signal("save_state", key)

func load_state(key) -> void:
	emit_signal("load_state", key)
