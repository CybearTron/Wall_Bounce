extends StaticBody2D

var potion = 1;

@onready var timer = $Timer
@onready var label = $Label

func _on_timer_timeout():
	potion+=1;

func _physics_process(delta):
	label.text = "Time: "+ str(timer.time_left) +"\nPotions: "+str(potion);
