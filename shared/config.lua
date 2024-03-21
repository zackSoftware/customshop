Config = {}

Config.Locations = {
    Blip = {
        name = 'Yum Yums',
        sprite = 870,
        location = vector3(-1560.0823, -456.8985, 35.7972)
    },
    Chopping = vector3(0, 0, 0),

    PreparingFries = vector3(-1562.0931, -455.5031, 35.7973),

    Cooking = vector3(0, 0, 0),

    Assembling = vector3(0, 0, 0),

    Fridge = vector3(0, 0, 0),

    Stash = vector3(0, 0, 0),
    
    jobLocations = {
        Duty = vector3(0, 0, 0),
        bossMenu = vector3(0, 0, 0),
        bossStash = vector3(0, 0, 0)
    }
}

Config.Recipes = {
    ["potatoes"] = {
        [1] = {
            Name = 'Potatoes',
            RequiredItems = {
                ["potato"] = 1,
            },
            Rewards = {
                'choppedpotato'
            }
        },
        [2]= {
            Name = 'Sweet Potatoes',
            RequiredItems = {
                ["sweetpotato"] = 1,
            },
            Rewards = {
                'choppedsweetpotato'
            }

        },
    },
    ["burgers"] = {
        big_piggy_burger = {
            Name = 'Big Piggy Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgermeatpatty_cooked"] = 1,
                ["bacon"] = 3,
                ["cheese"] = 1,
            }
        },
        heart_attack_burger= {
            Name = 'Heart Attack Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgermeatpatty_cooked"] = 3,
                ["cheese"] = 1,
            }
        },
        filthy_crim_burger= {
            Name = 'Filthy Crim Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgermeatpatty_cooked"] = 1,
                ["cheese"] = 1,
            }
        },
        danny_burger= {
            Name = 'Danny Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgermeatpatty_cooked"] = 1,
                ["cheese"] = 1,
            }
        },
        vegetarian_burger= {
            Name = 'Vegetarian Burger',
            RequiredItems = {
                ["burgerbuns"] = 1,
                ["burgervegetablepatty_raw"] = 1,
                ["mixedvegetables"] = 1,
            }
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
            }
        },
        [2]= {
            Name = 'French Fries',
            RequiredItems = {
                ["choppedpotato"] = 1,
            },
            Rewards = {
                'french_fries'
            }
        },
        [3]= {
            Name = 'Sweet Potato Fries',
            RequiredItems = {
                ["sweetpotato"] = 1,
            },
            Rewards = {
                'sweet_potato_fries'
            }
        },
    },
    ["milkshakes"] = {
        loaded_thickshake= {
            Name = 'Loaded Milkshake',
            RequiredItems = {
                ["chocolate"] = 1,
                ["milk"] = 1,
                ["icecream"] = 1,
                ["chocolatesyrup"] = 1,
            }
        },
        chocolate_milkshake= {
            Name = 'Chocolate Milkshake',
            RequiredItems = {
                ["chocolate"] = 1,
                ["milk"] = 1,
            }
        },
        strawberry_milkshake= {
            Name = 'Strawberry Milkshake',
            RequiredItems = {
                ["strawberries"] = 1,
                ["milk"] = 1,
            }
        }
    },
    
}