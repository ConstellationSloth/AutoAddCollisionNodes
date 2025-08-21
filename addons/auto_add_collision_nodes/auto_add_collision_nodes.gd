@tool
extends EditorPlugin

func _enter_tree():
	get_tree().node_added.connect(on_node_added_to_scene_tree)
	
	
func on_node_added_to_scene_tree(node: Node):
	if node is CharacterBody2D and node.name == "CharacterBody2D":
		add_supporting_nodes(node)
		return
	if node is StaticBody2D and node.name == "StaticBody2D":
		add_supporting_nodes(node)
		return
	if node is Area2D and node.name == "Area2D":
		add_supporting_nodes(node)
		return

func add_supporting_nodes(node: Node):
	var shape := CollisionShape2D.new()
	var sprite := Sprite2D.new()
	shape.name = "CollisionShape2D"
	sprite.name = "Sprite2D"
	node.add_child(shape)
	shape.owner = get_tree().edited_scene_root
	node.add_child(sprite)
	sprite.owner = get_tree().edited_scene_root

func _exit_tree():
	get_tree().node_added.disconnect(on_node_added_to_scene_tree)
