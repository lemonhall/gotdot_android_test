extends Control

var last_button_pressed:Button = null

func _on_ready() -> void:
	$GridContainer.columns = 7
	var day_list = ["一","二","三","四","五","六","日"]
	for day_name in day_list:
		var lab  = Label.new()
		lab.text = day_name
		lab.add_theme_font_size_override("font_size",64)
		$GridContainer.add_child(lab)
	
	var days_array = []
	days_array.append(0)
	days_array.append(0)
	days_array.append(0)
	days_array.append(0)
	days_array.append(0)
	days_array.append(0)
	for i in range(1, 31):
		days_array.append(i)

	for dd in days_array:
		var button  = Button.new()
		if dd == 0:
			button.text = str(" ")
		else:
			button.text = str(dd)
		button.add_theme_font_size_override("font_size",64)
		button.flat = true
		$GridContainer.add_child(button)
		# 可以参考这一段的语法
		#for button in $Buttons.get_children():
		#	button.pressed.connect(_on_pressed.bind(button))
		# 为每个标签绑定点击处理程序
		button.pressed.connect(_on_label_clicked.bind(button))

func _on_label_clicked(button:Button) -> void:
	# 在这里处理标签被点击的事件
	print("button with text '", button.text, "' was clicked.")
	button.add_theme_color_override("font_color","red")
	button.add_theme_color_override("font_pressed_color","red")
	button.add_theme_color_override("font_focus_color","red")
	button.add_theme_color_override("font_hover_pressed_color","red")
	button.add_theme_color_override("font_hover_color","red")
	
	if last_button_pressed:
		last_button_pressed.remove_theme_color_override("font_color")
		last_button_pressed.remove_theme_color_override("font_pressed_color")
		last_button_pressed.remove_theme_color_override("font_focus_color")
		last_button_pressed.remove_theme_color_override("font_hover_pressed_color")
		last_button_pressed.remove_theme_color_override("font_hover_color")
	$AudioStreamPlayer.play()
	$Camera2D.add_trauma(0.2)
	last_button_pressed = button
