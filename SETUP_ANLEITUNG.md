# 📱 Setup-Anleitung - Schritt für Schritt

## 🎯 Das Ziel
Die App soll nur noch **Fotos** akzeptieren - KEIN Textfeld für Namen mehr!

✅ **Dies ist nun implementiert!**

---

## 🔧 Was wurde gefixt

### 1️⃣ Android-Berechtigungen 🔑
**Dateien:** `android/app/src/main/AndroidManifest.xml`

Hinzugefügt:
```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
```

**Warum?** Damit die App auf Kamera und Galerie zugreifen darf!

---

### 2️⃣ Bessere Fehlerbehandlung 🐛
**Datei:** `lib/screens/setup_screen.dart`

Hinzugefügt:
- ✅ Debug-Logs (helfen bei Fehlersuche)
- ✅ Error-Dialog (zeigt Fehler)
- ✅ Success-Meldung (grüne Bestätigung beim Spieler hinzufügen)

---

## 🚀 So startest du die App

### Schritt 1: Terminal öffnen
```bash
cd C:\Users\Tolgacvk\Minute-Master
```

### Schritt 2: Clean & Dependencies
```bash
flutter clean
flutter pub get
```

### Schritt 3: App starten
```bash
flutter run --no-dds
```

⏳ Warte bis die App im Emulator startet...

---

## 🎮 So spielst du

### 1. StartScreen - "Spiel starten" klicken
```
┌─────────────────────────┐
│   MINUTE MEISTER        │
│                         │
│  60 Sekunden.           │
│  Eine Aufgabe.          │
│  100% Chaos.            │
│                         │
│  [Spiel starten]  ← Klick hier!
└─────────────────────────┘
```

### 2. SetupScreen - Fotos machen!
```
┌─────────────────────────┐
│  Wer spielt mit?        │
│                         │
│ [Foto hinzufügen]  ← Klick!
│                         │
│  Füge Spieler hinzu    │
│  (Mindestens 2)        │
└─────────────────────────┘
```

### 3. Dialog - Quelle wählen
```
┌──────────────────────┐
│ Foto aufnehmen       │
│                      │
│ Wähle die Quelle:    │
│                      │
│ [Kamera] [Galerie]   │
└──────────────────────┘
```

### 4. Foto machen oder wählen
- **Kamera:** Mache ein Selfie! 🤳
- **Galerie:** Wähle ein Bild aus! 🖼️

### 5. Erfolg! ✅
```
┌────────────────────────────┐
│ ✅ Spieler 1 hinzugefügt!  │ ← Diese grüne Meldung oben!
└────────────────────────────┘

Grid zeigt dein Foto:
┌──────────────┐ ┌──────────────┐
│              │ │              │
│   Dein Foto  │ │  Leerer Platz│
│              │ │              │
│ Spieler 1    │ │              │
│   [Delete]   │ │              │
└──────────────┘ └──────────────┘
```

### 6. Wiederhole für Spieler 2+
```
┌──────────────┐ ┌──────────────┐
│              │ │              │
│   Foto 1     │ │   Foto 2     │
│              │ │              │
│ Spieler 1    │ │ Spieler 2    │
│   [Delete]   │ │   [Delete]   │
└──────────────┘ └──────────────┘
```

### 7. "Los geht's!" klicken
```
┌────────────────────────────┐
│ [Los geht's!]  ← Jetzt aktiv!
│                            │
│ (Wird aktiv wenn 2+ Spieler)
└────────────────────────────┘
```

---

## 🎯 TaskScreen - Spielen!
```
┌─────────────────────────┐
│ ┌─────────────────────┐ │
│ │ 👤 Alice      [Foto]│ │ ← Spieler + Foto!
│ └─────────────────────┘ │
│                         │
│   AUFGABE               │
│ "Mach einen Handstand!" │
│                         │
│      [60 Sekunden]      │
│   [▶ Play Button]       │
└─────────────────────────┘
```

---

## ⭐ RatingScreen - Bewertung
```
┌─────────────────────────┐
│                         │
│   ┌──────────┐          │
│   │          │          │
│   │ Alice's  │          │
│   │   Foto   │          │
│   │          │          │
│   └──────────┘          │
│                         │
│    Alice                │
│ "Wie war die Leistung?" │
│                         │
│  ⭐ ⭐ ⭐ ⭐ ⭐          │
└─────────────────────────┘
```

