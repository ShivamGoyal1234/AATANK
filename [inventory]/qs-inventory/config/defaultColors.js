/* 
    Default Color Configuration Settings

    This section sets up the color scheme for the interface. Please ensure 
    each color is specified using hexadecimal format (e.g., "#FFFFFF") and 
    that opacity values are defined between "0.0" and "1.0" for proper 
    functionality. Avoid using RGB or other color formats as these may 
    interfere with the default rendering.

    Tip: Use the RESET button to restore all color values to the default settings.

    Primary and Secondary Colors:
      - primary: Base color for primary UI elements (e.g., buttons, main backgrounds).
      - secondary: Used for secondary components, keeping design balance.

    Border and Text:
      - border: Determines border styles for UI elements.
      - text: Sets the main text color for all standard display elements.
*/

const defaultPrimaryColor = "#00A3FF";          // Primary color for main UI backgrounds and components
const defaultPrimaryOpacity = "1";            // Opacity for primary color (range: 0.0 to 1.0)
const defaultSecondaryColor = "#28343C";        // Secondary color for complementary elements
const defaultSecondaryOpacity = "0.8";          // Full opacity for secondary elements, preserving visibility
const defaultBorderColor = "#0190e1";           // Border color across the UI, emphasizing interactive areas
const defaultBorderOpacity = "1";             // Sets semi-transparency for borders
const defaultBorderRadius = "1px";              // Defines corner rounding for UI elements
const defaultTextColor = "#FFFFFF";             // Standard text color, ensuring readability on dark backgrounds

const backgrounds = [
  { model: 'qs_gradient_01', image: '1.webp' },
  { model: 'qs_gradient_02', image: '2.webp' },
  { model: 'qs_gradient_03', image: '3.webp' },
  { model: 'qs_gradient_04', image: '4.webp' },
  { model: 'qs_gradient_05', image: '5.webp' },
  { model: 'qs_gradient_06', image: '6.webp' },
  { model: 'qs_gradient_07', image: '7.webp' },
  { model: 'qs_gradient_08', image: '8.webp' },
  { model: 'qs_gradient_09', image: '9.webp' },
  { model: 'qs_gradient_010', image: '10.webp' },
  { model: 'qs_gradient_011', image: '11.webp' },
  { model: 'qs_gradient_012', image: '12.webp' },
  { model: 'qs_gradient_013', image: '13.webp' },
  { model: 'qs_gradient_014', image: '14.webp' },
  { model: 'qs_gradient_015', image: '15.webp' },
  { model: 'qs_gradient_016', image: '16.webp' },
  { model: 'qs_gradient_017', image: '17.webp' },
  { model: 'qs_gradient_018', image: '18.webp' },
  { model: 'qs_gradient_019', image: '19.webp' },
  { model: 'qs_gradient_020', image: '20.webp' },
  { model: 'qs_gradient_021', image: '21.webp' },
  { model: 'qs_gradient_022', image: '22.webp', default: true },
  { model: 'qs_gradient_023', image: '23.webp' },
  { model: 'qs_gradient_024', image: '24.webp' },
  { model: 'qs_gradient_025', image: '25.webp' },
  { model: 'qs_gradient_026', image: '26.webp' },
  { model: 'qs_gradient_027', image: '27.webp' },
  { model: 'qs_gradient_028', image: '28.webp' },
  { model: 'qs_gradient_029', image: '29.webp' },
  { model: 'qs_gradient_030', image: '30.webp' },
  { model: 'qs_gradient_031', image: '31.webp' }
];