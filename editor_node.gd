extends Node

var editor_vp


func _ready():
	var mi = MeshInstance.new()
	add_child(mi)
	mi.mesh = QuadMesh.new()
	mi.material_override = SpatialMaterial.new()
	mi.material_override.vertex_color_use_as_albedo = true

	var camera = Camera.new()
	add_child(camera)
	camera.translation = Vector3(0,0,2)

	editor_vp = Viewport.new()
	editor_vp.own_world = true
	editor_vp.size = Vector2(300, 300)
	editor_vp.render_target_v_flip = true

	var te = TextEdit.new()
	te.rect_min_size = Vector2(300, 300)
	te.text = "Hello World!"
	editor_vp.add_child(te)

	mi.material_override.albedo_texture = editor_vp.get_texture()
	add_child(editor_vp)

	te.grab_focus()


func _input(event):
	editor_vp.input(event)
