#!/bin/bash
set -e

echo "🔧 Installing MIFARE Classic tools..."
brew install libnfc mfoc mfcuk

echo "⚙️ Configuring NFC device..."
sudo mkdir -p /opt/homebrew/etc/nfc
sudo tee /opt/homebrew/etc/nfc/libnfc.conf > /dev/null << 'EOF'
allow_intrusive_scan=yes
device.name = "PN532 over CP2102"
device.connstring = "pn532_uart:/dev/tty.usbserial-0001:115200"
allow_intrusive_scan = true
EOF

echo "✅ Installation complete! Connect your PN532 reader and run: nfc-list"