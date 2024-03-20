Config = {}

Config.Locations = {
    Blip = {
        name = 'Yum Yums',
        location = vector3(0, 0, 0)
    },
    Chopping = vector3(0, 0, 0),

    PreparingFries = vector3(0, 0, 0),

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
    loaded_fries= {
        Name = 'Loaded Fries',
        RequiredItems = {
            ["choppedpotato"] = 1,
        }
    },
    french_fries= {
        Name = 'French Fries',
        RequiredItems = {
            ["choppedpotato"] = 1,
        }
    },
    sweet_potato_fries= {
        Name = 'Sweet Potato Fries',
        RequiredItems = {
            ["sweetpotato"] = 1,
        }
    },
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
}