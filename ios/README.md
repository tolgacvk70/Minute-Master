# iOS Setup für Minute Meister

## ⚠️ WICHTIG für GitHub

### 🚨 "Could not open code" in Xcode?

**Schnellste Lösung - Automatisches Setup:**

```bash
# Vom Projekt-Root-Verzeichnis:
./ios_setup.sh
```

Das Script macht alles automatisch! ✨

### Manuelle Lösung:

Damit das Projekt in Xcode geöffnet werden kann, muss dein Kollege diese Befehle ausführen:

```bash
# 1. Repository klonen
git clone https://github.com/tolgacvk70/Minute-Master.git
cd Minute-Master

# 2. Flutter Setup
flutter pub get

# 3. iOS-Struktur generieren
flutter create --platforms=ios .

# 4. Xcode öffnen
cd ios
open Runner.xcworkspace
```

📖 **Detaillierte Anleitung:** Siehe [QUICKSTART.md](../QUICKSTART.md) im Projekt-Root

## Warum?

Die `.xcodeproj` und `.xcworkspace` Dateien werden von Flutter automatisch generiert und sollten NICHT zu Git hinzugefügt werden (in .gitignore).

Stattdessen werden sie beim `flutter create --platforms=ios .` Befehl erstellt.

## ✅ Richtige Reihenfolge

1. Git Repository klonen
2. `flutter pub get`
3. `flutter create --platforms=ios .` ← Erstellt .xcworkspace
4. Xcode öffnen

## 📖 Siehe auch

- `GITHUB_SETUP.md` - Detaillierte Anleitung
- `KOLLEGE_ANLEITUNG.md` - Schnellstart für Kollegen
- `README.md` - Projekt-Übersicht

