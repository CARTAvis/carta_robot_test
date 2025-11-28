import easyocr
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
import sys
import argparse

def extract_text_from_region(image_path, x1, y1, x2, y2, languages=['en'], rotation_angle=0):
    """
    Extract text from a specific region of a PNG image using EasyOCR.
    
    Parameters:
    -----------
    image_path : str
        Path to the PNG image file
    x1, y1 : int
        Top-left coordinates of the region
    x2, y2 : int
        Bottom-right coordinates of the region
    languages : list
        List of language codes for OCR (default: ['en'])
    rotation_angle : float
        Rotation angle in degrees (counterclockwise, default: 0)
    
    Returns:
    --------
    list of tuples
        Each tuple contains (bounding_box, text, confidence)
    """
    # Load the image
    image = Image.open(image_path)
    
    # Crop the image to the specified region
    cropped_image = image.crop((x1, y1, x2, y2))
    
    # Rotate the cropped image if rotation angle is specified
    if rotation_angle != 0:
        cropped_image = cropped_image.rotate(-rotation_angle, expand=True, fillcolor='white')
    
    # Convert PIL Image to numpy array for EasyOCR
    image_array = np.array(cropped_image)
    
    # Initialize EasyOCR reader
    reader = easyocr.Reader(languages)
    
    # Perform OCR on the cropped region
    results = reader.readtext(image_array)
    
    return results

def extract_text_only(image_path, x1, y1, x2, y2, languages=['en'], rotation_angle=0):
    """
    Extract only the text strings from a specific region.
    
    Parameters:
    -----------
    rotation_angle : float
        Rotation angle in degrees (counterclockwise, default: 0)
    
    Returns:
    --------
    str
        Concatenated text from the region
    """
    results = extract_text_from_region(image_path, x1, y1, x2, y2, languages, rotation_angle)
    text_only = ' '.join([result[1] for result in results])
    return text_only

def main():
    """
    Main function to handle command-line arguments and perform OCR comparison.
    """
    # Set up argument parser
    parser = argparse.ArgumentParser(
        description='Extract text from a PNG image region and compare with target string',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
            Examples:
            python ocr.py image.png 100 200 400 500 "Expected Text"
            python ocr.py test.png 862 1287 1179 1328 "Some text to match"
            python ocr.py image.png 100 200 400 500 "Expected Text" --rotation 15
            python ocr.py test.png 862 1287 1179 1328 "Some text" --rotation -10 --debug
        '''
    )
    
    parser.add_argument('image_path', help='Path to the PNG image file')
    parser.add_argument('x1', type=int, help='Top-left x coordinate')
    parser.add_argument('y1', type=int, help='Top-left y coordinate')
    parser.add_argument('x2', type=int, help='Bottom-right x coordinate')
    parser.add_argument('y2', type=int, help='Bottom-right y coordinate')
    parser.add_argument('target_text', help='Target text to compare with OCR result (in quotes)')
    parser.add_argument('--rotation', type=float, default=0, help='Rotation angle in degrees (counterclockwise, default: 0)')
    parser.add_argument('--debug', action='store_true', help='Enable debug mode to show image with bounding box')
    
    # Parse arguments
    args = parser.parse_args()
    
    # Extract text from the specified region
    try:
        ocr_text = extract_text_only(args.image_path, args.x1, args.y1, args.x2, args.y2, rotation_angle=args.rotation)
        
        # Debug mode
        if args.debug:
            image = Image.open(args.image_path)
            plt.figure(figsize=(12, 8))
            plt.imshow(image)
            plt.gca().add_patch(plt.Rectangle((args.x1, args.y1), args.x2 - args.x1, args.y2 - args.y1, 
                                            fill=False, edgecolor='red', linewidth=2))
            plt.title(f'OCR Region: ({args.x1}, {args.y1}) to ({args.x2}, {args.y2}), Rotation: {args.rotation}°')
            plt.show()
            
            # Get full results with confidence scores
            results = extract_text_from_region(args.image_path, args.x1, args.y1, args.x2, args.y2, rotation_angle=args.rotation)
            
            print("Detailed Results:")
            for bbox, text, confidence in results:
                print(f"Text: {text}")
                print(f"Confidence: {confidence:.2f}")
                print("-" * 50)
            
            print(f"Extracted Text: '{ocr_text}'")
            print(f"Target Text: '{args.target_text}'")
        
        # Compare OCR result with target text (case-sensitive, strip whitespace)
        ocr_text_normalized = ocr_text.strip()
        target_text_normalized = args.target_text.strip()
        
        if ocr_text_normalized == target_text_normalized:
            print(f"Identical, it is found as '{ocr_text}'")
        else:
            print(f"Different, it is found as '{ocr_text}'")

    except FileNotFoundError:
        print(f"Error: Image file '{args.image_path}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)

if __name__ == "__main__":
    main()