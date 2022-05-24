tool
extends EditorPlugin

var scene_tree: MainLoop
var viewport: Viewport
var editor_node

var editor_viewport: Viewport


func _enter_tree():
	call_deferred("_setup")


func _setup():
	scene_tree = get_tree()
	viewport = scene_tree.get_root()

	viewport.usage = Viewport.USAGE_3D

	var base_control = get_editor_interface().get_base_control()
	var panel = base_control.get_parent()
	editor_node = panel.get_parent()

	_instance_3d()

	# editor_node.remove_child(panel)
	# editor_viewport.add_child(panel)

	# editor_node.queue_free()


func _instance_3d():
	var mi = MeshInstance.new()
	editor_node.add_child(mi)
	# mi.rotate(Vector3(0, 0, 1), deg2rad(-180))
	mi.scale = Vector3(1, -1, 1);
	mi.mesh = QuadMesh.new()
	mi.mesh.size = Vector2(16, 9)
	mi.material_override = SpatialMaterial.new()
	mi.material_override.vertex_color_use_as_albedo = true

#	var camera = Camera.new()
#	editor_node.add_child(camera)
#	camera.translation = Vector3(0,0,2)
#	camera.current = true

#	editor_viewport = Viewport.new()
#	editor_viewport.own_world = true
#	editor_viewport.world = World.new()
#	editor_viewport.size = viewport.size
#	editor_viewport.render_target_v_flip = true

#	var te = TextEdit.new()
#	te.rect_min_size = Vector2(300, 300)
#	te.text = "Hello World!"
#	editor_viewport.add_child(te)

	# viewport.render_target_v_flip = true
	mi.material_override.albedo_texture = viewport.get_texture()
#	editor_node.add_child(editor_viewport)

#	te.grab_focus()


func _exit_tree():
	scene_tree = null
	viewport = null
