extends StaticBody2D

var khata = 0;
@export var upgrade_price =125;
var player = null;

func _sell_upgrade():
	if Inventory.money >= upgrade_price && Inventory.upgrades.has("shop_account") == false:
		khata += upgrade_price;
		Inventory.money-= upgrade_price;
		Inventory.upgrades.append("shop_account");
	

func _physics_process(delta):
	if player!=null:
		if Input.is_action_just_pressed("ui_accept"):
			_sell_upgrade();

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player = body;


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player = null;
