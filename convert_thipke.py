import base64
from pathlib import Path


# ============================================================
# PNG -> SVG CONVERTER
# ============================================================

def png_to_svg(png_path, svg_path):
    png_path = Path(png_path)
    svg_path = Path(svg_path)

    # Check PNG exists
    if not png_path.exists():
        print(f"❌ File not found: {png_path}")
        return

    # Read PNG as binary
    image_data = png_path.read_bytes()

    # Convert PNG to Base64
    base64_data = base64.b64encode(image_data).decode("utf-8")

    # SVG content
    svg_content = f'''<?xml version="1.0" encoding="UTF-8"?>
<svg
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    width="100%"
    height="100%"
    viewBox="0 0 100 100"
    preserveAspectRatio="xMidYMid meet">

    <image
        x="0"
        y="0"
        width="100"
        height="100"
        preserveAspectRatio="xMidYMid meet"
        href="data:image/png;base64,{base64_data}"
    />

</svg>
'''

    # Create parent folder if needed
    svg_path.parent.mkdir(parents=True, exist_ok=True)

    # Save SVG
    svg_path.write_text(svg_content, encoding="utf-8")

    print(f"✅ Created: {svg_path}")


# ============================================================
# PROJECT PATH
# ============================================================

PROJECT_PATH = Path(
    r"C:\Users\saksh\Downloads\marathi_mulakshare"
)

# PNG files are here
IMAGES_PATH = PROJECT_PATH / "assets" / "images"

# SVG files will be created here
SVG_PATH = PROJECT_PATH / "assets" / "svg"


# ============================================================
# PNG 1 -> SVG 1
# ============================================================

png_to_svg(
    IMAGES_PATH / "thipke_1.png",
    SVG_PATH / "thipke_1.svg"
)


# ============================================================
# PNG 2 -> SVG 2
# ============================================================

png_to_svg(
    IMAGES_PATH / "thipke_2.png",
    SVG_PATH / "thipke_2.svg"
)


# ============================================================
# COMPLETED
# ============================================================

print()
print("======================================")
print("✅ SVG CONVERSION COMPLETED")
print("======================================")

print()
print("SVG files created in:")
print(SVG_PATH)

print()
print("Files:")
print("1. thipke_1.svg")
print("2. thipke_2.svg")