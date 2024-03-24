extends Node2D

func _ready():
	Inventory.money = 0;
	Inventory.potions = 0;

var in_Area = false;

func _physics_process(delta):
	if Inventory.money >=50000:
		$End/Label.text ="Press Space/Enter to Escape.";
	else:
		$End/Label.text = str(50000-Inventory.money) + " Left";
	
	if in_Area == true:
		if Input.is_action_just_pressed("ui_accept") && Inventory.money >=50000:
			get_tree().change_scene_to_file("res://Scenes/Levels/end.tscn");
	

func _on_end_body_entered(body):
	if body == $Player:
		in_Area= true;



func _on_end_body_exited(body):
	if body == $Player:
		in_Area= false;

