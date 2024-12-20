Config = {}

Config.Locations = {
    Blip = {
        name = 'Yum Yums',
        sprite = 870,
        location = vector3(-1560.0823, -456.8985, 35.7972)
    },
    Chopping = vector3(-1558.7715, -455.2092, 35.7973),

    PreparingFries = vector3(-1562.0931, -455.5031, 35.7973),
    pattyCooking = vector3(-1563.1754, -449.8380, 35.7973),
    Cooking = vector3(-1559.7921, -453.7493, 35.7973),

    MilkShakes = vector3(-1564.5176, -451.1414, 35.7972),

    Fridges = {  
        vector3(-1567.6212, -449.4955, 35.7973), 
        vector3(-1566.6411, -448.5302, 35.7975), 
        vector3(-1565.4911, -447.3758, 35.7973)
    },

    Stash = vector3(-1561.9803, -454.9490, 39.9263),
    foodStash = vector3(-1558.4059, -459.6892, 35.7973),
    Billing = vector3(-1556.8026, -450.8565, 35.7973),

    jobLocations = {
        Duty = vector3(-1553.7180, -459.7288, 36.2004),
        bossMenu = vector3(-1567.3739, -450.2719, 39.9071),
        bossStash = vector3(-1567.8638, -448.3427, 39.9071)
    }
}

Config.Fridgeitems = {vector3(-1558.4059, -459.6892, 35.7973),
    { name = 'bacon', price = 10, count = 5000},
    { name = 'burgerbuns', price = 10, count = 5000},
    { name = 'burgermeatpatty_cooked', price = 15, count = 5000},
    { name = 'burgermeatpatty_raw', price = 10, count = 5000},
    { name = 'burgervegetablepatty_cooked', price = 10, count = 5000},
    { name = 'burgervegetablepatty_raw', price = 15, count = 5000},
    { name = 'cheese', price = 10, count = 5000},
    { name = 'chocolate', price = 10, count = 5000},
    { name = 'chocolatesyrup', price = 15, count = 5000},
    { name = 'choppedpotato', price = 10, count = 5000},
    { name = 'choppedsweetpotato', price = 10, count = 5000},
    { name = 'icecream', price = 15, count = 5000},
    { name = 'milk', price = 10, count = 5000},
    { name = 'mixedvegetables', price = 10, count = 5000},
    { name = 'potato', price = 15, count = 5000},
    { name = 'strawberries', price = 10, count = 5000},
    { name = 'sweetpotato', price = 10, count = 5000},
}

Config.Recipes = {
    ["patty"] = {
        [1] = {
            Name = 'Meat patty',
            RequiredItems = {
                ["burgermeatpatty_raw"] = 1,
            },
            Rewards = {
                'burgermeatpatty_cooked'
            },
            func = 'startPatty' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
        [2]= {
            Name = 'Vegetable Potatoes',
            RequiredItems = {
                ["burgervegetablepatty_raw"] = 1,
            },
            Rewards = {
                'burgervegetablepatty_cooked'
            },
            func = 'startPatty'
        },
    },
    ["potatoes"] = {
        [1] = {
            Name = 'Potatoes',
            RequiredItems = {
                ["potato"] = 1,
            },
            Rewards = {
                'choppedpotato'
            },
            func = 'startChop' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
        [2]= {
            Name = 'Sweet Potatoes',
            RequiredItems = {
                ["sweetpotato"] = 1,
            },
            Rewards = {
                'choppedsweetpotato'
            },
            func = 'startChop'
        },
    },
    ["burgers"] = {
        [1] = {
            Name = 'Big Piggy Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgermeatpatty_cooked"] = 1,
                ["bacon"] = 3,
                ["cheese"] = 1,
            },
            Rewards = {
                'big_piggy_burger'
            },
            func = 'startBurgers' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
        [2]= {
            Name = 'Heart Attack Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgermeatpatty_cooked"] = 3,
                ["cheese"] = 1,
            },
            Rewards = {
                'heart_attack_burger'
            },
            func = 'startBurgers' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
        [3]= {
            Name = 'Filthy Crim Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgermeatpatty_cooked"] = 1,
                ["cheese"] = 1,
            },
            Rewards = {
                'filthy_crim_burger'
            },
            func = 'startBurgers' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
        [4]= {
            Name = 'Danny Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgermeatpatty_cooked"] = 1,
                ["cheese"] = 1,
            },
            Rewards = {
                'danny_burger'
            },
            func = 'startBurgers' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
        [5]= {
            Name = 'Vegetarian Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgervegetablepatty_raw"] = 1,
                ["mixedvegetables"] = 1,
            },
            Rewards = {
                'vegetarian_burger'
            },
            func = 'startBurgers' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
    },
    ["fries"] = {
        [1]= {
            Name = 'Loaded Fries',
            RequiredItems = {
                ["choppedpotato"] = 1,
            },
            Rewards = {
                'loaded_fries'
            },
            func = 'startFries'
        },
        [2]= {
            Name = 'French Fries',
            RequiredItems = {
                ["choppedpotato"] = 1,
            },
            Rewards = {
                'french_fries'
            },
            func = 'startFries'

        },
        [3]= {
            Name = 'Sweet Potato Fries',
            RequiredItems = {
                ["choppedsweetpotato"] = 1,
            },
            Rewards = {
                'sweet_potato_fries'
            },
            func = 'startFries'

        },
    },
    ["milkshakes"] = {
        [1]= {
            Name = 'Loaded ThickShake',
            RequiredItems = {
                ["chocolate"] = 1,
                ["milk"] = 1,
                ["icecream"] = 1,
                ["chocolatesyrup"] = 1,
            },
            Rewards = {
                'loaded_thickshake'
            },
            func = 'startMilkShake' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
        [2]= {
            Name = 'Chocolate Milkshake',
            RequiredItems = {
                ["chocolate"] = 1,
                ["milk"] = 1,
            },
            Rewards = {
                'chocolate_milkshake'
            },
            func = 'startMilkShake' -- Do not touch this if you don't know what you're doing ** It will break the script **
        },
        [3]= {
            Name = 'Strawberry Milkshake',
            RequiredItems = {
                ["strawberries"] = 1,
                ["milk"] = 1,
            },
            Rewards = {
                'strawberry_milkshake'
            },
            func = 'startMilkShake' -- Do not touch this if you don't know what you're doing ** It will break the script **
        }
    },
    
}

Config.Consumables = {
    eat = {
        'big_piggy_burger',
        'danny_burger',
        'filthy_crim_burger',
        'french_fries',
        'heart_attack_burger',
        'vegetarian_burger'
    },
    eatFries = {
        'loaded_fries',
        'sweet_potato_fries',
    },
    drink = {
        'strawberry_milkshake',
        'chocolate_milkshake',
        'loaded_thickshake',
    }
}

Config.Debug = true -- For developers