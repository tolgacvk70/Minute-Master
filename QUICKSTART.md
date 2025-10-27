# 🚀 QUICKSTART - Minute Master

**Problem: "Could not open code" in Xcode?** → Diese Anleitung löst das Problem! ✅

---

## 🎯 Schnellste Lösung (1 Minute)

### Automatisches Setup:

```bash
# 1. Repository klonen
git clone https://github.com/tolgacvk70/Minute-Master.git
cd Minute-Master

# 2. Setup-Script ausführen
chmod +x ios_setup.sh
./ios_setup.sh

# 3. Xcode öffnen
cd ios
open Runner.xcworkspace
```

**Fertig!** 🎉

---

## 📝 Manuelles Setup (wenn Script nicht funktioniert)

```bash
# 1. Repository klonen
git clone https://github.com/tolgacvk70/Minute-Master.git
cd Minute-Master

# 2. Flutter Dependencies
flutter pub get

# 3. iOS-Struktur generieren (WICHTIG!)
flutter create --platforms=ios .

# 4. Xcode öffnen
cd ios
open Runner.xcworkspace
```

---

## ❓ Was ist das Problem?

Wenn du das Projekt von GitHub klonst und versuchst, es in Xcode zu öffnen, fehlt die Datei `Runner.xcworkspace`. Diese Datei wird von Flutter automatisch generiert und ist **nicht** im Git-Repository enthalten.

### Lösung:
Der Befehl `flutter create --platforms=ios .` erstellt alle benötigten iOS-Dateien, einschließlich `Runner.xcworkspace`.

---

## ⚠️ Wichtige Hinweise

### ✅ DOs:
- **Immer** `Runner.xcworkspace` öffnen, NICHT `Runner.xcodeproj`
- **Erst** `flutter create --platforms=ios .` ausführen
- **Dann** Xcode öffnen

### ❌ DON'Ts:
- Nicht direkt `Runner.xcodeproj` öffnen
- Nicht ohne `flutter pub get` Xcode öffnen

---

## 🔧 Voraussetzungen

### Auf Mac benötigst du:

1. **Flutter**
   ```bash
   # Prüfen ob installiert:
   flutter doctor
   
   # Installieren (macOS):
   brew install flutter
   ```

2. **Xcode**
   - Aus dem App Store installieren
   - Mindestens Version 14.0

3. **CocoaPods** (wird automatisch installiert)

---

## 🐛 Troubleshooting

### Problem: "flutter: command not found"

**Lösung:**
```bash
brew install flutter
# oder besuche: https://flutter.dev
```

### Problem: "Runner.xcworkspace not found"

**Lösung:**
```bash
flutter clean
flutter pub get
flutter create --platforms=ios .
```

### Problem: "Pod install failed"

**Lösung:**
```bash
cd ios
pod deintegrate
pod install
cd ..
```

### Problem: "Signing requires a development team"

**Lösung:**
1. In Xcode: Runner → Signing & Capabilities
2. Team auswählen (Apple Developer Account oder Personal Team)

---

## 📱 Alternative: Ohne Xcode entwickeln

### Mit Android Studio:
```bash
# Projekt öffnen
# File → Open → Minute-Master Ordner wählen
# Run drücken
```

### Mit VS Code:
```bash
# Flutter Extension installieren
# Ordner öffnen: File → Open Folder → Minute-Master
# F5 drücken oder Terminal: flutter run
```

---

## 🎮 App starten

Nach dem Setup kannst du die App starten:

```bash
# iOS Simulator
flutter run

# Auf deinem iPhone (per USB)
flutter run -d <device-id>

# Liste aller Geräte
flutter devices
```

---

## 📚 Weitere Dokumentation

- **README.md** - Projekt-Übersicht
- **KOLLEGE_ANLEITUNG.md** - Detaillierte Anleitung für Teamkollegen
- **SETUP_INSTRUCTIONS.md** - Erste Schritte
- **STORE_RELEASE_GUIDE.md** - App Store & Play Store Release

---

## 🤔 Warum ist das nötig?

Flutter Projekte enthalten plattformspezifische Dateien (iOS/Android), aber einige dieser Dateien werden automatisch generiert und nicht in Git gespeichert. Das ist normal und eine Best Practice.

Der Befehl `flutter create --platforms=ios .` stellt sicher, dass alle iOS-spezifischen Dateien vorhanden sind.

---

## ✨ Zusammenfassung

**Der wichtigste Befehl:**
```bash
flutter create --platforms=ios .
```

Dieser Befehl löst das "Could not open code" Problem! 🎯

**Danach:**
```bash
cd ios
open Runner.xcworkspace
```

---

**Viel Erfolg mit Minute Master! 🎉👑**
