# 🎮 Minute Master - Mit Spieler-Fotos!

## 📱 Überblick

**Minute Master** ist eine chaotische Party-Game-App, bei der Spieler in 60 Sekunden verrückte Aufgaben erfüllen müssen. 

### ✨ Neu: Spieler-Fotos!
Statt Namen einzutippen, machen die Spieler einfach ein Foto von sich selbst - und sehen sich dann im großen Stil bei der Siegesehrung! 👑

---

## 🎯 Hauptfeatures

### 🎥 Setup mit Fotos
- Keine langweiligen Namen-Eingaben mehr!
- Kamera oder Galerie: **Wähle eine Quelle**
- Automatisch speichert die App deine Fotos
- Minimum 2 Spieler zum Starten

### ⏱️ 60-Sekunden Herausforderung
- Zufälliger Spieler wird gewählt
- Aufgabe wird angezeigt
- Timer läuft...
- Spielerfoto wird oben angezeigt!

### ⭐ Bewertung nach jeder Runde
- Wie war die Leistung? (1-5 Sterne)
- Spielerfoto zur Bestätigung

### 👑 Grandiose Siegesehrung
- **RIESIGES GEWINNER-FOTO in der Mitte!**
- Pulsierendes Scaling-Animation
- Confetti fällt!
- Weiße Umrandung + elegante Effekte

---

## 🚀 Installation & Start

### 1. Projekt klonen/öffnen
```bash
cd C:\Users\Tolgacvk\Minute-Master
```

### 2. Dependencies installieren
```bash
flutter pub get
```

### 3. App starten
```bash
flutter run --no-dds
```

### 4. Spielen!
- "Spiel starten"
- "Foto hinzufügen" (2x)
- "Kamera" oder "Galerie"
- Foto machen/wählen
- "Los geht's!"

---

## 📸 Screenshot-Flow

```
START SCREEN
    ↓
SETUP SCREEN (Fotos!)
  [Foto1] [Foto2] 
  [Foto3] [Foto4]
  "Los geht's!"
    ↓
TASK SCREEN (Spieler + Foto oben)
  👤 Alice
  📸 [Foto]
  ⏱️ 60 SEKUNDEN
  AUFGABE: "Mach einen Handstand!"
    ↓
RATING SCREEN (Foto größer)
  👤 Alice
  📸 [Größeres Foto]
  ⭐⭐⭐⭐⭐
    ↓
SCORE SCREEN
  1. Bob (3 Punkte)
  2. Alice (2 Punkte)
  3. Charlie (1 Punkt)
    ↓
NEXT ROUND / WINNER SCREEN
  
  [Nach 6 Runden]
  
  👑
  ┌──────────────┐
  │              │
  │ BOB'S FOTO   │ ← **GIGANTISCH!**
  │  (200x200)   │
  │              │
  └──────────────┘
  
  ist der MINUTE MEISTER!
  🎉 Confetti fällt!
```

---

## 📁 Datei-Struktur

```
lib/
├── main.dart                    # App-Entry & Navigation
├── models/
│   └── game_state.dart         # Player + GameState
├── screens/
│   ├── start_screen.dart       # Startseite
│   ├── setup_screen.dart       # 📸 Foto-Setup (NEU!)
│   ├── task_screen.dart        # Aufgabe mit Foto
│   ├── rating_screen.dart      # Bewertung mit Foto
│   ├── score_screen.dart       # Aktueller Score
│   └── winner_screen.dart      # 👑 GROSSES FOTO!
└── widgets/
    └── bouncing_widget.dart    # Animation

android/
└── app/src/main/
    └── AndroidManifest.xml     # 🔑 Berechtigungen

pubspec.yaml                     # Dependencies
```

---

## 🛠️ Technische Details

### Dependencies
```yaml
flutter:
  - sdk

confetti: ^0.7.0              # Confetti-Animation
google_fonts: ^6.1.0          # Schöne Fonts
image_picker: ^1.0.0          # 📸 Foto-Auswahl
path_provider: ^2.1.0         # Lokale Speicherung
```

### Android-Berechtigungen
```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
```

