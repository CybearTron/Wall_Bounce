extends StaticBody2D

var khata = 0;
var corpses =1;
var corpse_price =125;
var player = null;

func _sell_corpse():
	if Inventory.money >= corpse_price:
		khata += corpse_price;
		Inventory.money-=corpse_price;
		corpses -=1;
		Inventory.corpses +=1;
	

func _physics_process(delta):
	if player!=null:
		if Input.is_action_just_pressed("ui_accept"):
			_sell_corpse();

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player = body;


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player = null;
