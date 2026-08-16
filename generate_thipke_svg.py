import base64
from pathlib import Path

PROJECT_PATH = Path(r"C:\Users\saksh\Downloads\marathi_mulakshare")
IMAGES_PATH = PROJECT_PATH / "assets" / "images"
SVG_PATH = PROJECT_PATH / "assets" / "svg"

SVG_PATH.mkdir(parents=True, exist_ok=True)

for i in range(1, 11):

    png_path = IMAGES_PATH / f"thipke_{i}.png"
    svg_path = SVG_PATH / f"thipke_{i}.svg"

    if not png_path.exists():
        print(f"?? Missing: {png_path}")
        continue

    image_data = png_path.read_bytes()
    base64_data = base64.b64encode(image_data).decode("utf-8")

    svg_content = f'''<?xml version="1.0" encoding="UTF-8"?>
<svg
    xmlns="http://www.w3.org/2000/svg"
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

    svg_path.write_text(svg_content, encoding="utf-8")

    print(f"? Created: thipke_{i}.svg")

print()
print("======================================")
print("? THIPKE SVG CREATION COMPLETED")
print("======================================")
