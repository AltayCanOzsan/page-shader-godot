extends Sprite2D

var texture_size = Vector2(self.texture.get_size().x, self.texture.get_size().y)
var mousePos = Vector2(0, self.texture.get_size().y)

func _ready() -> void:
	material.set_shader_parameter("scale",global_scale)

func _process(_delta: float) -> void:
	material.set_shader_parameter("mouse_pos",mousePos)
	print_rich("[color=green]mousePos: ", mousePos)

func _on_next_page_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "mousePos", Vector2(texture_size.x * 2, -texture_size.y), .6)
	## If you want it to see a little fold, remove "* 2"
	## You MIGHT have to adjust Vector2() values depending on your texture size.  

func _on_previous_page_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "mousePos", Vector2(0, self.texture.get_size().y), .6)
