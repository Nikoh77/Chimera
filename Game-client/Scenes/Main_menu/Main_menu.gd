extends Control

@onready var username_input = get_node("AuthUser")
@onready var password_input = get_node("AuthPassword")
@onready var login_button = get_node("connect")


func _ready():
	pass

func _on_login_button_pressed():
	if username_input.text == "" or password_input.text == "":
		$AudioStreamPlayer2.play()
		$warning.text = "Please fill all fields"
		$warning.show()	
	else: 	
		$connect.disabled = true
		Gatewayserver.ConnectToServer(username_input.get_text(), password_input.get_text() )
		$warning.hide()
		$spinner.process_mode = Node.PROCESS_MODE_ALWAYS
		$spinner.visible = true

@rpc("call_remote")
func printIPData(data):
	pass
