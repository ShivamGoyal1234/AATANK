import { H as HudThemes, S as SpeedometerThemes } from '../themes.js';

const defaultBaseStyle = {
  fonts: {
    default: "Roboto, sans-serif",
    digital: "Digital-7 Regular, sans-serif",
    bebas: "Bebas Neue, serif",
    pixel: "Pixelify Sans, serif",
    bankgothic: "BankGothic Lt BT, sans-serif",
    cyberfall: "Cyberfall, sans-serif",
    bahn: "Bahnschrift, sans-serif"
    // Add more custom fonts here
    // merriweather: "Merriweather, serif" // Example of adding a custom font from Google Fonts
  },
  icon: {
    size: "3vh",
    iconSize: "1.25vh",
    borderSize: ".25vh"
  },
  text: {
    title: "1.35vh",
    value: "1.35vh",
    weight: {
      normal: "normal",
      medium: 500,
      semibold: 600,
      bold: "bold"
    }
  }
};
const HudBaseStyles = {
  account: {
    container: {
      position: {
        top: "16vh",
        right: "2.25vw",
        left: ""
      },
      layout: "flex flex-col",
      // Don't change this
      gap: "1.35vh"
    },
    item: {
      layout: {
        default: "flex flex-row-reverse items-center",
        // Don't change this
        flipped: "flex flex-row items-center"
        // Don't change this
      },
      gap: "1.25vh"
    },
    font: {
      // Replace with the font name you want to use for each theme
      [HudThemes.LIGHT]: "default",
      [HudThemes.DARK]: "default",
      [HudThemes.CLEAN_SIMPLE]: "default",
      [HudThemes.ENVI]: "default",
      [HudThemes.MIDNIGHT]: "default",
      [HudThemes.CYBERPUNK]: "default",
      [HudThemes.CYBERPUNK_2]: "bankgothic",
      [HudThemes.RETRO]: "bebas",
      [HudThemes.PIXEL]: "pixel"
    }
  },
  location: {
    container: {
      position: {
        bottom: "27vh",
        left: "2.25vw",
        right: ""
      },
      layout: {
        default: "flex flex-row-reverse items-center",
        // Don't change this
        flipped: "flex items-center"
        // Don't change this
      },
      gap: "1.15vh"
    },
    directionText: {
      size: "2vh"
    },
    icon: {
      size: "2.75vh"
    },
    divider: {
      size: {
        width: ".15vh",
        height: "3vh"
      }
    },
    font: {
      // Replace with the font name you want to use for each theme
      [HudThemes.LIGHT]: "default",
      [HudThemes.DARK]: "default",
      [HudThemes.CLEAN_SIMPLE]: "default",
      [HudThemes.ENVI]: "default",
      [HudThemes.MIDNIGHT]: "default",
      [HudThemes.CYBERPUNK]: "default",
      [HudThemes.CYBERPUNK_2]: "bankgothic",
      [HudThemes.RETRO]: "bebas",
      [HudThemes.PIXEL]: "pixel"
    }
  },
  playerStatus: {
    container: {
      position: {
        bottom: "3vh",
        left: "2.25vw",
        right: ""
      },
      layout: "flex items-center",
      // Don't change this
      gap: "1.15vh"
    },
    statusItem: {
      size: "4.35vh",
      iconSize: "2vh"
    },
    font: {
      [HudThemes.PIXEL]: "pixel"
    }
  },
  serverInfo: {
    container: {
      position: {
        top: "3.5vh",
        right: "2.25vw",
        left: ""
      },
      layout: {
        default: "flex flex-col items-end",
        // Don't change this
        flipped: "flex flex-col items-start"
        // Don't change this
      },
      gap: "1.5vh"
    },
    logo: {
      size: "4.75vh"
    },
    divider: {
      size: {
        width: ".15vh",
        height: "3vh"
      }
    },
    font: {
      // Replace with the font name you want to use for each theme
      [HudThemes.LIGHT]: "default",
      [HudThemes.DARK]: "default",
      [HudThemes.CLEAN_SIMPLE]: "default",
      [HudThemes.ENVI]: "default",
      [HudThemes.MIDNIGHT]: "default",
      [HudThemes.CYBERPUNK]: "default",
      [HudThemes.CYBERPUNK_2]: "bankgothic",
      [HudThemes.RETRO]: "bebas",
      [HudThemes.PIXEL]: "pixel"
    }
  },
  weapon: {
    container: {
      position: {
        right: "2.25vw",
        left: ""
      },
      layout: {
        default: "flex flex-col items-end",
        // Don't change this
        flipped: "flex flex-col items-start"
        // Don't change this
      },
      gap: "1vh"
    },
    image: {
      size: {
        minWidth: "4vw",
        maxWidth: "10vw",
        height: "4.25vh"
      }
    },
    divider: {
      size: {
        width: ".15vh",
        height: "1.85vh"
      }
    },
    font: {
      // Replace with the font name you want to use for each theme
      [HudThemes.LIGHT]: "default",
      [HudThemes.DARK]: "default",
      [HudThemes.CLEAN_SIMPLE]: "default",
      [HudThemes.ENVI]: "default",
      [HudThemes.MIDNIGHT]: "default",
      [HudThemes.CYBERPUNK]: "default",
      [HudThemes.CYBERPUNK_2]: "bankgothic",
      [HudThemes.RETRO]: "bebas",
      [HudThemes.PIXEL]: "pixel"
    }
  },
  vehicle: {
    container: {
      position: {
        [SpeedometerThemes.DEFAULT]: {
          bottom: "-8vh",
          right: "6vw",
          left: ""
        },
        [SpeedometerThemes.RETRO]: {
          bottom: "3vh",
          right: "2.25vw",
          left: ""
        },
        [SpeedometerThemes.MODERN]: {
          bottom: "-8vh",
          right: "6vw",
          left: ""
        },
        [SpeedometerThemes.PIXEL]: {
          bottom: "3vh",
          right: "2.25vw",
          left: ""
        },
        [SpeedometerThemes.CYBERPUNK_2]: {
          bottom: "3vh",
          right: "2.25vw",
          left: ""
        },
        [SpeedometerThemes.HALO_DASH]: {
          bottom: "3vh",
          right: "2.25vw",
          left: ""
        },
        [SpeedometerThemes.DIGITAL]: {
          bottom: "3vh",
          right: "2.25vw",
          left: ""
        },
        [SpeedometerThemes.HOLOGRAM]: {
          bottom: "1vh",
          right: "2.25vw",
          left: ""
        }
      },
      layout: {
        [SpeedometerThemes.DEFAULT]: "",
        // Don't change this
        [SpeedometerThemes.RETRO]: "flex flex-col items-center",
        // Don't change this
        [SpeedometerThemes.MODERN]: "",
        // Don't change this
        [SpeedometerThemes.PIXEL]: "",
        // Don't change this
        [SpeedometerThemes.CYBERPUNK_2]: "",
        // Don't change this
        [SpeedometerThemes.HALO_DASH]: "",
        // Don't change this
        [SpeedometerThemes.DIGITAL]: "",
        // Don't change this
        [SpeedometerThemes.HOLOGRAM]: ""
        // Don't change this
      },
      gap: {
        [SpeedometerThemes.DEFAULT]: "",
        [SpeedometerThemes.RETRO]: "gap-[1.9vh]",
        // Don't change this
        [SpeedometerThemes.MODERN]: "",
        // Don't change this
        [SpeedometerThemes.PIXEL]: "gap-[1.9vh]",
        // Don't change this
        [SpeedometerThemes.CYBERPUNK_2]: "",
        // Don't change this
        [SpeedometerThemes.HALO_DASH]: "",
        // Don't change this
        [SpeedometerThemes.DIGITAL]: "",
        // Don't change this
        [SpeedometerThemes.HOLOGRAM]: ""
        // Don't change this
      }
    },
    cruiseControl: {
      divider: {
        size: {
          width: ".15vh",
          height: "2vh"
        }
      }
    },
    font: {
      [SpeedometerThemes.DEFAULT]: {
        themes: {
          [HudThemes.LIGHT]: "default",
          [HudThemes.DARK]: "default",
          [HudThemes.CLEAN_SIMPLE]: "default",
          [HudThemes.ENVI]: "default",
          [HudThemes.MIDNIGHT]: "default",
          [HudThemes.CYBERPUNK]: "default",
          [HudThemes.CYBERPUNK_2]: "default",
          [HudThemes.RETRO]: "default",
          [HudThemes.PIXEL]: "default"
        },
        type: {
          car: "default",
          boat: "digital",
          air: "default"
        }
      },
      [SpeedometerThemes.CYBERPUNK_2]: {
        type_1: "cyberfall",
        type_2: "bankgothic"
      },
      [SpeedometerThemes.DIGITAL]: {
        type: "bahn"
      },
      [SpeedometerThemes.HOLOGRAM]: {
        type: "digital"
      },
      [SpeedometerThemes.HALO_DASH]: {
        type: "default"
      },
      [SpeedometerThemes.MODERN]: {
        type: "digital"
      },
      [SpeedometerThemes.PIXEL]: {
        type: "pixel"
      },
      [SpeedometerThemes.RETRO]: {
        type: "bebas"
      }
    }
  },
  voice: {
    container: {
      position: {
        right: "2.25vw",
        left: ""
      }
    }
  },
  settingsMenu: {
    font: "default"
  },
  notification: {
    font: "default"
  }
};

export { HudBaseStyles as H, defaultBaseStyle as d };
