extends CharacterBody2D

@export var speed = 300;
var acceleration: = 10;
var friction = 400;

var harvestable = false;
var corpse = null;

func _get_input(delta):
	var input_direction =Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = velocity.move_toward(speed * input_direction, acceleration);
	if corpse != null:
		if Input.is_action_just_pressed("ui_accept") && corpse.potion >=1:
			Inventory.potions+=1;
			corpse.potion-=1;
			corpse.timer.start();
			$Hitbox.set_deferred("monitoring",false);
			corpse = null;
			$Hitbox.set_deferred("monitoring",true);


func _physics_process(delta):
	_get_input(delta);
	move_and_slide();
	
	$Label.text = "Potions: "+str(Inventory.potions);
	$Label2.text = "Money: "+ str(Inventory.money);
	
	if Inventory.upgrades.has("player_speed"):
		acceleration = 12;
		speed = 750;
	else:
		acceleration = 10;
		speed = 600;


func _on_hitbox_body_entered(body):
	if body.is_in_group('corpse'):
		harvestable = true;
		corpse = body;


func _on_hitbox_body_exited(body):
	if body.is_in_group('corpse'):
		harvestable = false;
		corpse = null;
