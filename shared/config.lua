Config = {}

Config.Locations = {
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
        RequiredItems = {
            ["burgerbuns"] = 1,
            ["burgermeatpatty_cooked"] = 1,
            ["bacon"] = 3,
            ["cheese"] = 1,
        }
    },
    heart_attack_burger= {
        RequiredItems = {
            ["burgerbuns"] = 1,
            ["burgermeatpatty_cooked"] = 3,
            ["cheese"] = 1,
        }
    },
    filthy_crim_burger= {
        RequiredItems = {
            ["burgerbuns"] = 1,
            ["burgermeatpatty_cooked"] = 1,
            ["cheese"] = 1,
        }
    },
    danny_burger= {
        RequiredItems = {
            ["burgerbuns"] = 1,
            ["burgermeatpatty_cooked"] = 1,
            ["cheese"] = 1,
        }
    },
    vegetarian_burger= {
        RequiredItems = {
            ["burgerbuns"] = 1,
            ["burgervegetablepatty_raw"] = 1,
            ["mixedvegetables"] = 1,
        }
    },
    loaded_fries= {
        RequiredItems = {
            ["choppedpotato"] = 1,
        }
    },
    french_fries= {
        RequiredItems = {
            ["choppedpotato"] = 1,
        }
    },
    sweet_potato_fries= {
        RequiredItems = {
            ["sweetpotato"] = 1,
        }
    },
    loaded_thickshake= {
        RequiredItems = {
            ["chocolate"] = 1,
            ["milk"] = 1,
            ["icecream"] = 1,
            ["chocolatesyrup"] = 1,
        }
    },
    chocolate_milkshake= {
        RequiredItems = {
            ["chocolate"] = 1,
            ["milk"] = 1,
        }
    },
    strawberry_milkshake= {
        RequiredItems = {
            ["strawberries"] = 1,
            ["milk"] = 1,
        }
    }
}