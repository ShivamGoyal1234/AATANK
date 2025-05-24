import { N as NotificationThemes } from '../themes.js';

const BaseNotificationIcons = {
  "default": "mdi:bell",
  "success": "mdi:check-bold",
  "error": "mdi:close",
  "warning": "mdi:warning",
  "info": "mdi:information"
};
const defaultBaseStyle = {
  container: {
    padding: "1.25vh",
    borderRadius: ".85vh",
    minWidth: "5vh",
    maxWidth: "32vh"
  },
  icon: {
    size: "2.35vh",
    iconSize: "1.15vh"
  },
  title: {
    fontSize: "1.75vh",
    fontWeight: 600
  },
  message: {
    fontSize: "1.55vh",
    fontWeight: "normal",
    lineHeight: "2.35vh"
    // maxLines: '4',
    // isTruncated: false
  },
  closeButton: {
    containerSize: "2.5vh",
    size: "1.65vh",
    position: {
      top: "1vh",
      right: "1.25vh"
    }
  }
};
const NotificationBaseStyles = {
  default: defaultBaseStyle,
  [NotificationThemes.LIGHT]: defaultBaseStyle,
  [NotificationThemes.DARK]: defaultBaseStyle,
  [NotificationThemes.ENVI]: defaultBaseStyle,
  [NotificationThemes.MIDNIGHT]: defaultBaseStyle,
  [NotificationThemes.CYBERPUNK]: defaultBaseStyle,
  [NotificationThemes.CYBERPUNK_2]: {
    container: {
      padding: "0",
      borderRadius: "0",
      minHeight: "18vh",
      minWidth: "30vh",
      maxWidth: "35vh",
      options: {
        display: "flex",
        alignItems: "center",
        justifyContent: "center"
      }
    },
    icon: {
      size: "1.35vw",
      iconSize: "2.15vh"
    },
    title: {
      fontSize: "1.6vh",
      fontWeight: "bold"
    },
    message: {
      fontSize: "1.4vh",
      fontWeight: "normal",
      lineHeight: "2vh",
      maxLines: "3"
      // isTruncated: false
    },
    closeButton: {
      containerSize: "2.5vh",
      size: "1.65vh",
      position: {
        top: "1.75vh",
        right: "1.25vh"
      }
    }
  },
  [NotificationThemes.CLEAN_SIMPLE]: {
    container: {
      padding: "1.5vh",
      borderRadius: "1vh",
      minWidth: "20vh",
      maxWidth: "30vh"
    },
    icon: {
      size: "4.85vh",
      iconSize: "3.2vh"
    },
    title: {
      fontSize: "1.6vh",
      fontWeight: "bold"
    },
    message: {
      fontSize: "1.35vh",
      fontWeight: "normal",
      lineHeight: "2vh"
      // maxLines: '4',
      // isTruncated: false
    },
    closeButton: {
      containerSize: "2.25vh",
      size: "1.5vh",
      position: {
        top: "1.25vh",
        right: "1.25vh"
      }
    }
  },
  [NotificationThemes.RETRO]: {
    container: {
      padding: "0",
      borderRadius: "1.5vh",
      borderWidth: ".65vh",
      minWidth: "25vh",
      maxWidth: "35vh"
    },
    icon: {
      size: "6vh",
      iconSize: "5vh"
    },
    title: {
      fontSize: "1.8vh",
      fontWeight: "bold"
    },
    message: {
      fontSize: "1.6vh",
      fontWeight: "normal",
      lineHeight: "2.2vh"
      // maxLines: '4',
      // isTruncated: false
    },
    closeButton: {
      containerSize: "2.5vh",
      size: "1.8vh",
      position: {
        top: "1vh",
        right: "1vh"
      }
    }
  }
};

export { BaseNotificationIcons as B, NotificationBaseStyles as N };
