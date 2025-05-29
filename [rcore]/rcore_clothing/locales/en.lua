Locales['en'] = {
    interact = {
        shop = 'Open clothing store',
        changing_room = 'Open changing room',
        job_changing_room = 'Open job changing room',
    },
    unset_item = 'Undress',
    face_features = {
        nose_width = 'Nose width',
        nose_peak_height = 'Nose peak height',
        nose_peak_lenght = 'Nose peak length',
        nose_bone_high = 'Nose bone high',
        nose_peak_lowering = 'Nose peak lowering',
        nose_bone_twist = 'Nose bone twist',
        eyebrow_height = 'Forehead size',
        eyebrow_forward = 'Forehead position',
        cheeks_bone_high = 'Cheeks bone high',
        cheeks_bone_width = 'Cheeks bone width',
        cheeks_width = 'Cheeks width',
        eyes_openning = 'Eyes openning',
        lips_thickness = 'Lips thickness',
        jaw_bone_width = 'Jaw bone width',
        jaw_bone_back_lenght = 'Jaw bone back length',
        chimp_bone_lowering = 'Chin bone lowering',
        chimp_bone_lenght = 'Chin bone length',
        chimp_bone_width = 'Chin bone width',
        chimp_hole = 'Chin hole',
        neck_thickness = 'Neck thickness'
    },
    charater_options = {
        pedselect = 'Ped selection',
        headblend = 'Inheritance',
        face_features = 'Face features',
        hair = 'Hair',
        blemish = 'Blemishes',
        beard = 'Beard',
        eyebrows = 'Eyebrows',
        age = 'Ageing',
        makeup = 'Make-up',
        blush = 'Blush',
        complexion = 'Complexion',
        sun = 'Sun damage',
        lipstick = 'Lipstick',
        moles = 'Moles and Freckles',
        chest = 'Chest hair',
        bodyb = 'Body blemish',
        eye_color = 'Eye color',
        head = 'Head',
    },
    head_option_items = {
        color = 'Color',
        secondary_color = 'Secondary color',
        highlight = 'Highlight',
        opacity = 'Opacity',
        style = 'Style',
        size = 'Size',
    },
    shop_structure = {
        first_level = {
            character = 'Character',
            outfits = 'Outfits',
            upper_body = 'Upper body',
            lower_body = 'Lower body',
            accessories = 'Accessories',
        },
        second_level = {
            masks = 'Masks',
            arms = 'Arms',
            gloves = 'Gloves',
            pants = 'Pants',
            shoes = 'Shoes',
            undershirt = 'Undershirt',
            vests = 'Vests',
            top_layer = 'Tops',
            hats = 'Hats',
            eyeglasses = 'Eyeglasses',
            earrings = 'Earrings',
            left_arm = 'Left arm',
            right_arm = 'Right arm',
            bags = 'Bags',
            decals = 'Decals',
            neck = 'Neckwear',
        },
        third_level = {
            balaclava = 'Balaclava',
            bandana = 'Bandana',
            full_face = 'Full face',
            horror = 'Horror',
            other = 'Other',
            dress_pants = 'Dress pants',
            shorts = 'Shorts',
            cargo = 'Cargo',
            skirt = 'Skirt',
            sweatpants = 'Sweatpants',
            jeans = 'Jeans',
            boots = 'Boots',
            dress_shoe = 'Dress shoe',
            sandals = 'Sandals',
            slippers = 'Slippers',
            sneakers = 'Sneakers',
            t_shirt = 'T-shirt',
            suit = 'Suit',
            jacket = 'Jacket',
            shirt = 'Shirt',
            hoodie = 'Hoodie',
            polo = 'Polo',
            vest = 'Vest',
            headphones = 'Headphones',
            helmet = 'Helmet',
            hat = 'Hat',
            cap = 'Cap',
            beanie = 'Beanie',
            beret = 'Beret',
            casual = 'Casual',
            aviator = 'Aviator',
            sports = 'Sports',
            hipster = 'Hipster',
            watch = 'Watch',
            bracelet = 'Bracelet',
            dress = 'Dress',
            middle = 'Middle',
            topshort = 'Top Short',
            fullnoshoulder = 'Full, no shoulder',
            middle_wide = 'Middle, wide',
            ['top-no-shoulder'] = 'Top, no shoulder',
            borders = 'Borders',
            nobelly = 'No belly',
            tie = 'Tie',
            necklace = 'Necklace',
            scarf = 'Scarf',
            bag = 'Bag',
            ['duffel-bag'] = 'Duffle bag',
            earring = 'Earring',
        }
    },
    outfits = {
        my_outfits = 'My outfits',
        job_outfits = 'Job outfits',
        shop_outfits = 'Shop outfits',
        default_outfit = 'Default outfit',
    },
    ui = {
        unset_item = 'Undress',
        currency_format = '${amount}',
        admin_mode = {
            title = 'Admin mode is active!',
            current_shop = 'Current shop',
            shop_title = "Admin mode",
            shop_description = "Admin mode is active, BE CAREFUL! You can now manage stock, edit metadata, create outfits for this shop and more.",
            stock_management = {
                title = 'Stock management',
                description = 'Is this shop missing some items? Use stock management to choose which items should be for sale here.',
                enable = 'Enable stock management',
                disable = 'Disable stock management',
                group_by_drawable = 'Group products by drawable',
                group_by_drawable_description = "You can also group products by model so you don't have to move each texture variant.",
                shop_title = "Stock manager",
                shop_description = "Browse the shop, hover over clothes and toggle if they should be sold in this shop. When you're done, simply disable the mode in admin panel.",
            },
            metadata_editor = {
                title = 'Metadata editor',
                outfit_title = 'Editing',
                create_outfit = 'Create new outfit',
                description = 'With this editor you can edit shop/job outfits and names, prices, colors, permissions and more for each product',
                enable = 'Enable edit meta data',
                disable = 'Disable edit meta data',
                dialog_title = 'Editing Metadata',
                group_by_drawable_warning = "Label, colors, and permissions can't be edited while in 'Group by drawable' mode.",
                inputs = {
                    outfit_name = {
                        label = 'Name',
                        placeholder = 'Police outfit'
                    },
                    label = {
                        label = 'Label',
                        placeholder = 'Pfister White Tee'
                    },
                    price = {
                        label = 'Price',
                        placeholder = '100'
                    },
                    colors = {
                        label = 'Colors'
                    },
                    category = {
                        label = 'Category'
                    },
                    blacklisted = {
                        label = 'Blacklisted'
                    },
                    resetImg = {
                        label = 'Reset image'
                    },
                },
                save = 'Save',
                create = 'Create'
            },
            arms_editor = {
                title = 'Arms editor',
                description = 'Some top layer clothing item has weird recommended arms? Use this editor to change it.',
                enable = 'Enable arm editing',
                disable = 'Disable arm editing',
                confirm = 'Confirm'
            },
            outfit_editor = {
                title = 'Outfit editor',
                description = 'Easily create outfits that can be bought only at this shop. Useful for job specific outfits and more.',
                enable = 'Enable outfit editor',
                disable = 'Disable outfit editor',
                explanation = "Browse the shop and click the (+) button on any product you want to add to your outfit. When you're ready, click 'Finish' and fill out additional info to save the outfit into this shop.",
                finish = 'Finish',
                cancel = 'Cancel',
                shop_title = 'Outfit editor',
                shop_description = 'Browse the shop, hover over clothes and add them to your outfit. When you\'re done, click Finish in admin panel.',
            },
            image_debug = {
                title = "Image debugger",
                description = "If you are having issues with product images, enable this mode to help debug them",
                enable = "Enable image debugger",
                disable = "Disable image debugger",
                invis_hint = "If your character isn't invisible, start rcore_clothing_for_photos and restart the game. Don't forget to disable it when you\'re done debugging.",
                blacklist_desc = 'Click "Blacklist" button to blacklist the currently previewed product.',
                blacklist_button = "Blacklist previewed",
                reset_desc = 'Click "Reset" button to reset data of the currently previewed product.',
                reset_button = "Reset previewed",
                camera_desc = "Switch between full body camera and processing camera.",
                camera_processing = "Processing cam",
                camera_fullbody = "Full body cam",
                blacklisted_notify = "Previewed product has been blacklisted.",
                reset_notify = "Previewed product data has been reset.",
            },
            previewed_item_id = 'Previewed item ID',
            previewed_item_hash = 'Previewed item hash',
        },
        control_panel = {
            admin_mode = 'Admin mode',
            save_outfit = 'Save outfit',
            id_only_mode = 'ID only mode'
        },
        camera_slider = {
            title = 'Camera controls',
            rotate = 'Drag left/right to rotate',
            height = 'Drag up/down to adjust height',
            zoom = 'Scroll to zoom',
            reset = 'Reset camera'
        },
        character = {
            save = 'Save',
            undo = 'Undo',
            skin_tone_title = 'Skin tone',
            skin_tone_description = 'Your character will inherit skin tone from their parents.',
            mom = 'Mom',
            dad = 'Dad',
            male = 'Male',
            female = 'Female',
            blend = 'Blend',
        },
        clothes_list = {
            no_items = 'No items here 😔',
            no_items_description = 'Looks like there are no clothes here. You can either create one or buy one from the shop.'
        },
        filters = {
            button = 'Filters',
            search_placeholder = 'Biker jacket..',
            search_button = 'Search',
            color = 'Color',
            clear_filters = 'Clear filters',
            only_addons = 'Show only addons',
            only_stock_in_shop_mgmt = 'Show only stock',
            stock_mgmt_filters = 'You can use filters below in the stock management mode to easily add and remove products.',
            not_in_any_shop = 'Show items not in any shop',
        },
        outfits = {
            no_outfits = 'No outfits here 😔',
            no_outfits_description = 'Looks like there are no outfits here. You can either create one or buy one from the shop.',
            save_outfit = 'Save outfit',
            save_outfit_placeholder = 'Outfit name',
            save_outfit_button = 'Save'
        },
        shop_description_placeholder = "Can't find what you're looking for? Different shops carry different clothing, so shop around the town to find your desired piece.",
        free = 'Free',
        shopping_cart = {
            title_cart = 'Shopping\ncart',
            title_free = 'Selected\nclothes',
            save_as_outfit = 'Save as outfit',
            save_as_outfit_placeholder = 'Outfit name',
            total = 'Total',
            payment_bank = 'Bank',
            payment_cash = 'Cash',
            confirm_and_close = 'Confirm and close',
            empty_title = 'Cart is empty!',
            empty_preview = 'preview',
            empty_add = 'add',
            empty_description = 'Browse the shop, click on products to {preview} them and if they fit well, {add} them to your shopping cart!',
            price = 'Price',
        },
        full_cart_dialog = {
            title = 'Wait, don\'t leave yet!',
            description = 'Those items in your shopping cart look amazing! Are you sure you want to leave without them?',
            continue_shopping = 'Continue shopping',
            leave = 'Leave'
        },
        press_to_exit = 'Press ESC to exit or',
        id_only_mode = {
            tooltip_active = 'You are in forced numbers mode because you either have a custom ped or selected component requires ID mode.',
            tooltip = 'When enabled you will be able to choose clothing the old way using IDs.',
            drawable = 'Drawable',
            texture = 'Texture',
            remove = 'Remove',
            remove_from_cart = 'Remove from cart',
            select = 'Select',
            add_to_cart = 'Add to cart',
            no_item_selected = 'No item selected',
            shop_title = "ID Only Mode",
            shop_description = "You are in ID only mode. Browse the shop, select a category and choose clothes the old way by their drawable and texture IDs.",
            blacklisted = 'This item is blacklisted from all shops.',
            not_in_shop = 'This item is not available in this shop.',
        },
        permissions = {
            title = 'Permissions',
            enabled = 'Permissions enabled',
            jobs = {
                title = 'Job permissions',
                select_job_title = 'Select jobs',
                select_grade_title = 'Select minimal grade',
                dialog_title = 'Choose a job',
                dialog_description = 'Choose a job and minimal grade that you want to be able to view this product. The grade you choose will be the minimal grade required to gain access.',
                grade_and_higher = "'{grade}' and higher",
                all_grades = 'All grades',
                add_job = 'Add job'
            },
            identifiers = {
                title = 'Identifier permissions'
            },
            inputs = {
                cancel = 'Cancel',
                add = 'Add'
            }
        },
        notifications = {
            warning = 'Warning',
            job_already_defined = 'This job is already defined.',
            outfit_created = 'Outfit created!',
            outfit_put_on = 'Outfit put on successfully',
            outfit_previewing = 'Previewing outfit',
            outfit_purchased = 'Outfit bought!',
            outfit_updated = 'Outfit updated!',
            changes_saved = 'Changes saved!',
            insufficient_funds = 'You do not have enough money',
            copied_to_clipboard = 'Copied to clipboard',
        },
        exceptions = {
            field_required = 'This field is required',
            size_set_to_zero = 'If size is set to 0, you will most likely not see changes in other settings.',
            style_set_to_first = 'First style (0 or -1) mostly serves as "nothing/no item", so you might not see anything on your body now.',
        }
    },
    char_creator = {
        slider_labels = {
            nose_width_min = "Narrow",
            nose_width_max = "Wide",
            nose_peak_height_min = "High",
            nose_peak_height_max = "Low",
            nose_peak_lenght_min = "Long",
            nose_peak_lenght_max = "Short",
            nose_bone_high_min = "High",
            nose_bone_high_max = "Low",
            nose_peak_lowering_min = "High",
            nose_peak_lowering_max = "Low",
            nose_bone_twist_min = "Left",
            nose_bone_twist_max = "Right",
            eyebrow_height_min = "Small",
            eyebrow_height_max = "Big",
            eyebrow_forward_min = "Back",
            eyebrow_forward_max = "Front",
            cheeks_bone_high_min = "High",
            cheeks_bone_high_max = "Low",
            cheeks_bone_width_min = "Narrow",
            cheeks_bone_width_max = "Wide",
            cheeks_width_min = "Wide",
            cheeks_width_max = "Narrow",
            jaw_bone_width_min = "Narrow",
            jaw_bone_width_max = "Wide",
            jaw_bone_back_lenght_min = "Short",
            jaw_bone_back_lenght_max = "Long",
            chimp_bone_lowering_min = "High",
            chimp_bone_lowering_max = "Low",
            chimp_bone_lenght_min = "Short",
            chimp_bone_lenght_max = "Long",
            chimp_bone_width_min = "Narrow",
            chimp_bone_width_max = "Wide",
            chimp_hole_min = "None",
            chimp_hole_max = "Full",
            eyes_openning_min = "Open",
            eyes_openning_max = "Closed",
            lips_thickness_min = "Thick",
            lips_thickness_max = "Thin",
            neck_thickness_min = "Thin",
            neck_thickness_max = "Thick"
        },
        ped_select = {
            description = 'Choose the ped you like below. It\'s recommended to use the `mp_X_freemode` peds as they offer the most customization options (character features, clothes, accessories..).',
        },
        headblend = {
            description = 'To choose your character\'s face, pick your parents\' faces first.',
            description2 = 'Use the sliders to decide how much of each parent\'s face you inherit.'
        },
        hair = {
            description = "Choose a hairstyle that will make you look like a million bucks, or just a million bucks worth of hair gel.",
        },
        face_features = {
            nose = {
                title = "Nose",
                description = "Give your character a nose that stands out, whether it's a dainty button or a proud beak that commands attention."
            },
            eyebrows = {
                title = "Forehead",
                description = "Slide it to the right for the 'I just discovered fire' look, or keep it left to look like you're always surprised."
            },
            cheeks = {
                title = "Cheeks",
                description = "Whether you want to resemble a greek god or look like you've been eating too much pizza, the choice is yours."
            },
            jaw = {
                title = "Jaw",
                description = "A jawline that can cut glass or one that exudes gentle warmth, the choice is yours."
            },
            other = {
                title = "Other",
                description = "And lastly, the finishing touches - Give it your all, though let's be honest, you're already beautiful."
            }
        },
        blemish = {
            description = "Introduce blemishes to make your character look like they've had a few adventures or a just a bad diet."
        },
        beard = {
            description = "Slap on a beard to turn your character from clean-shaven to 'ready for a lumberjack competition' in seconds."
        },
        eyebrows = {
            description = "Customize your eyebrows to tell their own story, from 'I'm totally serious' to 'I might have just seen a ghost'.",
        },
        age = {
            description = "Adjust the slider to change your character's aging, anywhere from a beauty vlogger to a person yelling at clouds."
        },
        makeup = {
            description = "Add some make-up to your face and pretend that it helps somehow. Or put on a full size painting to look like you just came from a kids party."
        },
        blush = {
            description = "Ideal for when you need to look like you've just been caught talking about your crush."
        },
        complexion = {
            description = "Who doesn't enjoy the look of 'I am allergic to everything' permanently on their face, or just 'I don't know how to use sunscreen'?"
        },
        sun = {
            description = "Pro tip: Some sun damage to your face will make it look like you've been outside once or twice."
        },
        lipstick = {
            description = "Make your lips pop with a splash of color so everyone knows you're here to cause chaos, but still look fabulous."
        },
        moles = {
            description = "Well you've tried your best to be good looking and it didn't really work, so just slap that beauty mark on and call it a day."
        },
        chest = {
            description = "All your life you wanted to be something more and now you've got a chance! Add some chest hair and be the one people mistake for a yeti."
        },
        bodyb = {
            description = "The beach body is ready, tomorrow is your day to shine.. Would be a real shame if some blemishes popped up on your back, wouldn't it?"
        },
        eye_color = {
            description = "Go classic with warm brown, rare green, or maybe a piercing blue.. maybe go a bit crazy with pink.. or just go full demon - the choice is yours."
        }
    },
    clear_ped = "Your ped is cleared from props.",
}
