--[[  
    This configuration system defines items that act as containers or boxes holding other items inside them. 
    For example, a cigarette box item that, when opened, contains multiple individual cigarettes inside. This allows for 
    immersive gameplay where items can act as mini-inventories. Players can interact with these containers, and the contents 
    are managed through the inventory system.

    Each container (e.g., a box of cigarettes) has properties like maximum weight, number of slots, and predefined 
    contents. The configuration here enables you to customize the container's behavior, appearance, and its default items.
    
    How it works:
    - You define a "container" item (e.g., `cigarettebox`) with properties like weight, slots, and predefined items.
    - When the container is opened, the items inside become accessible to the player.
    - You can specify the default items that come pre-loaded inside the container, their properties, and interactions.

    This system adds depth and realism to gameplay, making it ideal for roleplay servers or scenarios requiring inventory 
    complexity.
]]

Config.Storage = {
	[1] = {
		['name'] = "cigarettebox",  -- The unique name/identifier of the container item.
		['label'] = "Cigarette Box",  -- The display name of the container in the inventory.
		['weight'] = 50,  -- The maximum weight that this container can hold. Set this lower than the container's weight to prevent self-nesting.
		['slots'] = 1,  -- The number of inventory slots available within the container. This limits how many different item types can fit.
		['items'] = {  -- Defines the default contents of the container when created or opened.
			[1] = {
				name = "cigarette",  -- The unique name/identifier of the item stored inside the container.
				label = "Cigarette",  -- The display name of the item in the inventory.
				description = "A single cigarette",  -- A brief description of the item.
				useable = true,  -- Whether the item can be used directly by the player.
				type = "item",  -- The type of object; usually "item".
				amount = 20,  -- The default quantity of this item inside the container.
				weight = 1,  -- The weight of each individual item.
				unique = false,  -- Determines if the item is unique (e.g., has metadata that makes it non-stackable).
				slot = 1,  -- The slot number inside the container where this item will be stored.
				info = {},  -- Additional metadata for the item, e.g., custom data or properties.
			},
                -- Add more items here.
		}
	},
    -- Add more storages here.
}
