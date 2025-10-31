# 👥 Für deinen Kollegen - Minute Meister öffnen

## 🚨 Problem: "Could not open code" in Xcode

**LÖSUNG**: Führe diese Befehle aus:

---

## ✅ SCHNELL-LÖSUNG (Kopieren & Einfügen)

```bash
# 1. Projekt von GitHub klonen
git clone <github-url>
cd Minute-Master

# 2. Flutter Dependencies installieren
flutter pub get

# 3. iOS-Struktur generieren (WICHTIG!)
flutter create --platforms=ios .

# 4. Xcode öffnen
cd ios
open Runner.xcworkspace
```

**Das war's!** ✅

---

## 📝 Was du brauchst

### Voraussetzungen auf Mac:

1. **Flutter installiert**
   ```bash
   flutter doctor
   ```
   
   Falls nicht installiert:
   ```bash
   brew install flutter
   ```

2. **Xcode installiert**
   - Aus App Store herunterladen
   - Mindestens Version 14.0

---

## 🎯 Schritt-für-Schritt

### Schritt 1: Repository klonen

```bash
git clone <dein-github-repo-url>
cd Minute-Master
```

### Schritt 2: Flutter Setup

```bash
# Prüfen ob Flutter installiert ist
flutter doctor

# Dependencies installieren
flutter pub get
```

### Schritt 3: iOS-Struktur erstellen

```bash
# Diese Befehls generiert Runner.xcworkspace
flutter create --platforms=ios .
```

**Warum**: Das Projekt hat zwar die Dateien, aber Flutter muss die Xcode-Integration erstellen.

### Schritt 4: Öffnen in Xcode

```bash
cd ios
open Runner.xcworkspace
```

**WICHTIG**: Immer `.xcworkspace` öffnen, NIEMALS `.xcodeproj`!

---

## 🔧 Troubleshooting

### Problem 1: "flutter: command not found"

**Lösung**:
```bash
# Flutter installieren
brew install flutter

# Pfad prüfen
which flutter

# Zu PATH hinzufügen (falls nötig)
export PATH="$PATH:`pwd`/flutter/bin"
```

### Problem 2: "Runner.xcworkspace nicht gefunden"

**Lösung**:
```bash
# iOS-Struktur neu generieren
cd ..  # zurück zum Project Root
flutter clean
flutter pub get
flutter create --platforms=ios .
cd ios
open Runner.xcworkspace
```

### Problem 3: "Signing for Runner requires a development team"

**Lösung**:
1. In Xcode: **Runner** → **Signing & Capabilities**
2. **Team** auswählen (Apple Developer Account)
3. Oder kostenloses "Personal Team" nutzen

### Problem 4: "Pod install failed"

**Lösung**:
```bash
cd ios
pod deintegrate
pod install
```

---

## 💻 Alternative: Android Studio

Falls Xcode Probleme macht, kannst du Android Studio verwenden:

1. **Android Studio** öffnen
2. **File** → **Open**
3. Ordner `Minute-Master` wählen
4. Flutter Plugin wird automatisch erkannt
5. **Run** Button drücken

---

## 📱 Oder VS Code

1. **VS Code** öffnen
2. **File** → **Open Folder**
3. Ordner `Minute-Master` wählen
4. Flutter Extension installieren (falls nötig)
5. Run: F5 oder Terminal: `flutter run`

---

## ✅ Checkliste

- [ ] Git Repository geklont
- [ ] `flutter pub get` ausgeführt
- [ ] `flutter create --platforms=ios .` ausgeführt
- [ ] Xcode öffnet `Runner.xcworkspace`
- [ ] App läuft! 🎉

---

## 📞 Noch Probleme?

**Siehe**: `GITHUB_SETUP.md` für detaillierte Anleitung

**Oder**: Einfach die Befehle aus dem Abschnitt "SCHNELL-LÖSUNG" kopieren! ✨

---

## 🎉 Viel Erfolg!

Die App sollte jetzt funktionieren! 🚀

