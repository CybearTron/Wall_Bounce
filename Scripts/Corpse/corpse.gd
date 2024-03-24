extends StaticBody2D

var potion = 1;

@onready var timer = $Timer
@onready var label = $Label

func _on_timer_timeout():
	potion+=1;

func _physics_process(delta):
	if timer.time_left==0:
		label.text = "Ready";
	else:
		label.text =str(snapped(timer.time_left,0.01));
	
	
	if Inventory.upgrades.has("potion_stack"):
		timer.one_shot = false;
	else:
		timer.one_shot = true;
