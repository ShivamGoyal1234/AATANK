import { P as ProgressBarThemes } from '../themes.js';

const ProgressbarBaseStyle = {
  position: {
    bottom: "12vh",
    left: "50%"
  },
  container: {
    [ProgressBarThemes.LIGHT]: {
      width: "30vh",
      height: "1.679vh",
      borderRadius: "2vh",
      gap: ".2vh"
      // Only use this if you want to add a gap between the progressbar and the text
    },
    [ProgressBarThemes.DARK]: {
      width: "30vh",
      height: "1.679vh",
      borderRadius: "2vh",
      gap: ".2vh"
    },
    [ProgressBarThemes.CLEAN_SIMPLE]: {
      width: "30vh",
      height: "1.679vh",
      borderRadius: "2vh",
      gap: ".2vh"
    },
    [ProgressBarThemes.ENVI]: {
      width: "30vh",
      height: "1.679vh",
      borderRadius: "2vh",
      gap: ".2vh"
    },
    [ProgressBarThemes.MIDNIGHT]: {
      width: "30vh",
      height: "1.679vh",
      borderRadius: "2vh",
      gap: ".2vh"
    },
    [ProgressBarThemes.CYBERPUNK]: {
      width: "30vh",
      height: "1.679vh",
      borderRadius: "2vh",
      gap: ".2vh"
    },
    [ProgressBarThemes.CYBERPUNK_2]: {
      width: "28.3vh",
      height: "4vh",
      borderRadius: "0",
      gap: "0"
    },
    [ProgressBarThemes.RETRO]: {
      width: "32vh",
      height: "3.263vh",
      borderRadius: "2vh",
      gap: "0"
    },
    [ProgressBarThemes.PIXEL]: {
      width: "29.23vh",
      height: "3.1vh",
      borderRadius: "0",
      gap: "0"
    }
  },
  typography: {
    fontSize: {
      [ProgressBarThemes.LIGHT]: "1.799vh",
      [ProgressBarThemes.DARK]: "1.799vh",
      [ProgressBarThemes.CLEAN_SIMPLE]: "1.799vh",
      [ProgressBarThemes.ENVI]: "1.799vh",
      [ProgressBarThemes.MIDNIGHT]: "1.799vh",
      [ProgressBarThemes.CYBERPUNK]: "1.799vh",
      [ProgressBarThemes.CYBERPUNK_2]: "1.689vh",
      [ProgressBarThemes.RETRO]: "2.2vh",
      [ProgressBarThemes.PIXEL]: "2.2vh"
    },
    // 'normal = 400', 'bold = 700', 'bolder = 900' and 'lighter = 100' (If using strings, remember to add double quotation marks)
    // If not using strings, use the numbers directly (Value from 100 to 900)
    fontWeight: 400,
    fontFamily: {
      [ProgressBarThemes.LIGHT]: "default",
      [ProgressBarThemes.DARK]: "default",
      [ProgressBarThemes.CLEAN_SIMPLE]: "default",
      [ProgressBarThemes.ENVI]: "default",
      [ProgressBarThemes.MIDNIGHT]: "default",
      [ProgressBarThemes.CYBERPUNK]: "default",
      [ProgressBarThemes.CYBERPUNK_2]: "bankgothic",
      [ProgressBarThemes.RETRO]: "bebas",
      [ProgressBarThemes.PIXEL]: "pixel"
    }
  }
};

export { ProgressbarBaseStyle as P };
