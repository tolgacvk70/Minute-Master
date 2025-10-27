# Minute Meister 🎮

**60 Sekunden. Eine Aufgabe. 100% Chaos.**

Eine schnelle, interaktive Party-App für Gruppen, bei der eine Person das Handy hält und die anderen live mitspielen!

## 🎯 Über die App

Minute Meister ist ein unterhaltsames Partyspiel, bei dem:
- **Eine Person das Handy hält** - keine zweite App nötig!
- **Zufällige 60-Sekunden-Aufgaben** gestellt werden
- **Die Gruppe bewertet** und Punkte vergibt
- **Am Ende der Minute Meister gekrönt** wird 👑

## 🎨 Design

Die App verwendet ein fröhliches, farbenfrohes Design mit:
- **Rot** (#FF3B30) - Energie, Timer, Buttons
- **Gelb** (#FFD60A) - Highlights, Punkte
- **Blau** (#007AFF) - Hintergrund, Ruhepunkt
- **Weiß** (#FFFFFF) - Textkontrast

## 🚀 Features

- ✨ Animierte Startscreen
- 👥 Einfache Spielerverwaltung (2+ Spieler)
- ⏱️ 60-Sekunden Countdown-Timer mit Animationen
- ⭐ 5-Sterne Bewertungssystem
- 📊 Live-Punktestand mit Rankings
- 🎉 Konfetti-Feier beim Gewinner
- 📱 Portrait-Modus optimiert
- 🎵 Haptic Feedback & Sounds

## 🎮 Spielablauf

1. **Start** - Spieleranzahl auswählen
2. **Setup** - Spielernamen eingeben
3. **Task** - 60 Sekunden Aufgabe erfüllen
4. **Rating** - Gruppebewertung (1-5 Sterne)
5. **Score** - Live-Punktestand ansehen
6. **Winner** - Minute Meister wird gekrönt! 👑

## 📋 Installation

### Voraussetzungen
- Flutter SDK (>=3.0.0)
- Dart SDK

### Setup

1. Repository klonen:
```bash
git clone <repository-url>
cd Minute-Master
```

2. Dependencies installieren:
```bash
flutter pub get
```

3. App starten:
```bash
flutter run
```

## 📁 Projektstruktur

```
lib/
├── main.dart                    # Entry point & State Management
├── models/
│   ├── game_state.dart         # Spiel-Logik & State Management
│   └── tasks_data.dart         # Aufgaben-Datenbank
├── screens/
│   ├── start_screen.dart       # Startbildschirm
│   ├── setup_screen.dart      # Spieler-Setup
│   ├── task_screen.dart       # Aufgaben-Anzeige & Timer
│   ├── rating_screen.dart     # Bewertungsbildschirm
│   ├── score_screen.dart      # Punkte-Anzeige
│   └── winner_screen.dart     # Sieger-Krönung
├── widgets/
│   └── bouncing_widget.dart   # Bouncing Animation Widget
└── utils/
    ├── audio_manager.dart     # Audio-Feedback
    └── haptic_feedback.dart   # Haptic Feedback
```

## 🎯 Zukünftige Features

- 🌐 Online-Modus
- 🤖 KI-Aufgaben-Generator
- 🎭 Themenpacks (Filme, Sport, etc.)
- 📱 Social Features
- 💾 Game-Progress Speicherung
- 🎵 Mehr Sounds & Musik

## 📝 Lizenz

Diese App wurde für den Privatgebrauch entwickelt.

---

**Entwickelt mit ❤️ und 100% Chaos**