---

## 👑 WinnerScreen - GROSSES FOTO!
```
┌─────────────────────────┐
│          👑             │
│                         │
│   ┌────────────────┐    │
│   │                │    │
│   │  BOB'S FOTO    │    │ ← 200x200px!
│   │  (RIESIG!)     │    │
│   │                │    │
│   └────────────────┘    │
│                         │
│      ist der            │
│   MINUTE MEISTER!       │
│                         │
│  [Neue Runde] [Hause]   │
└─────────────────────────┘

🎉 Confetti fällt!
```

---

## 🔍 Debug-Tipps

### Im Terminal siehst du:
```
🎥 Starten Foto-Auswahl mit Source: ImageSource.camera
📸 Bild gewählt: /path/to/photo.jpg
💾 Speichere Bild...
✅ Bild gespeichert: /data/user/0/com.example.minute_master/documents/...jpg
✨ Spieler hinzugefügt: 1
```

### Falls Fehler:
```
❌ FEHLER beim Auswählen des Bildes: PermissionDeniedException
→ Dialog wird angezeigt: "Fehler: PermissionDeniedException"
```

---

## ⚠️ Häufige Fehler

### "Kamera funktioniert nicht"
- Überprüfe in Android: Settings → Apps → Minute Meister → Permissions → Camera = ON

### "Foto wird nicht angezeigt"
- App neustarten: Schließe App ganz und öffne neu

### "Green Success Message nicht sichtbar"
- Schaue oben auf dem Screen (SnackBar)
- Bleibt 2 Sekunden sichtbar

### "Build fehlgeschlagen"
```bash
flutter clean
flutter pub get
flutter run --no-dds
```

---

## ✅ Finale Checkliste

Wenn alles funktioniert:

- [ ] App startet ohne Fehler
- [ ] StartScreen: "Spiel starten" Buttons sichtbar
- [ ] SetupScreen: "Foto hinzufügen" Button sichtbar
- [ ] Dialog: "Kamera" oder "Galerie" wählbar
- [ ] Foto wird aufgenommen/gewählt
- [ ] ✅ Grüne "Spieler hinzugefügt!" Meldung
- [ ] Foto im Grid sichtbar mit Name "Spieler 1"
- [ ] Wiederhole für Spieler 2 erfolgreich
- [ ] "Los geht's!" Button wird grün/aktiv
- [ ] TaskScreen zeigt Spielerfoto oben
- [ ] Nach Aufgabe: RatingScreen mit Foto
- [ ] Nach Rating: ScoreScreen mit Spielernamen
- [ ] Nach allen Runden: WinnerScreen
- [ ] 👑 **RIESIGES FOTO IN MITTE!** ← Das ist das coolste!

---

## 🎮 Beispiel-Ablauf (komplett)

```
1. App starten → flutter run --no-dds
2. StartScreen → "Spiel starten"
3. SetupScreen → "Foto hinzufügen"
4. Dialog → "Kamera"
5. Selfie machen 🤳
6. ✅ "Spieler 1 hinzugefügt!" (grün oben)
7. Grid zeigt Foto
8. "Foto hinzufügen" wieder
9. Dialog → "Galerie"
10. Bild wählen
11. ✅ "Spieler 2 hinzugefügt!" (grün)
12. Grid zeigt beide Fotos
13. "Los geht's!"
14. TaskScreen: Alice mit Foto
15. Timer: 60 Sekunden
16. Play drücken → zählt runter
17. RatingScreen: Sterne geben
18. ScoreScreen: Punkte zeigen
19. Nächste Runde: Bob spielt
20. ... mehr Runden ...
21. WinnerScreen: GROSSES GEWINNER-FOTO! 👑
22. [Neue Runde] oder [Nach Hause]
```

---

## 🎉 Fertig!

Du hast die App mit Spieler-Fotos erfolgreich eingerichtet!

### Nächstes Mal einfach:
```bash
flutter run --no-dds
```

**Viel Spaß! 🎮✨**

---

**Fragen?** Siehe:
- `README.md` - Übersicht
- `TROUBLESHOOTING.md` - Fehlersuche
- `FIXES_APPLIED.md` - Was wurde gefixt

