extends Control

var database : SQLite
var ItemListResult : Array

func _on_ready() -> void:
	database = SQLite.new()
	database.path = "res://app.db"
	database.open_db()
	ItemListResult = database.select_rows("notes","id>560",["id","title"])
	print(ItemListResult)
	for item in ItemListResult:
		$ItemList.add_item(item["title"])
	pass # Replace with function body.


func _on_item_list_item_selected(index: int) -> void:
	print("选择了第几个？："+str(index))
	print(ItemListResult[index])
	var db_id = str(ItemListResult[index]["id"])
	var content = database.select_rows("notes","id="+db_id,["content"])
	var real_content = content[0]["content"]
	print(real_content)
	$CodeEdit.clear()
	$CodeEdit.text = real_content
	pass # Replace with function body.
