# MIFARE Classic Clone Tool

Quick and simple tool for cloning MIFARE Classic cards on macOS.

## One-Line Installation

```bash
curl -sSL https://raw.githubusercontent.com/yourusername/mifare-clone/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/yourusername/mifare-clone.git
cd mifare-clone
bash install.sh
```

## What It Does

1. **Installs libnfc & nfcutils** - Core NFC tools for card communication
2. **Configures PN532 reader** - Sets up UART connection for PN532 over CP2102
3. **Enables card cloning** - Write MIFARE Classic dumps to blank cards

## Usage

### Test Connection
```bash
nfc-list
```

### Clone a Card
```bash
bash clone.sh dump.mfd
```

## Requirements

- macOS with Homebrew
- PN532 NFC reader (USB/UART)
- MIFARE Classic cards (source & blank magic card)

## How It Works

The tool uses `nfc-mfclassic` to write raw MIFARE Classic dumps (.mfd files) directly to blank cards. The configuration enables intrusive scanning for better compatibility with various card types.

**Security Note**: Only use for legitimate purposes like backing up your own access cards.