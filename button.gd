extends Button
var counter = 0

func _on_pressed() -> void:
	print("我被按下了哦")
	$"../MQTT".connect_to_broker("tcp://192.168.50.233:1883/")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	#counter =  counter + 1
	#$"../Label".text = str(counter)
	pass # Replace with function body.


func _on_mqtt_broker_connected() -> void:
	print("mqtt 服务器链接成功")
	$"../MQTT".subscribe("lemon_gpu_temp")
	pass # Replace with function body.


func _on_mqtt_broker_connection_failed() -> void:
	print("mqtt 服务器链接失败")
	pass # Replace with function body.


func _on_mqtt_received_message(topic: Variant, message: Variant) -> void:
	print(message)
	$"../Label".text = str(message)+"℃"
	pass # Replace with function body.
