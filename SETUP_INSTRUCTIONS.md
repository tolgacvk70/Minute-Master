# Minute Meister - Setup Anleitung

## 📱 Was wurde erstellt?

Eine vollständige Flutter-App mit folgenden Features:

### ✅ Implementierte Features

1. **Start Screen** - Animierter Willkommensbildschirm mit bouncing Animationen
2. **Setup Screen** - Spielerverwaltung mit Farb-Chips
3. **Task Screen** - 60-Sekunden Countdown mit Timer-Animation
4. **Rating Screen** - 5-Sterne Bewertungssystem
5. **Score Screen** - Live-Punktestand mit Ranking
6. **Winner Screen** - Konfetti-Feier beim Gewinner

### 🎨 Design-System

- **Farben**: Rot (#FF3B30), Gelb (#FFD60A), Blau (#007AFF)
- **Animationen**: Bouncing, Fade-In, Konfetti
- **Haptic Feedback**: Vibration bei Interaktionen
- **Sounds**: System-Sounds für Timer & Alarm

### 📋 45+ Aufgaben

- 15x Easy Tasks
- 15x Medium Tasks  
- 15x Crazy Tasks

---

## 🚀 Installation & Start

### 1. Flutter installieren

Besuche: https://flutter.dev/docs/get-started/install

**Windows:**
```bash
# Download Flutter SDK
# Extrahiere nach C:\src\flutter
# Füge zu PATH hinzu: C:\src\flutter\bin
```

### 2. Projekt öffnen

```bash
cd "C:\Users\fatih\Desktop\Minute Master\Minute-Master"
```

### 3. Dependencies installieren

```bash
flutter pub get
```

### 4. App testen

**Emulator starten:**
```bash
flutter run
```

**Oder auf eurem Handy:**
```bash
flutter run -d <device-id>
```

---

## 📁 Projektstruktur

```
Minute-Master/
├── pubspec.yaml              # Flutter Dependencies
├── analysis_options.yaml     # Dart Linter Settings
├── .gitignore                # Git Ignore Rules
├── README.md                 # Projekt-Dokumentation
├── SETUP_INSTRUCTIONS.md     # Diese Datei
└── lib/
    ├── main.dart             # Entry Point + State Management
    ├── models/
    │   ├── game_state.dart   # Spiel-Logik
    │   └── tasks_data.dart   # Aufgaben-Datenbank
    ├── screens/
    │   ├── start_screen.dart
    │   ├── setup_screen.dart
    │   ├── task_screen.dart
    │   ├── rating_screen.dart
    │   ├── score_screen.dart
    │   └── winner_screen.dart
    ├── widgets/
    │   └── bouncing_widget.dart
    └── utils/
        ├── audio_manager.dart
        └── haptic_feedback.dart
```

---

## 🎮 Wie die App funktioniert

1. **Start** - Großer Titel mit Animation
2. **Setup** - Spielernamen eingeben (mindestens 2)
3. **Task** - Zufällige Aufgabe + 60s Timer
4. **Rating** - 1-5 Sterne Bewertung
5. **Score** - Live-Punktestand
6. **Winner** - Konfetti-Feier für den Minute Meister! 👑

---

## 🎯 App testen

```bash
# Im Projektordner:
flutter doctor          # Prüfe Flutter Installation
flutter pub get         # Installiere Dependencies
flutter run             # Starte App
```

---

## 📱 Für Android/iOS Build

**Android (APK):**
```bash
flutter build apk --release
```

**iOS (nur auf Mac):**
```bash
flutter build ios --release
```

---

## 🐛 Troubleshooting

**Problem: "Flutter not found"**
- Stelle sicher, dass Flutter installiert und im PATH ist
- Teste mit: `flutter doctor`

**Problem: "No devices found"**
- Verbinde dein Handy per USB
- Aktiviere USB-Debugging
- Oder starte einen Emulator

**Problem: "Package not found"**
- Führe `flutter pub get` aus

---

**Viel Spaß mit Minute Meister! 🎉**

