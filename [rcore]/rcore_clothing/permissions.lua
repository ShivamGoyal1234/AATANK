PermissionMap = {
    ['group.admin'] = {
        Permissions.ADMIN_STOCK_MANAGEMENT,
        Permissions.ADMIN_EDIT_METADATA,
        Permissions.ADMIN_EDIT_ARMS,
        Permissions.ADMIN_OUTFIT_EDITOR,
        Permissions.USE_ADMIN_MODE,
        Permissions.ADMIN_IMAGE_DEBUG,
      --  "command." .. Config.Commands.ReloadSkin,
    },
    ['builtin.everyone'] = {
        Permissions.TOGGLE_ID_ONLY_MODE,
        "command." .. Config.Commands.ClearPed,
        "command." .. Config.Commands.Skin,

    },
}
