extends Control

var database : SQLite

func _on_ready() -> void:
	database = SQLite.new()
	database.path = "res://app.db"
	database.open_db()
	pass # Replace with function body.
