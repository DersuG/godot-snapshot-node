#-------------------------------------------------------------------------------
# Snapshot Target
#-------------------------------------------------------------------------------
# Directions:
# - Add this as a child of whatever node/scene/whatever you want to be able
#	to save/load states for.
# - For example: I have a character scene (KinematicBody with a script, and
#	additional children, like sprites, colliders, etc.). I'll add this node as
#	a child of the KinematicBody. Then, I'll implement the save/load functions
#	into the KinematicBody's script.
#-------------------------------------------------------------------------------
# You'll need to implement the following functions in the parent:
# - func save_state() -> Dictionary:
# - func load_state(state: Dictionary) -> void:
# The format that the state is in is up to you. As long as it is compatible
# with both save_state() and load_state(), all is good.
#-------------------------------------------------------------------------------

extends Node
class_name SnapshotTarget



onready var parent := get_parent()
var states: Dictionary = {}



# When this is created:
func _ready() -> void:
	
	# Check that the parent has the right functions implemented:
	assert(parent.has_method("save_state"), "Bruh you gotta implement this")
	assert(parent.has_method("load_state"), "Bruh you gotta implement this")
	
	# Connect signals:
	SnapshotManager.connect("save_state", self, "_on_save_state")
	SnapshotManager.connect("load_state", self, "_on_load_state")

# When this is destroyed:
func _exit_tree() -> void:
	pass



# When a state is to be saved:
func _on_save_state(key) -> void:
	states[key] = parent.save_state()

# When a state is to be loaded:
func _on_load_state(key) -> void:
	parent.load_state(states[key])
