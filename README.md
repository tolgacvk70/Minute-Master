# 🎮 Minute Meister

**60 Sekunden. Eine Aufgabe. 100% Chaos.**

Schnelles Partyspiel für Gruppen - Eine Person hält das Handy, die anderen spielen live mit!

---

## 📦 Von GitHub klonen

### 🚨 WICHTIG für iOS/Xcode Entwicklung:

**Wenn du "Could not open code" in Xcode siehst**, führe ZUERST das Setup aus!

#### Schnelles Setup (Empfohlen):
```bash
# 1. Repository klonen
git clone https://github.com/tolgacvk70/Minute-Master.git
cd Minute-Master

# 2. Automatisches iOS Setup
./ios_setup.sh

# 3. Xcode öffnen
cd ios && open Runner.xcworkspace
```

#### Manuelles Setup:
```bash
# 1. Repository klonen
git clone https://github.com/tolgacvk70/Minute-Master.git
cd Minute-Master

# 2. Flutter Dependencies installieren
flutter pub get

# 3. iOS-Struktur erstellen (WICHTIG!)
flutter create --platforms=ios .

# 4. Xcode öffnen
cd ios && open Runner.xcworkspace
```

📖 **Siehe auch:** [QUICKSTART.md](QUICKSTART.md) für detaillierte Anleitung

---

## 🚀 Erste Schritte

### Prüfe Flutter Installation

```bash
flutter doctor
```

### Dependencies installieren

```bash
flutter pub get
```

### App starten

```bash
flutter run
```

---

## 💻 In Xcode öffnen (Mac)

### ⚠️ "Could not open code" Error?

**Das ist normal nach dem Klonen!** Führe zuerst das Setup aus:

```bash
# Schnellste Lösung - Automatisches Setup:
./ios_setup.sh

# Oder manuell:
flutter pub get
flutter create --platforms=ios .
```

### Xcode öffnen:

**Wichtig**: Immer das `.xcworkspace` öffnen, NICHT `.xcodeproj`!

```bash
cd ios
open Runner.xcworkspace
```

### Troubleshooting:

Wenn es immer noch nicht funktioniert:

```bash
# Alles zurücksetzen und neu generieren
flutter clean
flutter pub get
flutter create --platforms=ios .
cd ios
open Runner.xcworkspace
```

📖 **Detaillierte Lösung:** Siehe [QUICKSTART.md](QUICKSTART.md)

---

## 📱 In Android Studio öffnen

1. **File** → **Open**
2. Ordner `Minute-Master` wählen
3. Flutter Plugin wird automatisch erkannt

---

## 📚 Dokumentation

- **GITHUB_SETUP.md** - Detaillierte Anleitung für Xcode
- **START_HERE.md** - Schnellstart für Entwicklung
- **STORE_RELEASE_GUIDE.md** - Store-Veröffentlichung
- **SETUP_INSTRUCTIONS.md** - Erste Schritte

---

## ⚠️ Wichtig für deinen Kollegen

Wenn Xcode "Could not open code" anzeigt:

1. Prüfe, ob Flutter installiert ist: `flutter doctor`
2. Führe aus: `flutter create --platforms=ios .`
3. Öffne **immer** `.xcworkspace`, nicht `.xcodeproj`

Siehe **GITHUB_SETUP.md** für Details!

---

## 🎯 Features

- 6 vollständige Screens
- 45+ Aufgaben in 3 Schwierigkeitsstufen
- 60-Sekunden Timer mit Animationen
- 5-Sterne-Bewertungssystem
- Konfetti-Feier beim Gewinner
- Haptic Feedback & Sounds
- Buntes, fröhliches Design

---

## 📄 Projektstruktur

```
lib/
├── main.dart              # App Entry Point
├── models/                # Game Logic
├── screens/               # 6 Flutter Screens
├── widgets/               # Reusable Widgets
└── utils/                 # Utilities
```

---

## 🎨 Design

- **Rot**: #FF3B30
- **Gelb**: #FFD60A
- **Blau**: #007AFF
- **Türkis**: #40E0D0

---

**Viel Spaß mit Minute Meister! 🎉👑**
