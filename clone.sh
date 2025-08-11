#!/bin/bash
set -e

DUMP_FILE="${1:-dump.mfd}"

if [ ! -f "$DUMP_FILE" ]; then
    echo "❌ Dump file not found: $DUMP_FILE"
    echo "Usage: $0 [dump_file.mfd]"
    exit 1
fi

echo "📡 Checking NFC reader..."
nfc-list > /dev/null 2>&1 || {
    echo "❌ No NFC reader detected. Make sure it's connected."
    exit 1
}

echo "🎯 Ready to write $DUMP_FILE to card"
echo "⚠️  Place blank MIFARE Classic card on reader and press Enter..."
read

echo "✍️  Writing dump to card..."
nfc-mfclassic w a u "$DUMP_FILE"

echo "✅ Clone complete!"