### Foto-Speicherung
- **Ort:** `/data/user/0/com.example.minute_master/documents/`
- **Größe:** ~50-200 KB (80% Kompression)
- **Format:** JPG
- **Sicher:** Nur die App hat Zugriff

---

## 🎮 Gameplay

### Beispiel mit 3 Spielern

```
Setup:
1. Alice macht Selfie 📸
2. Bob macht Selfie 📸
3. Charlie macht Selfie 📸
→ "Los geht's!"

Runden:
Runde 1: Alice → Aufgabe → Rating (⭐⭐⭐) → 3 Punkte
Runde 2: Bob → Aufgabe → Rating (⭐⭐⭐⭐) → 4 Punkte
Runde 3: Charlie → Aufgabe → Rating (⭐⭐) → 2 Punkte
Runde 4: Alice → Aufgabe → Rating (⭐⭐⭐⭐⭐) → 5 Punkte
Runde 5: Bob → Aufgabe → Rating (⭐⭐) → 2 Punkte
Runde 6: Charlie → Aufgabe → Rating (⭐⭐⭐) → 3 Punkte

Endergebnis:
1. Bob: 6 Punkte 👑
   [RIESIGES BOB-FOTO!]
2. Alice: 8 Punkte
3. Charlie: 5 Punkte
```

---

## 📚 Dokumentation

- **`QUICK_START.md`** - Schnelleinstieg
- **`PHOTO_FEATURE_SUMMARY.md`** - Feature-Übersicht
- **`IMPLEMENTATION_GUIDE.md`** - Technische Details
- **`TROUBLESHOOTING.md`** - Fehlersuche
- **`FIXES_APPLIED.md`** - Behobene Fehler

---

## ✅ Was funktioniert

- ✓ Foto-Upload (Kamera + Galerie)
- ✓ Spieler-Grid (2 Spalten)
- ✓ Foto-Speicherung (lokal)
- ✓ Spielerfoto auf Task-Screen
- ✓ Spielerfoto auf Rating-Screen
- ✓ **GROSSES GEWINNER-FOTO** auf Winner-Screen
- ✓ Animations & Effekte
- ✓ Error-Handling
- ✓ Success-Meldungen

---

## 🎨 UI/UX

### Designsystem
- **Primär:** Rot (#FF3B30)
- **Sekundär:** Gelb (#FFD60A)
- **Tertär:** Blau (#007AFF)
- **Mint:** (#40E0D0)
- **Violett:** (#C77DFF)

### Animationen
- 🔄 Pulsierendes Scaling (Winner-Foto)
- ✨ Bounce-Animation (Titel)
- 🌟 Confetti-Effekte
- 🎯 Smooth Transitions

---

## 🐛 Häufige Probleme

| Problem | Lösung |
|---------|--------|
| Kamera funktioniert nicht | Berechtigungen in Android-Einstellungen |
| Fotos nicht sichtbar | App neustarten |
| Build fehlgeschlagen | `flutter clean` + `flutter pub get` |
| DDS-Fehler beim Start | `flutter run --no-dds` |

Siehe `TROUBLESHOOTING.md` für mehr!

---

## 🔄 Updates & Roadmap

### Implementiert ✅
- [x] Spieler-Fotos
- [x] Setup mit Foto-Grid
- [x] Foto-Upload (Kamera + Galerie)
- [x] Winner-Foto groß angezeigt
- [x] Error-Handling

### Zukünftig (Optional)
- [ ] Foto-Editor (zuschneiden, Filter)
- [ ] Cloud-Backup
- [ ] Galerie-View aller Fotos
- [ ] Photo-Frames & Sticker
- [ ] Social Sharing

---

## 📞 Support

**Probleme?**
1. Schau `TROUBLESHOOTING.md`
2. Sieh dir Debug-Logs an (`flutter logs`)
3. Starte App neu
4. `flutter clean` + `flutter pub get`

---

## 📄 Lizenz

Minute Master - Made with ❤️ und Flutter

---

## 🎉 Viel Spaß!

Genießt eure chaotischen 60 Sekunden mit großen Gewinner-Fotos! 📸👑✨

```
flutter run --no-dds
```

**Let's go!** 🚀
