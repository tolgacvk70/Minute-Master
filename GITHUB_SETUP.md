# 📦 Projekt von GitHub öffnen - Anleitung

Diese Anleitung erklärt, wie dein Kollege das Projekt auf seinem Mac in Xcode öffnen kann.

---

## 🚨 Problem: "Could not open code"

Wenn Xcode sagt "Could not open code", liegt es daran, dass die Flutter-Struktur nicht vollständig generiert wurde.

---

## ✅ RICHTIGE WEISE - So öffnet dein Kollege das Projekt

### 🚀 Schnellste Lösung - Automatisches Setup

```bash
# 1. Von GitHub klonen
git clone https://github.com/tolgacvk70/Minute-Master.git
cd Minute-Master

# 2. Setup-Script ausführen (macht alles automatisch!)
./ios_setup.sh

# 3. Xcode öffnen
cd ios
open Runner.xcworkspace
```

**Fertig!** Das Script prüft Flutter, installiert Dependencies und erstellt die iOS-Struktur. ✅

---

### 📝 Manuelle Lösung (wenn Script nicht funktioniert)

### 1️⃣ Von GitHub klonen

```bash
git clone https://github.com/tolgacvk70/Minute-Master.git
cd Minute-Master
```

### 2️⃣ Flutter installieren (falls nötig)

Prüfe, ob Flutter installiert ist:
```bash
flutter doctor
```

Falls nicht installiert: https://flutter.dev

### 3️⃣ Dependencies installieren

```bash
flutter pub get
```

### 4️⃣ iOS-Struktur erstellen/aktualisieren

```bash
flutter create --platforms=ios .
```

**Dieser Befehl erstellt die komplette iOS-Struktur!**

### 5️⃣ Xcode öffnen

```bash
cd ios
open Runner.xcworkspace
```

**WICHTIG**: Immer `.xcworkspace` öffnen, NICHT `.xcodeproj`!

---

## 📁 Alternative: Android Studio / VS Code

Dein Kollege kann das Projekt auch in Android Studio öffnen:

1. Android Studio öffnen
2. **File** → **Open**
3. Ordner `Minute-Master` wählen
4. Flutter Plugin wird automatisch erkannt

Oder in VS Code:
1. VS Code öffnen
2. **File** → **Open Folder**
3. `Minute-Master` wählen
4. Flutter Extension installieren (falls nötig)

---

## 🔧 Troubleshooting

### Problem: "flutter: command not found"

**Lösung**: Flutter installieren
```bash
# macOS:
brew install flutter
```

### Problem: "Runner.xcworkspace nicht gefunden"

**Lösung**: iOS-Struktur erstellen
```bash
flutter create --platforms=ios .
```

### Problem: "Pod install failed"

**Lösung**: CocoaPods neu installieren
```bash
cd ios
pod deintegrate
pod install
```

### Problem: "Signing for Runner requires a development team"

**Lösung**: In Xcode Team auswählen
1. Projekt in Xcode öffnen
2. **Runner** → **Signing & Capabilities**
3. **Team** auswählen (Apple Developer Account)

---

## 🎯 Korrekte Projektstruktur

```
Minute-Master/
├── ios/
│   ├── Runner/
│   │   ├── AppDelegate.swift
│   │   ├── Info.plist
│   │   ├── Main.storyboard
│   │   └── LaunchScreen.storyboard
│   ├── Runner.xcodeproj/
│   ├── Runner.xcworkspace/     ← HIER öffnen!
│   └── Podfile
├── android/
├── lib/                         ← DAS ist der eigentliche Code
└── pubspec.yaml
```

---

## 💡 Schnellstart für deinen Kollegen

**Kopiere diese Befehle in Terminal:**

```bash
# 1. Projekt klonen
git clone <dein-repo-url>
cd Minute-Master

# 2. Dependencies installieren
flutter pub get

# 3. iOS-Struktur erstellen
flutter create --platforms=ios .

# 4. Öffnen in Xcode
cd ios
open Runner.xcworkspace
```

Fertig! ✅

---

## 📝 Wichtig

✅ **Immer `.xcworkspace` öffnen**, nicht `.xcodeproj`  
✅ **Erst `flutter create` ausführen**, falls Dateien fehlen  
✅ **`flutter pub get`** vor dem Öffnen ausführen  

Das `flutter create --platforms=ios .` Kommando ist der Schlüssel zum Erfolg!

---

## 🎯 Zusammenfassung

**Dein Kollege muss:**

1. Git Repository klonen
2. `flutter pub get` ausführen
3. `flutter create --platforms=ios .` ausführen
4. `open ios/Runner.xcworkspace` in Xcode öffnen

**Das war's!** Die App sollte jetzt funktionieren! 🚀

