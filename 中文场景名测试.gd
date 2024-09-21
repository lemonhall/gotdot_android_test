extends Control
	
#https://docs.godotengine.org/en/stable/classes/class_xmlparser.html
func _on_ready() -> void:
	print("中文场景成功加载了")	
	
	var parser = XMLParser.new()
	parser.open("res://test1.html")
	while parser.read() != ERR_FILE_EOF:
		#print(parser.get_node_name())
		#print(parser.get_node_type())
		#print(parser.get_node_data())
		if parser.get_node_type() == 3:
			var lab = Label.new()
			lab.text = parser.get_node_data()
			lab.add_theme_font_size_override("font_size",24)
			$MarginContainer/ScrollContainer/VBoxContainer.add_child(lab)

		if parser.get_node_name() == "img":
			var attributes_dict = {}
			for idx in range(parser.get_attribute_count()):
				attributes_dict[parser.get_attribute_name(idx)] = parser.get_attribute_value(idx)
			#print("Img src: ", attributes_dict["src"])
			var img_src = "https://blog.lemonhall.me"+attributes_dict["src"]
			var textureRect = TextureRect.new()
			textureRect.stretch_mode = TextureRect.STRETCH_KEEP
			$MarginContainer/ScrollContainer/VBoxContainer.add_child(textureRect)
			$HTTPManager.job(
				img_src
			).on_success_set(
				textureRect, "texture"
			).mime("image/texture").fetch()

			
		if parser.get_node_type() == XMLParser.NODE_ELEMENT:
			pass
			# var node_name = parser.get_node_name()
			# print(parser.get_node_data())
			# var attributes_dict = {}
			# for idx in range(parser.get_attribute_count()):
				#attributes_dict[parser.get_attribute_name(idx)] = parser.get_attribute_value(idx)
				#print("The ", node_name, " element has the following attributes: ", attributes_dict)
