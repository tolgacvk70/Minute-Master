# 🍎 iOS Quick Start

## 🚀 So startest du auf iOS in 3 Schritten

### 1️⃣ Dependencies
```bash
cd C:\Users\Tolgacvk\Minute-Master
flutter pub get
```

### 2️⃣ iOS Simulator starten
```bash
# Option A: Spezifisches Modell
flutter run -d "iPhone 14 Pro" --no-dds

# Option B: Verfügbarer Simulator
flutter run -d "iPhone" --no-dds

# Option C: Alle Geräte (Android + iOS)
flutter run -d all --no-dds
```

### 3️⃣ Spielen! 🎮
- "Spiel starten"
- "Foto hinzufügen"
- "Kamera" oder "Galerie" wählen
- Foto machen/wählen
- ✅ Spieler hinzugefügt!

---

## 📱 Mit echtem iPhone

### 1. iPhone verbinden (Mac nötig!)
```bash
# Kabel anstecken oder WLAN-Debugging

# Geräte anzeigen:
flutter devices

# Sollte dein iPhone zeigen:
# Tobis-iPhone (mobile) • 12345... • ios • iOS 17.0
```

### 2. App starten
```bash
flutter run --no-dds
# Dann: Dein iPhone aus der Liste wählen
```

### 3. App vertrauen (erste Nutzung!)
```
Auf iPhone:
Settings → General → VPN & Device Management
→ [Entwickler-App] → Vertrauen
```

---

## ✅ Was wird abgefragt

### Dialog 1: Kamera
```
"Minute Meister" möchte auf 
deine Kamera zugreifen.

Die App benötigt Zugriff auf deine Kamera, 
um Fotos von dir zu machen. 
Die Fotos werden nur lokal auf deinem 
Gerät gespeichert.

[Nicht erlauben] [Erlauben]
```
→ Klick: **Erlauben** ✅

### Dialog 2: Galerie
```
"Minute Meister" möchte auf 
deine Fotos zugreifen.

Die App benötigt Zugriff auf deine Fotogalerie, 
um Bilder für das Spiel auszuwählen.

[Nicht erlauben] [Erlauben]
```
→ Klick: **Erlauben** ✅

---

## 🎯 Checkliste

- [ ] `flutter pub get` erfolgreich
- [ ] iOS Simulator/iPhone startet
- [ ] App öffnet sich
- [ ] StartScreen sichtbar
- [ ] "Spiel starten" funktioniert
- [ ] SetupScreen erscheint
- [ ] "Foto hinzufügen" Button tappbar
- [ ] Dialog: "Kamera" oder "Galerie"
- [ ] Kamera öffnet sich (oder Galerie)
- [ ] Foto wird gemacht/gewählt
- [ ] ✅ Grüne Meldung "Spieler 1 hinzugefügt!"
- [ ] Foto im Grid sichtbar
- [ ] Wiederhole für Spieler 2
- [ ] "Los geht's!" Button aktiv
- [ ] TaskScreen mit Spielerfoto
- [ ] Nach Spiel: WinnerScreen
- [ ] 👑 **GROSSES FOTO IN MITTE!**

---

## 🐛 Häufige Fehler auf iOS

| Fehler | Lösung |
|--------|--------|
| `xcode not found` | Xcode installieren oder `open ios/Runner.xcworkspace` |
| `CocoaPods error` | `cd ios && pod install && cd ..` |
| Simulator startet nicht | In Xcode: Device → Manage Simulators → Create neue |
| Kamera-Dialog nicht sichtbar | App neustarten, Settings überprüfen |
| Galerie zeigt keine Fotos | Photos App öffnen, Fotos hinzufügen |
| Foto wird dunkel | Hellere Umgebung nutzen, Zoom reduzieren |

---

## 📁 iOS-Dateien (was wurde geändert)

```
ios/
└── Runner/
    └── Info.plist  ← 🔑 Berechtigungen hier!
```

**Berechtigungen hinzugefügt:**
- ✅ NSCameraUsageDescription
- ✅ NSPhotoLibraryUsageDescription
- ✅ NSPhotoLibraryAddOnlyUsageDescription
- ✅ NSMicrophoneUsageDescription (zukünftig)

---

## 🔄 Workflow iOS-Testing

```
┌─────────────────────────────────────┐
│ 1. Terminal: flutter run --no-dds   │
└────────────┬────────────────────────┘
             │
             ↓
┌─────────────────────────────────────┐
│ 2. Simulator/iPhone startet        │
│    (oder wählen wenn mehrere)       │
└────────────┬────────────────────────┘
             │
             ↓
┌─────────────────────────────────────┐
│ 3. App lädt & startet              │
│    (erste Nutzung: etwas länger)   │
└────────────┬────────────────────────┘
             │
             ↓
┌─────────────────────────────────────┐
│ 4. StartScreen sichtbar            │
│    Tests starten!                  │
└─────────────────────────────────────┘
```

---

## 💡 iOS vs Android (praktisch)

| iOS | Android |
|-----|---------|
| Konsistent | Variabel |
| Einfacher Build | Komplexerer Build |
| iCloud Backup | Google Backup |
| App Store Review | Schnellerer Upload |
| Teurere Hardware | Günstigere Hardware |
| Längerer Support | Kürzerer Support |

---

## 🎉 Fertig!

Jetzt kannst du auf iOS spielen! 🍎🎮

### Nächstes Mal:
```bash
flutter run -d "iPhone 14 Pro" --no-dds
```

### Für Produktion (App Store):
```bash
flutter build ipa
# Dann in App Store Connect hochladen
```

**Viel Spaß auf iOS! 📱✨**

