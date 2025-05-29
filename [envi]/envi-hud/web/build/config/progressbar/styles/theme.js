import { P as ProgressBarThemes } from '../themes.js';

const ProgressbarStyles = {
  [ProgressBarThemes.LIGHT]: {
    text: "#ffffff",
    background: "#ffffff",
    progress: "#0292CD"
  },
  [ProgressBarThemes.DARK]: {
    text: "#ffffff",
    background: "#00000060",
    progress: "#364153"
  },
  [ProgressBarThemes.ENVI]: {
    text: "#ffffff",
    background: "#00000060",
    progress: "#8B0000"
  },
  [ProgressBarThemes.MIDNIGHT]: {
    text: "#ffffff",
    background: "#00000080",
    progress: "#000000"
  },
  [ProgressBarThemes.CYBERPUNK]: {
    text: "#ffffff",
    background: "#D4F8FF",
    progress: "#FF2867"
  },
  [ProgressBarThemes.CYBERPUNK_2]: {
    text: "#FDFCEB",
    background: "",
    progress: "#EF9538"
  },
  [ProgressBarThemes.CLEAN_SIMPLE]: {
    text: "#ffffff",
    background: "#00000060",
    progress: "#FFFFFF"
  },
  [ProgressBarThemes.PIXEL]: {
    text: "#ffffff",
    background: "",
    progress: "#669CD1",
    progress_2: "#9AEFFF",
    progress_3: "#76BBE2",
    progress_4: "#76BBE2"
  },
  [ProgressBarThemes.RETRO]: {
    text: "#FDFCEB",
    background: "#F5F3D9",
    progressWrapper: "#CBEBFF",
    progress: "#FF9393"
  }
};

export { ProgressbarStyles as P };
