#!/bin/bash
# Save your image as 'pn532-reader.png' then run this script
if [ -f "pn532-reader.png" ]; then
    cwebp -q 80 pn532-reader.png -o pn532-reader.webp
    echo "✅ Converted to WebP format"
else
    echo "❌ Please save the image as 'pn532-reader.png' first"
fi