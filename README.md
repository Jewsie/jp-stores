# jp-stores
jp-stores is a store script in itself meaning, if you wanna use jp-stores you gotta deactivate rsg-shops although it's not a requirement they don't go well hand in hand unless you modify different locations.

Dependencies;
RSG-Core
RSG-Inventory

**Modifications**
It's faily easy to modify the script, simply navigate to config.lua and start modifying it as you wish it.

```
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
}```

It's important to note how the configs look, cause any incosistency may break it, but aslong you follow the already written config files it should be fine. Name of the store can be anything you want it to be, it's just a label, the most important is the type of the store which will match together with products/storeitems, so aslong the storeitems has the same type as the store you want it to be in, it will automatically be assigned fx like this;

```
[1] = { 
        name = "weapon_melee_knife", -- Needs to match the name in items.lua
        price = 10, -- If you want it to be random you can do fx; math.random(10, 23), which will range the price between 10 and 23 
        amount = 50, -- How many is in stock or can be bought at 1 time.
        info = {}, -- Not too important, but often used for writing info for crafting stuff(Not useful in this script)
        type = "gunstore", -- Need to match the storelocations type, to be in the right store
        slot = 1, -- The order of which the item is in! Can't be 2 items with same type/category in the same slot!
    },```

It's also important you add [1] and a number, as that will bed assigned as the slot in the buymenu, if you don't add it, the script will have no clue in which order to place the items. Besides that it's faily easy

Need any support or help? Join the discord; https://discord.gg/JQMfXsf6h6
