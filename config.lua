CONFIG = {}

CONFIG.RobberyAmount = math.random(25, 150) -- How much player will get from robbing the store
CONFIG.MoneyType = 'cash' -- What kind of money you want the player to get Defaults is; cash, bank, bloodmoney

CONFIG.StoreLocations = {
    {
        name = 'Valentine Gunstore', -- Just the store name! Can be anything!
        type = 'gunstore', -- Need to match with the type for the storeitems, besides that, can be anything!
        shopcoords = vector3(-280.4532, 778.91619, 119.50395-1.0), -- The location the Ped will be placed.
        heading = 2.0396592, -- Which way the NPC/Ped will be facing.
        showblip = true, -- Whether blip should be visible or not.
        blipscale = 0.2, -- How big you want the blip to be.
        blipsprite = 4149098929, -- Blip sprite you want the store to have
        model = 'U_M_M_BwmStablehand_01' -- The PED Model you want the store to be
    },
}

CONFIG.StoreItems = {
    [1] = { 
        name = "weapon_melee_knife", -- Needs to match the name in items.lua
        price = 10, -- If you want it to be random you can do fx; math.random(10, 23), which will range the price between 10 and 23 
        amount = 50, -- How many is in stock or can be bought at 1 time.
        info = {}, -- Not too important, but often used for writing info for crafting stuff(Not useful in this script)
        type = "gunstore", -- Need to match the storelocations type, to be in the right store
        slot = 1, -- The order of which the item is in! Can't be 2 items with same type/category in the same slot!
    },
    [2] = { 
        name = "weapon_lasso",   
        price = 15,    
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 2, 
    },
    [3] = { 
        name = "weapon_bow",   
        price = 10,    
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 3, 
    },
    [4] = { 
        name = "weapon_revolver_cattleman",   
        price = 35,    
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 4, 
    },
    [5] = { 
        name = "weapon_revolver_lemat", 
        price = 75,   
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 5, 
    },
    [6] = { 
        name = "weapon_shotgun_sawedoff", 
        price = 165,   
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 6, 
    },
    [7] = { 
        name = "weapon_shotgun_doublebarrel", 
        price = 250,   
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 7, 
    },
    [8] = { 
        name = "weapon_repeater_henry", 
        price = 100,   
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 8, 
    },
    [9] = { 
        name = "ammo_revolver", 
        price = 4,   
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 9, 
    },
    [10] = { 
        name = "ammo_shotgun", 
        price = 8,   
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 10, 
    },
    [11] = { 
        name = "ammo_repeater", 
        price = 10,   
        amount = 50,  
        info = {}, 
        type = "gunstore", 
        slot = 11, 
    },
    [12] = { 
        name = "ammo_arrow", 
        price = 2,   
        amount = 100,  
        info = {}, 
        type = "gunstore", 
        slot = 12, 
    },
    --- You can go back to [1] when it's another category of items
    -- Just as long they are not under the same type.
}