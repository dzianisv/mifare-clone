# MIFARE Classic Clone Tool

Quick and simple tool for cloning MIFARE Classic cards on macOS.

![PN532 NFC Reader with USB adapter](https://github.com/dzianisv/mifare-clone/assets/1199327/pn532-reader.jpg)


## One-Line Installation

```bash
curl -sSL https://raw.githubusercontent.com/dzianisv/mifare-clone/master/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/dzianisv/mifare-clone.git
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
bash clone.sh
```

The script will:
1. Detect card and attempt to read with default keys
2. If default keys fail, use advanced attacks (mfcuk)
3. Save dump with timestamp
4. Write dump to blank card when prompted

## Requirements

- macOS with Homebrew
- PN532 NFC reader (USB/UART)
- MIFARE Classic cards (source & blank magic card)

## How It Works

The tool uses `nfc-mfclassic` to write raw MIFARE Classic dumps (.mfd files) directly to blank cards. The configuration enables intrusive scanning for better compatibility with various card types.

**Security Note**: Only use for legitimate purposes like backing up your own access cards.