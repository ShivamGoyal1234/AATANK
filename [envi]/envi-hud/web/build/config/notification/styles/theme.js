import { B as BaseNotificationIcons } from './base.js';
import { N as NotificationThemes } from '../themes.js';

const BaseThemeStyles = {
  [NotificationThemes.LIGHT]: {
    "default": {
      background: "#FFFFFF",
      messageColor: "#374151",
      borderColor: "#E5E7EB"
    },
    "success": {
      background: "#ECFDF5",
      titleColor: "#047857",
      messageColor: "#059669",
      iconBackground: "#10B981",
      borderColor: "#A7F3D0",
      closeButtonColor: "#10B981"
    },
    "error": {
      background: "#FEF2F2",
      titleColor: "#B91C1C",
      messageColor: "#DC2626",
      iconBackground: "#EF4444",
      borderColor: "#FECACA",
      closeButtonColor: "#EF4444"
    },
    "warning": {
      background: "#FFFBEB",
      titleColor: "#B45309",
      messageColor: "#D97706",
      iconBackground: "#F59E0B",
      borderColor: "#FDE68A",
      closeButtonColor: "#F59E0B"
    },
    "info": {
      background: "#EFF6FF",
      titleColor: "#1D4ED8",
      messageColor: "#2563EB",
      iconBackground: "#3B82F6",
      borderColor: "#BFDBFE",
      closeButtonColor: "#3B82F6"
    }
  },
  [NotificationThemes.DARK]: {
    base: {
      background: "#1F2937",
      titleColor: "#FFFFFF",
      messageColor: "#E5E7EB",
      borderColor: "#374151",
      shadow: "#4B5563",
      closeButtonColor: "#9CA3AF"
    }
  }
};
const NotificationThemeStyles = {
  [NotificationThemes.LIGHT]: {
    "default": BaseThemeStyles.light.default,
    "success": {
      icon: BaseNotificationIcons.success,
      iconColor: "#FFFFFF",
      ...BaseThemeStyles.light.success
    },
    "error": {
      icon: BaseNotificationIcons.error,
      iconColor: "#FFFFFF",
      ...BaseThemeStyles.light.error
    },
    "warning": {
      icon: BaseNotificationIcons.warning,
      iconColor: "#FFFFFF",
      ...BaseThemeStyles.light.warning
    },
    "info": {
      icon: BaseNotificationIcons.info,
      iconColor: "#FFFFFF",
      ...BaseThemeStyles.light.info
    }
  },
  [NotificationThemes.DARK]: {
    "default": BaseThemeStyles.dark.base,
    "success": {
      icon: BaseNotificationIcons.success,
      iconColor: "#FFFFFF",
      ...BaseThemeStyles.dark.base,
      iconBackground: "#10B981"
    },
    "error": {
      icon: BaseNotificationIcons.error,
      iconColor: "#FFFFFF",
      ...BaseThemeStyles.dark.base,
      iconBackground: "#EF4444"
    },
    "warning": {
      icon: BaseNotificationIcons.warning,
      iconColor: "#FFFFFF",
      ...BaseThemeStyles.dark.base,
      iconBackground: "#F59E0B"
    },
    "info": {
      icon: BaseNotificationIcons.info,
      iconColor: "#FFFFFF",
      ...BaseThemeStyles.dark.base,
      iconBackground: "#3B82F6"
    }
  },
  [NotificationThemes.ENVI]: {
    "default": {
      background: "#1a1b2e",
      titleColor: "#FFFFFF",
      messageColor: "#E5E7EB",
      borderColor: "#2f2e82",
      shadow: "0 0 15px rgba(47,46,130,0.4)"
    },
    "success": {
      icon: BaseNotificationIcons.success,
      iconColor: "#FFFFFF",
      background: "#1a1b2e",
      titleColor: "#FFFFFF",
      messageColor: "#E5E7EB",
      iconBackground: "#2f2e82",
      borderColor: "#2f2e82",
      closeButtonColor: "#c2c1d4",
      shadow: "0 0 15px rgba(47,46,130,0.4)"
    },
    "error": {
      icon: BaseNotificationIcons.error,
      iconColor: "#FFFFFF",
      background: "#1a1b2e",
      titleColor: "#FFFFFF",
      messageColor: "#E5E7EB",
      iconBackground: "#2f2e82",
      borderColor: "#2f2e82",
      closeButtonColor: "#c2c1d4",
      shadow: "0 0 15px rgba(47,46,130,0.4)"
    },
    "warning": {
      icon: BaseNotificationIcons.warning,
      iconColor: "#FFFFFF",
      background: "#1a1b2e",
      titleColor: "#FFFFFF",
      messageColor: "#E5E7EB",
      iconBackground: "#2f2e82",
      borderColor: "#2f2e82",
      closeButtonColor: "#c2c1d4",
      shadow: "0 0 15px rgba(47,46,130,0.4)"
    },
    "info": {
      icon: BaseNotificationIcons.info,
      iconColor: "#FFFFFF",
      background: "#1a1b2e",
      titleColor: "#FFFFFF",
      messageColor: "#E5E7EB",
      iconBackground: "#2f2e82",
      borderColor: "#2f2e82",
      closeButtonColor: "#c2c1d4",
      shadow: "0 0 15px rgba(47,46,130,0.4)"
    }
  },
  [NotificationThemes.MIDNIGHT]: {
    "default": {
      background: "#1A1412",
      titleColor: "#d3d3d3",
      messageColor: "#d3d3d3",
      borderColor: "#0A0908"
    },
    "success": {
      icon: BaseNotificationIcons.success,
      iconColor: "#FFFFFF",
      background: "#1A1412",
      titleColor: "#4ba95a",
      messageColor: "#d3d3d3",
      iconBackground: "#2b6337",
      borderColor: "#0A0908",
      closeButtonColor: "#d3d3d3"
    },
    "error": {
      icon: BaseNotificationIcons.error,
      iconColor: "#FFFFFF",
      background: "#1A1412",
      titleColor: "#8B0000",
      messageColor: "#d3d3d3",
      iconBackground: "#7b0c0c",
      borderColor: "#0A0908",
      closeButtonColor: "#d3d3d3"
    },
    "warning": {
      icon: BaseNotificationIcons.warning,
      iconColor: "#FFFFFF",
      background: "#1A1412",
      titleColor: "#8B4513",
      messageColor: "#d3d3d3",
      iconBackground: "#83470b",
      borderColor: "#0A0908",
      closeButtonColor: "#d3d3d3"
    },
    "info": {
      icon: BaseNotificationIcons.info,
      iconColor: "#FFFFFF",
      background: "#1A1412",
      titleColor: "#4A6670",
      messageColor: "#d3d3d3",
      iconBackground: "#46626b",
      borderColor: "#0A0908",
      closeButtonColor: "#d3d3d3"
    }
  },
  [NotificationThemes.CYBERPUNK]: {
    "default": {
      background: "#0D0221",
      titleColor: "#FF2A6D",
      messageColor: "#D1F7FF",
      borderColor: "#FF2A6D",
      closeButtonColor: "#05D9E8"
    },
    "success": {
      icon: BaseNotificationIcons.success,
      iconColor: "#FFFFFF",
      background: "#0D0221",
      titleColor: "#05D9E8",
      messageColor: "#D1F7FF",
      iconBackground: "#01C38D",
      borderColor: "#05D9E8",
      closeButtonColor: "#05D9E8"
    },
    "error": {
      icon: BaseNotificationIcons.error,
      iconColor: "#FFFFFF",
      background: "#0D0221",
      titleColor: "#FF2A6D",
      messageColor: "#D1F7FF",
      iconBackground: "#FF2A6D",
      borderColor: "#FF2A6D",
      closeButtonColor: "#FF2A6D"
    },
    "warning": {
      icon: BaseNotificationIcons.warning,
      iconColor: "#FFFFFF",
      background: "#0D0221",
      titleColor: "#FFB86C",
      messageColor: "#D1F7FF",
      iconBackground: "#FFB86C",
      borderColor: "#FFB86C",
      closeButtonColor: "#FFB86C"
    },
    "info": {
      icon: BaseNotificationIcons.info,
      iconColor: "#FFFFFF",
      background: "#0D0221",
      titleColor: "#BD00FF",
      messageColor: "#D1F7FF",
      iconBackground: "#BD00FF",
      borderColor: "#BD00FF",
      closeButtonColor: "#BD00FF"
    }
  },
  [NotificationThemes.CYBERPUNK_2]: {
    "default": {
      backgroundUrl: "nui://envi-hud/web/build/images/cyberpunk-default.png",
      titleColor: "#FFFFFF",
      messageColor: "#FFFFFF",
      closeButtonColor: "#FFFFFF"
    },
    "success": {
      icon: "nui://envi-hud/web/build/images/success2.png",
      backgroundUrl: "nui://envi-hud/web/build/images/cyberpunk-success.png",
      titleColor: "#FFFFFF",
      messageColor: "#FFFFFF",
      closeButtonColor: "#FFFFFF"
    },
    "error": {
      icon: "nui://envi-hud/web/build/images/caution.png",
      backgroundUrl: "nui://envi-hud/web/build/images/cyberpunk-error.png",
      titleColor: "#FFFFFF",
      messageColor: "#FFFFFF",
      closeButtonColor: "#FFFFFF"
    },
    "warning": {
      icon: "nui://envi-hud/web/build/images/warning2.png",
      backgroundUrl: "nui://envi-hud/web/build/images/cyberpunk-warning.png",
      titleColor: "#FFFFFF",
      messageColor: "#FFFFFF",
      closeButtonColor: "#FFFFFF"
    },
    "info": {
      icon: "nui://envi-hud/web/build/images/info2.png",
      backgroundUrl: "nui://envi-hud/web/build/images/cyberpunk-info.png",
      titleColor: "#FFFFFF",
      messageColor: "#FFFFFF",
      closeButtonColor: "#FFFFFF"
    }
  },
  [NotificationThemes.CLEAN_SIMPLE]: {
    "default": {
      background: "#FFFFFF",
      titleColor: "#1F2937",
      messageColor: "#4B5563",
      borderColor: "#F3F4F6",
      shadow: "0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)"
    },
    "success": {
      icon: "nui://envi-hud/web/build/images/success.png",
      background: "#FFFFFF",
      titleColor: "#047857",
      messageColor: "#4B5563",
      iconBackground: "#CCFFD8",
      borderColor: "#DCFCE7",
      shadow: "0 10px 15px -3px rgba(220, 252, 231, 0.5), 0 4px 6px -4px rgba(220, 252, 231, 0.5)",
      closeButtonColor: "#FFFFFF",
      closeButtonBackground: "#6B728059"
    },
    "error": {
      icon: "nui://envi-hud/web/build/images/error.png",
      background: "#FFFFFF",
      titleColor: "#B91C1C",
      messageColor: "#4B5563",
      iconBackground: "#FFCBCB",
      borderColor: "#FEE2E2",
      shadow: "0 10px 15px -3px rgba(254, 226, 226, 0.5), 0 4px 6px -4px rgba(254, 226, 226, 0.5)",
      closeButtonColor: "#FFFFFF",
      closeButtonBackground: "#6B728059"
    },
    "warning": {
      icon: "nui://envi-hud/web/build/images/warning.png",
      background: "#FFFFFF",
      titleColor: "#B45309",
      messageColor: "#4B5563",
      iconBackground: "#FEFFCB",
      borderColor: "#FEF3C7",
      shadow: "0 10px 15px -3px rgba(254, 243, 199, 0.5), 0 4px 6px -4px rgba(254, 243, 199, 0.5)",
      closeButtonColor: "#FFFFFF",
      closeButtonBackground: "#6B728059"
    },
    "info": {
      icon: "nui://envi-hud/web/build/images/info.png",
      background: "#FFFFFF",
      titleColor: "#1D4ED8",
      messageColor: "#4B5563",
      iconBackground: "#CBEBFF",
      borderColor: "#DBEAFE",
      shadow: "0 10px 15px -3px rgba(219, 234, 254, 0.5), 0 4px 6px -4px rgba(219, 234, 254, 0.5)",
      closeButtonColor: "#FFFFFF",
      closeButtonBackground: "#6B728059"
    }
  },
  [NotificationThemes.RETRO]: {
    "default": {
      icon: "mdi:information",
      // iconColor: '#FFFFFF',
      background: "#F5F3DC",
      headerBackground: "#FCDD80",
      titleColor: "#2C2C2C",
      messageColor: "#2C2C2C",
      borderColor: "#FFFFFF",
      shadow: "3px 3px 0px #808080"
    },
    "success": {
      icon: "mdi:check-circle",
      // iconColor: '#FFFFFF',
      background: "#F5F3DC",
      headerBackground: "#C2FF9D",
      titleColor: "#2C2C2C",
      messageColor: "#2C2C2C",
      borderColor: "#FFFFFF",
      shadow: "3px 3px 0px #808080"
    },
    "error": {
      icon: "mdi:close-circle",
      // iconColor: '#FFFFFF',
      background: "#F5F3DC",
      headerBackground: "#FF9494",
      titleColor: "#2C2C2C",
      messageColor: "#2C2C2C",
      borderColor: "#FFFFFF",
      shadow: "3px 3px 0px #808080"
    },
    "warning": {
      icon: "mdi:alert",
      // iconColor: '#FFFFFF',
      background: "#F5F3DC",
      headerBackground: "#FFD966",
      titleColor: "#2C2C2C",
      messageColor: "#2C2C2C",
      borderColor: "#FFFFFF",
      shadow: "3px 3px 0px #808080"
    },
    "info": {
      icon: "mdi:information",
      // iconColor: '#FFFFFF',
      background: "#F5F3DC",
      // Blue header background
      headerBackground: "#CBEBFF",
      titleColor: "#2C2C2C",
      messageColor: "#2C2C2C",
      borderColor: "#FFFFFF",
      shadow: "3px 3px 0px #808080"
    }
  }
};

export { NotificationThemeStyles as N };
