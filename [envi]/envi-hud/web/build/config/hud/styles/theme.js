import { H as HudThemes, S as SpeedometerThemes } from '../themes.js';

const AccountStyles = {
  [HudThemes.LIGHT]: {
    icon: {
      background: "#ffffff",
      color: "#000000"
    },
    text: "#ffffff",
    value: "#e2e8f0"
  },
  [HudThemes.DARK]: {
    icon: {
      background: "#1F293733",
      border: "#374151"
    },
    text: "#FFFFFF",
    value: "#E5E7EB"
  },
  [HudThemes.ENVI]: {
    icon: {
      background: "#1a1b2e33",
      border: "#8B0000"
    },
    text: "#FFFFFF",
    value: "#E5E7EB"
  },
  [HudThemes.MIDNIGHT]: {
    icon: {
      background: "#1A141233",
      border: "#0A0908"
    },
    text: "#d3d3d3",
    value: "#d3d3d3"
  },
  [HudThemes.CYBERPUNK]: {
    icon: {
      background: "#0D022133",
      border: "#FF2A6D"
    },
    text: "#D1F7FF",
    value: "#05D9E8"
  },
  [HudThemes.CYBERPUNK_2]: {
    icon: "",
    text: "#ECECEC",
    value: "#ECECEC"
  },
  [HudThemes.RETRO]: {
    icon: {
      background: "#F5F3DC33",
      border: "#808080"
    },
    text: "#ffffff",
    value: "#ffffff"
  },
  [HudThemes.CLEAN_SIMPLE]: {
    icon: {
      background: "#ffffff33",
      border: "#ffffff"
    },
    text: "#ffffff",
    value: "#e0e0e0"
  },
  [HudThemes.PIXEL]: {
    icon: "",
    text: "",
    value: ""
  }
};
const LocationStyles = {
  [HudThemes.LIGHT]: {
    text: "#ffffff",
    subText: "#e2e8f0",
    divider: "#ffffff"
  },
  [HudThemes.DARK]: {
    text: "#FFFFFF",
    subText: "#E5E7EB",
    divider: "#374151"
  },
  [HudThemes.ENVI]: {
    text: "#FFFFFF",
    subText: "#E5E7EB",
    divider: "#ffffff"
  },
  [HudThemes.MIDNIGHT]: {
    text: "#d3d3d3",
    subText: "#d3d3d3",
    divider: "#0A0908"
  },
  [HudThemes.CYBERPUNK]: {
    text: "#D1F7FF",
    subText: "#05D9E8",
    divider: "#FF2A6D"
  },
  [HudThemes.CYBERPUNK_2]: {
    text: "#ECECEC",
    subText: "#ECECEC",
    divider: ""
  },
  [HudThemes.RETRO]: {
    text: "#FFFFFF",
    subText: "#FFFFFF",
    divider: "#FFFFFF"
  },
  [HudThemes.CLEAN_SIMPLE]: {
    text: "#ffffff",
    subText: "#e0e0e0",
    divider: "#ffffff"
  },
  [HudThemes.PIXEL]: {
    text: "#FFFDE9",
    subText: "#FFFDE9",
    divider: "#FFFDE9"
  }
};
const PlayerStatusStyles = {
  [HudThemes.LIGHT]: {
    background: "#ffffff",
    icon: "#000000",
    progress: "#000000",
    health: "#ef4444",
    armor: "#3b82f6",
    hunger: "#f97316",
    thirst: "#0ea5e9",
    stress: "#8b5cf6",
    stamina: "#22c55e",
    oxygen: "#0ea5e9"
  },
  [HudThemes.DARK]: {
    background: "#1F293733",
    icon: "#FFFFFF",
    progress: "#374151"
  },
  [HudThemes.ENVI]: {
    background: "#8B0000",
    icon: "#FFFFFF",
    progress: "#8B0000"
  },
  [HudThemes.MIDNIGHT]: {
    background: "#1A141233",
    icon: "#d3d3d3",
    progress: "#0A0908"
  },
  [HudThemes.CYBERPUNK]: {
    background: "#0D022133",
    icon: "#D1F7FF",
    progress: "#FF2A6D"
  },
  [HudThemes.CYBERPUNK_2]: {
    background: "#ececec4d",
    icon: "",
    voice: {
      layer1: "#FFFFFF",
      layer2: "#000000"
    },
    progress: "#FFFFFF"
  },
  [HudThemes.RETRO]: {
    background: "#000000",
    icon: "",
    voice: {
      layer1: "#FFFFFF",
      layer2: "#000000"
    },
    progress: "#FF9494"
  },
  [HudThemes.CLEAN_SIMPLE]: {
    background: "#ffffff33",
    icon: "#ffffff",
    progress: "#ffffff"
  },
  [HudThemes.PIXEL]: {
    background: "",
    icon: "",
    progress: ""
  }
};
const ServerInfoStyles = {
  [HudThemes.LIGHT]: {
    text: "#ffffff",
    subText: "#e2e8f0",
    icon: {
      text: "#000000",
      background: "#ffffff"
    },
    divider: "#ffffff"
  },
  [HudThemes.DARK]: {
    text: "#FFFFFF",
    subText: "#E5E7EB",
    icon: {
      background: "#1F293733",
      border: "#374151"
    },
    divider: "#374151"
  },
  [HudThemes.ENVI]: {
    text: "#FFFFFF",
    subText: "#E5E7EB",
    icon: {
      background: "#1a1b2e33",
      border: "#8B0000"
    },
    divider: "#ffffff"
  },
  [HudThemes.MIDNIGHT]: {
    text: "#d3d3d3",
    subText: "#d3d3d3",
    icon: {
      background: "#1A141233",
      border: "#0A0908"
    },
    divider: "#0A0908"
  },
  [HudThemes.CYBERPUNK]: {
    text: "#D1F7FF",
    subText: "#05D9E8",
    icon: {
      background: "#0D022133",
      border: "#FF2A6D"
    },
    divider: "#FF2A6D"
  },
  [HudThemes.CYBERPUNK_2]: {
    text: "#ECECEC",
    subText: "#ECECEC",
    icon: "",
    divider: ""
  },
  [HudThemes.RETRO]: {
    text: "#ffffff",
    subText: "#ffffff",
    icon: "#ffffff",
    divider: "#ffffff"
  },
  [HudThemes.CLEAN_SIMPLE]: {
    text: "#ffffff",
    subText: "#e0e0e0",
    icon: {
      background: "#ffffff33",
      border: "#ffffff"
    },
    divider: "#ffffff"
  },
  [HudThemes.PIXEL]: {
    text: "#FFFDE9",
    subText: "#FFFDE9",
    icon: "#FFFDE9",
    divider: "#FFFDE9"
  }
};
const WeaponStyles = {
  [HudThemes.LIGHT]: {
    text: "#e2e8f0",
    value: "#ffffff",
    subValue: "#e2e8f0",
    divider: "#ffffff"
  },
  [HudThemes.DARK]: {
    text: "#E5E7EB",
    value: "#FFFFFF",
    subValue: "#E5E7EB",
    divider: "#374151"
  },
  [HudThemes.ENVI]: {
    text: "#E5E7EB",
    value: "#FFFFFF",
    subValue: "#E5E7EB",
    divider: "#8B0000"
  },
  [HudThemes.MIDNIGHT]: {
    text: "#d3d3d3",
    value: "#d3d3d3",
    subValue: "#d3d3d3",
    divider: "#0A0908"
  },
  [HudThemes.CYBERPUNK]: {
    text: "#05D9E8",
    value: "#D1F7FF",
    subValue: "#05D9E8",
    divider: "#FF2A6D"
  },
  [HudThemes.CYBERPUNK_2]: {
    text: "#ECECEC",
    value: "#ECECEC",
    subValue: "#cfcfcf",
    divider: "#FFFFFF"
  },
  [HudThemes.RETRO]: {
    text: "#FFFFFF",
    value: "#FFFFFF",
    subValue: "#e0e0e0",
    divider: "#FFFFFF"
  },
  [HudThemes.CLEAN_SIMPLE]: {
    text: "#e0e0e0",
    value: "#ffffff",
    subValue: "#e0e0e0",
    divider: "#ffffff"
  },
  [HudThemes.PIXEL]: {
    text: "#ffffff",
    value: "#ffffff",
    subValue: "#e0e0e0",
    divider: "#ffffff"
  }
};
const VehicleStyles = {
  [HudThemes.LIGHT]: {
    text: "#000000",
    subText: "#e2e8f0",
    textPrimary: "#ffffff",
    textSecondary: "#e2e8f080",
    textMuted: "#e2e8f066",
    icon: "#000000",
    background: "#ffffff",
    border: {
      style: "none",
      color: ""
    },
    nosProgress: "#000000",
    progressTrack: "#ffffff33",
    air: {
      airProgressTrack: "#b9b9b9c4",
      airProgressBar: "#000"
    },
    progressBar: "#ffffff",
    speedometerTrack: "#ffffff33",
    speedometerNeedle: "#ffffff",
    speedometerTick: "#ffffff",
    rpmTrack: "#ffffff33",
    rpmProgress: "#ffffff",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [HudThemes.DARK]: {
    text: "#FFFFFF",
    subText: "#E5E7EB",
    textPrimary: "#FFFFFF",
    textSecondary: "#E5E7EB",
    textMuted: "#9CA3AF",
    icon: "#FFFFFF",
    background: "#1F293733",
    border: {
      style: "solid",
      color: "#374151"
    },
    nosProgress: "#374151",
    progressTrack: "#37415133",
    progressBar: "#FFFFFF",
    air: {
      airProgressTrack: "#37415133",
      airProgressBar: "#FFFFFF"
    },
    speedometerTrack: "#37415133",
    speedometerNeedle: "#FFFFFF",
    speedometerTick: "#FFFFFF",
    rpmTrack: "#37415133",
    rpmProgress: "#FFFFFF",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [HudThemes.ENVI]: {
    text: "#FFFFFF",
    subText: "#E5E7EB",
    textPrimary: "#FFFFFF",
    textSecondary: "#E5E7EB",
    textMuted: "#c2c1d4",
    icon: "#FFFFFF",
    background: "#1a1b2e33",
    border: {
      style: "solid",
      color: "#8B0000"
    },
    nosProgress: "#8B0000",
    progressTrack: "#ffffff33",
    progressBar: "#FFFFFF",
    air: {
      airProgressTrack: "#8B000033",
      airProgressBar: "#FFFFFF"
    },
    speedometerTrack: "#ffffff33",
    speedometerNeedle: "#FFFFFF",
    speedometerTick: "#FFFFFF",
    rpmTrack: "#ffffff33",
    rpmProgress: "#FFFFFF",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [HudThemes.MIDNIGHT]: {
    text: "#d3d3d3",
    subText: "#d3d3d3",
    textPrimary: "#d3d3d3",
    textSecondary: "#d3d3d3",
    textMuted: "#d3d3d3",
    icon: "#d3d3d3",
    background: "#1A141233",
    border: {
      style: "solid",
      color: "#0A0908"
    },
    nosProgress: "#0A0908",
    progressTrack: "#0A090833",
    progressBar: "#d3d3d3",
    air: {
      airProgressTrack: "#0A090833",
      airProgressBar: "#d3d3d3"
    },
    speedometerTrack: "#0A090833",
    speedometerNeedle: "#d3d3d3",
    speedometerTick: "#d3d3d3",
    rpmTrack: "#0A090833",
    rpmProgress: "#d3d3d3",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [HudThemes.CYBERPUNK]: {
    text: "#D1F7FF",
    subText: "#05D9E8",
    textPrimary: "#D1F7FF",
    textSecondary: "#05D9E8",
    textMuted: "#FF2A6D",
    icon: "#D1F7FF",
    background: "#0D022133",
    border: {
      style: "solid",
      color: "#FF2A6D"
    },
    nosProgress: "#FF2A6D",
    progressTrack: "#FF2A6D33",
    progressBar: "#D1F7FF",
    air: {
      airProgressTrack: "#FF2A6D33",
      airProgressBar: "#D1F7FF"
    },
    speedometerTrack: "#FF2A6D33",
    speedometerNeedle: "#D1F7FF",
    speedometerTick: "#D1F7FF",
    rpmTrack: "#FF2A6D33",
    rpmProgress: "#D1F7FF",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [HudThemes.CYBERPUNK_2]: {
    text: "#FFFFFF",
    subText: "#FFFFFF",
    textPrimary: "#FFFFFF",
    textSecondary: "#FFFFFF",
    textMuted: "#FFFFFF",
    icon: "#FFFFFF",
    background: "#00000033",
    border: {
      style: "solid",
      color: "#FFFFFF"
    },
    nosProgress: "#FFFFFF",
    progressTrack: "#FFFFFF33",
    progressBar: "#FFFFFF",
    air: {
      airProgressTrack: "#FFFFFF33",
      airProgressBar: "#FFFFFF"
    },
    speedometerTrack: "#FFFFFF33",
    speedometerNeedle: "#FFFFFF",
    speedometerTick: "#FFFFFF",
    rpmTrack: "#FFFFFF33",
    rpmProgress: "#FFFFFF",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [HudThemes.RETRO]: {
    text: "#ffffff",
    subText: "#bababa",
    textPrimary: "#ffffff",
    textSecondary: "#ffffff80",
    textMuted: "#ffffff66",
    icon: "#ffffff",
    background: "#ffffff26",
    border: {
      style: "solid",
      color: "#ffffff"
    },
    divider: "#ffffff",
    nosProgress: "#ffffff",
    progressTrack: "#ffffff1a",
    progressBar: "#ffffff",
    air: {
      airProgressTrack: "#ffffff1a",
      airProgressBar: "#ffffff"
    },
    speedometerTrack: "#ffffff33",
    speedometerNeedle: "#ffffff",
    speedometerTick: "#ffffff",
    rpmTrack: "#ffffff33",
    rpmProgress: "#ffffff",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [HudThemes.CLEAN_SIMPLE]: {
    text: "#ffffff",
    subText: "#bababa",
    textPrimary: "#ffffff",
    textSecondary: "#ffffff80",
    textMuted: "#ffffff66",
    icon: "#ffffff",
    background: "#ffffff26",
    border: {
      style: "solid",
      color: "#ffffff"
    },
    divider: "#ffffff",
    nosProgress: "#ffffff",
    progressTrack: "#ffffff1a",
    progressBar: "#ffffff",
    air: {
      airProgressTrack: "#ffffff1a",
      airProgressBar: "#ffffff"
    },
    speedometerTrack: "#ffffff33",
    speedometerNeedle: "#ffffff",
    speedometerTick: "#ffffff",
    rpmTrack: "#ffffff33",
    rpmProgress: "#ffffff",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [HudThemes.PIXEL]: {
    text: "#ffffff",
    subText: "#bababa",
    textPrimary: "#ffffff",
    textSecondary: "#ffffff80",
    textMuted: "#ffffff66",
    icon: "#ffffff",
    background: "#ffffff26",
    border: {
      style: "solid",
      color: "#ffffff"
    },
    divider: "#ffffff",
    nosProgress: "#ffffff",
    progressTrack: "#ffffff1a",
    progressBar: "#ffffff",
    air: {
      airProgressTrack: "#ffffff1a",
      airProgressBar: "#ffffff"
    },
    speedometerTrack: "#ffffff33",
    speedometerNeedle: "#ffffff",
    speedometerTick: "#ffffff",
    rpmTrack: "#ffffff33",
    rpmProgress: "#ffffff",
    indicators: {
      fill: "#ffffff33"
    }
  },
  [SpeedometerThemes.HALO_DASH]: {
    rpmProgress: "#FFFFFF",
    speedometerProgress: "#00E1FF"
  }
};
const SettingsStyles = {
  container: {
    overlay: "#00000080",
    background: "#161616",
    borderColorTop: "#2f324180",
    borderColorBottom: "#2f324180"
  },
  title: {
    header: "#ffffff",
    subHeader: "#9CA3AFFF"
  },
  button: {
    submit: {
      background: "#504ddd1A",
      hoverBackground: "#504ddd33",
      borderColor: "#504ddd80",
      hoverBorderColor: "#6e6bff",
      textColor: "#6e6bff"
    },
    close: {
      background: "#504ddd1A",
      hoverBackground: "#504ddd33",
      borderColor: "#504ddd80",
      hoverBorderColor: "#6e6bff",
      textColor: "#6e6bff"
    },
    action: {
      // Used for buttons like "Reset", ...
      background: "#6B72801A",
      hoverBackground: "#6B728033",
      borderColor: "#6B728080",
      hoverBorderColor: "#9CA3AF",
      textColor: "#D1D5DB"
    },
    utility: {
      // Used for buttons like "Notify Settings"
      background: "#6B72801A",
      hoverBackground: "#6B728033",
      borderColor: "#6B728080",
      hoverBorderColor: "#9CA3AF",
      textColor: "#D1D5DB"
    },
    disabled: {
      background: "#6B72800D",
      borderColor: "#6B728040",
      textColor: "#6B7280"
    },
    cancel: {
      background: "#ef44441A",
      hoverBackground: "#ef444433",
      borderColor: "#ef444480",
      hoverBorderColor: "#f87171",
      textColor: "#f87171"
    }
  },
  group: {
    background: "#1c1c1c",
    borderColor: "#464646",
    titleColor: "#D1D5DB"
  },
  select: {
    iconColor: "#9CA3AF",
    labelColor: "#D1D5DB",
    background: "#242424",
    borderColor: "#3333334D",
    hoverBorderColor: "#504ddd",
    textColor: "#D1D5DB",
    chevronColor: "#9CA3AFFF",
    option: {
      active: {
        background: "#504ddd1A",
        textColor: "#6e6bff"
      },
      inActive: {
        background: "",
        textColor: "#D1D5DB"
      }
    }
  },
  input: {
    iconColor: "#9CA3AFFF",
    labelColor: "#D1D5DB",
    background: "#242424",
    borderColor: "#3333334D",
    focusBorderColor: "#504ddd",
    textColor: "#D1D5DB"
  },
  toggle: {
    iconColor: "#9CA3AFFF",
    labelColor: "#D1D5DB",
    container: {
      background: "#242424",
      borderColor: "#3333334D"
    },
    button: {
      activeBackground: "#504ddd",
      inactiveBackground: "#6B7280"
    },
    knob: {
      background: "#FFFFFF"
    },
    description: {
      textColor: "#D1D5DB"
    }
  },
  slider: {
    iconColor: "#9CA3AFFF",
    labelColor: "#D1D5DB",
    container: {
      background: "#242424",
      borderColor: "#3333334D"
    },
    track: {
      background: "#333333",
      progressColor: "#504ddd",
      knobColor: "#FFFFFF",
      knobShadow: "0 0 10px rgba(0,0,0,0.25)"
    },
    value: {
      textColor: "#9CA3AFFF",
      hoverTextColor: "#D1D5DB",
      inputBackground: "#2a2a2a",
      inputBorderColor: "#504ddd80",
      inputTextColor: "#E5E7EB",
      focusBorderColor: "#504ddd"
    }
  },
  modal: {
    icon: {
      color: "#6e6bff"
    }
  },
  tutorial: {
    icon: {
      color: "#6e6bff",
      background: "#6e6bff33",
      boxShadow: "0 0 0 0.25vh #6e6bff99, 0 0 20px rgba(110,107,255,0.5)"
    },
    description: "#D1D5DB"
  },
  dragModeMenu: {
    background: "#1a1b23F2",
    backdropFilter: "blur(4px)",
    borderColor: "#2f324133",
    titleColor: "#ffffffcc"
  },
  scrollToTop: {
    background: "#504ddd"
  },
  tooltip: {
    background: "#333",
    textColor: "#fff"
  }
};

export { AccountStyles as A, LocationStyles as L, PlayerStatusStyles as P, ServerInfoStyles as S, VehicleStyles as V, WeaponStyles as W, SettingsStyles as a };
