#!/bin/bash

# iOS Setup Script für Minute Master
# Löst das "Could not open code" Problem in Xcode

set -e  # Exit on error

echo "🚀 Minute Master - iOS Setup"
echo "================================"
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter ist nicht installiert!"
    echo ""
    echo "Bitte installiere Flutter zuerst:"
    echo "  macOS: brew install flutter"
    echo "  Oder besuche: https://flutter.dev/docs/get-started/install"
    echo ""
    exit 1
fi

echo "✅ Flutter gefunden: $(flutter --version | head -n 1)"
echo ""

# Run Flutter doctor
echo "🔍 Flutter Setup prüfen..."
flutter doctor
echo ""

# Install dependencies
echo "📦 Dependencies installieren..."
flutter pub get
echo ""

# Create/update iOS platform files
echo "🍎 iOS-Struktur erstellen..."
flutter create --platforms=ios .
echo ""

# Check if workspace was created
if [ -d "ios/Runner.xcworkspace" ]; then
    echo "✅ Runner.xcworkspace erfolgreich erstellt!"
    echo ""
    echo "🎉 Setup abgeschlossen!"
    echo ""
    echo "▶️  Xcode öffnen mit:"
    echo "   cd ios && open Runner.xcworkspace"
    echo ""
else
    echo "⚠️  Runner.xcworkspace wurde nicht erstellt."
    echo "Bitte versuche:"
    echo "  1. flutter clean"
    echo "  2. flutter pub get"
    echo "  3. flutter create --platforms=ios ."
    echo ""
    exit 1
fi
