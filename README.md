```lua
-- Job

['yumyums'] = {
		label = 'Yum Yums',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
			[0] = {
				name = 'Worker',
				payment = 10
			},
			[1] = {
				name = 'Boss',
				isboss = true,
				payment = 1000
			},
		},
	},

--- Items

        bacon                     = { name = 'bacon', label = 'Bacon', weight = 100, type = 'item', image = 'bacon.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable bacon' },
        burgerbuns                     = { name = 'burgerbuns', label = 'Burgerbuns', weight = 100, type = 'item', image = 'burgerbuns.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable burgerbuns' },
        burgermeatpatty_cooked                     = { name = 'burgermeatpatty_cooked', label = 'Burgermeatpatty Cooked', weight = 100, type = 'item', image = 'burgermeatpatty_cooked.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable burgermeatpatty cooked' },
        burgermeatpatty_raw                     = { name = 'burgermeatpatty_raw', label = 'Burgermeatpatty Raw', weight = 100, type = 'item', image = 'burgermeatpatty_raw.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable burgermeatpatty raw' },
        burgervegetablepatty_cooked                     = { name = 'burgervegetablepatty_cooked', label = 'Burgervegetablepatty Cooked', weight = 100, type = 'item', image = 'burgervegetablepatty_cooked.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable burgervegetablepatty cooked' },
        burgervegetablepatty_raw                     = { name = 'burgervegetablepatty_raw', label = 'Burgervegetablepatty Raw', weight = 100, type = 'item', image = 'burgervegetablepatty_raw.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable burgervegetablepatty raw' },
        cheese                     = { name = 'cheese', label = 'Cheese', weight = 100, type = 'item', image = 'cheese.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable cheese' },
        chocolate                     = { name = 'chocolate', label = 'Chocolate', weight = 100, type = 'item', image = 'chocolate.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable chocolate' },
        chocolatesyrup                     = { name = 'chocolatesyrup', label = 'Chocolatesyrup', weight = 100, type = 'item', image = 'chocolatesyrup.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable chocolatesyrup' },
        choppedpotato                     = { name = 'choppedpotato', label = 'Choppedpotato', weight = 100, type = 'item', image = 'choppedpotato.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable choppedpotato' },
        choppedsweetpotato                     = { name = 'choppedsweetpotato', label = 'Choppedsweetpotato', weight = 100, type = 'item', image = 'choppedsweetpotato.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable choppedsweetpotato' },
        icecream                     = { name = 'icecream', label = 'Icecream', weight = 100, type = 'item', image = 'icecream.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable icecream' },
        milk                     = { name = 'milk', label = 'Milk', weight = 100, type = 'item', image = 'milk.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable milk' },
        mixedvegetables                     = { name = 'mixedvegetables', label = 'Mixedvegetables', weight = 100, type = 'item', image = 'mixedvegetables.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable mixedvegetables' },
        potato                     = { name = 'potato', label = 'Potato', weight = 100, type = 'item', image = 'potato.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable potato' },
        strawberries                     = { name = 'strawberries', label = 'Strawberries', weight = 100, type = 'item', image = 'strawberries.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable strawberries' },
        sweetpotato                     = { name = 'sweetpotato', label = 'Sweetpotato', weight = 100, type = 'item', image = 'sweetpotato.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable sweetpotato' },
        big_piggy_burger                     = { name = 'big_piggy_burger', label = 'Big Piggy Burger', weight = 100, type = 'item', image = 'big_piggy_burger.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable big piggy burger' },
        chocolate_milkshake                     = { name = 'chocolate_milkshake', label = 'Chocolate Milkshake', weight = 100, type = 'item', image = 'chocolate_milkshake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable chocolate milkshake' },
        danny_burger                     = { name = 'danny_burger', label = 'Danny Burger', weight = 100, type = 'item', image = 'danny_burger.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable danny burger' },
        filthy_crim_burger                     = { name = 'filthy_crim_burger', label = 'Filthy Crim Burger', weight = 100, type = 'item', image = 'filthy_crim_burger.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable filthy crim burger' },
        french_fries                     = { name = 'french_fries', label = 'French Fries', weight = 100, type = 'item', image = 'french_fries.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable french fries' },
        heart_attack_burger                     = { name = 'heart_attack_burger', label = 'Heart Attack Burger', weight = 100, type = 'item', image = 'heart_attack_burger.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable heart attack burger' },
        loaded_fries                     = { name = 'loaded_fries', label = 'Loaded Fries', weight = 100, type = 'item', image = 'loaded_fries.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable loaded fries' },
        loaded_thickshake                     = { name = 'loaded_thickshake', label = 'Loaded Thickshake', weight = 100, type = 'item', image = 'loaded_thickshake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable loaded thickshake' },
        strawberry_milkshake                     = { name = 'strawberry_milkshake', label = 'Strawberry Milkshake', weight = 100, type = 'item', image = 'strawberry_milkshake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable strawberry milkshake' },
        sweet_potato_fries                     = { name = 'sweet_potato_fries', label = 'Sweet Potato Fries', weight = 100, type = 'item', image = 'sweet_potato_fries.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable sweet potato fries' },
        vegetarian_burger                     = { name = 'vegetarian_burger', label = 'Vegetarian Burger', weight = 100, type = 'item', image = 'vegetarian_burger.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A useable vegetarian burger' },
```
