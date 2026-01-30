# Surface Mode Quantifier

A MATLAB App for quantifying ductile removal percentage from surface images. This tool analyzes microscopy or surface images by converting them to binary format and calculating the percentage of ductile removal based on pixel intensity analysis.

## Description

This application provides a graphical user interface (GUI) for:
- Loading and displaying surface/microscopy images
- Automatic image processing (grayscale conversion, contrast adjustment, binarization)
- Quantitative analysis of ductile removal percentage within a defined region of interest (ROI)

## Requirements

- **MATLAB**: R2018b or later (with App Designer support)
- **Image Processing Toolbox**: Required for image manipulation functions (`imadjust`, `imbinarize`, `imcrop`, `rgb2gray`)

### Verifying Toolbox Installation

To check if you have the Image Processing Toolbox installed, run the following command in MATLAB:

```matlab
ver('images')
```

If the toolbox is not installed, you can install it through MATLAB's Add-On Explorer or contact your system administrator.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/SurfaceModeQuantifier.git
   ```
   
2. **Or download directly:**
   - Click the green "Code" button on GitHub
   - Select "Download ZIP"
   - Extract the contents to your desired location

## Usage

### Running the Application

1. Open MATLAB
2. Navigate to the folder containing `SurfaceModeQuantifier.m`
3. Run the application using one of these methods:

   **Method 1: Command Window**
   ```matlab
   SurfaceModeQuantifier
   ```
   
   **Method 2: Double-click**
   - Double-click on `SurfaceModeQuantifier.m` in MATLAB's Current Folder panel
   - Click the "Run" button in the Editor tab

### Using the Application

1. Click the **"Upload"** button to select an image file
2. Supported formats: PNG, JPG, JPEG, BMP
3. **Important:** Image dimensions must be at least **1000×1000 pixels**
4. The application will:
   - Display the original image with a red rectangle showing the region of interest (ROI)
   - Display the binarized (black and white) version of the ROI
   - Calculate and display the **Ductile Removal Percentage**

### Understanding the Output

- **Left panel:** Original image with the analysis region highlighted (red rectangle)
- **Right panel:** Binary (black/white) processed image of the ROI
- **Bottom label:** Ductile removal percentage calculated as the ratio of white pixels to total pixels in the ROI

## Technical Details

### Algorithm

1. **Image Loading:** Reads the selected image file
2. **Grayscale Conversion:** Converts RGB images to grayscale using `rgb2gray`
3. **Contrast Enhancement:** Applies `imadjust` for automatic contrast adjustment
4. **Region of Interest:** Crops a 1000×1000 pixel region starting at position (400, 400)
5. **Binarization:** Converts to binary using Otsu's method via `imbinarize`
6. **Quantification:** Calculates percentage as: (white pixels / total pixels) × 100

### File Structure

```
SurfaceModeQuantifier/
├── SurfaceModeQuantifier.m   # Main application file
├── README.md                 # This documentation file
├── LICENSE                   # License information
├── CITATION.cff              # Citation file for academic references
└── .gitignore                # Git ignore configuration
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Mohammed Alharbi

## Troubleshooting

### Common Issues

1. **"Image dimensions must be at least 1000x1000 pixels" error**
   - Ensure your input image is at least 1000×1000 pixels in size
   - Resize smaller images using image editing software before analysis

2. **Application doesn't start**
   - Verify you have MATLAB R2018b or later
   - Ensure the Image Processing Toolbox is installed
   - Check that you're in the correct directory containing `app1.m`

3. **"Undefined function" errors**
   - Install the Image Processing Toolbox
   - Run `ver('images')` to verify installation
   - Ensure you're in the correct directory containing `SurfaceModeQuantifier.m`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
