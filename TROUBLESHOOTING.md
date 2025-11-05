# 🔧 Troubleshooting Guide

## Problem: DDS Connection Error
```
Error connecting to the service protocol: 
failed to connect to http://127.0.0.1:38730/...
```

### Lösungen (in dieser Reihenfolge probieren):

#### 1. **Mit `--no-dds` Flag starten** ✅ (Schnellste Lösung)
```bash
flutter run --no-dds
```

#### 2. **Emulator neu starten**
```bash
# Emulator schließen und neu starten
# Oder im AVD Manager: Emulator neu starten
```

#### 3. **Clean & Rebuild**
```bash
flutter clean
flutter pub get
flutter run
```

#### 4. **Dart Development Service Port freigeben**
```bash
# Prozess auf Port 38730 beenden
netstat -ano | findstr :38730
taskkill /PID [PID] /F
```

#### 5. **Mit release Flag bauen**
```bash
flutter run --release
```

---

## Problem: App stürzt beim Start ab

### Ursachen & Lösungen:

**1. Berechtigungen fehlen (Android)**
- Gehe zu: Settings → Apps → Minute Meister → Permissions
- Erteile: Camera, Storage

**2. Speicherplatz voll**
- Emulator: `adb shell pm trim-caches 0`

**3. App-Cache gelöscht nötig**
```bash
adb shell pm clear com.example.minute_master
```

---

## Problem: Kamera funktioniert nicht

### Debug-Schritte:

1. **Überprüfe Emulator-Einstellungen:**
   - AVD Manager → Emulator auswählen
   - Extended Controls → Camera → Enabled

2. **Test Image Picker direkt:**
```dart
// In der App:
// Klicke "Foto hinzufügen" → "Kamera"
// Sollte Kamera-App starten
```

3. **Logs anschauen:**
```bash
flutter logs
# Suche nach "image_picker" oder "Camera"
```

---

## Problem: Fotos werden nicht angezeigt

### Überprüfungen:

1. **Foto-Datei existiert:**
```dart
File(imagePath).existsSync() // sollte true sein
```

2. **Fallback funktioniert:**
- Wenn Foto fehlt → sollte Initialen-Avatar angezeigt werden

3. **Speicherplatz-Pfad:**
```bash
adb shell "ls -la /data/user/0/com.example.minute_master/documents/"
```

---

## Problem: App läuft langsam mit vielen Spielern

### Optimierungen:

1. **Bilder-Größe prüfen:**
```dart
// In setup_screen.dart: Image Quality ist auf 80% eingestellt
// Bei Bedarf auf 70% reduzieren
```

2. **Neue Runde starten:**
- Alte Runde beendet → Speicher wird freigegeben

3. **App neustarten:**
- Schließe App → Neu öffnen

---

## Problem: Build fehlgeschlagen

### Häufige Fehler:

**"Gradle task assembleDebug failed"**
```bash
flutter clean
flutter pub get
flutter build apk --debug
```

**"Dart SDK nicht gefunden"**
- Überprüfe: `flutter doctor -v`
- PATH-Umgebungsvariable aktualisieren

**"Plugin kompiliert nicht"**
```bash
flutter pub get
flutter pub cache repair
flutter pub upgrade
```

---

## Performance-Tipps

| Problem | Lösung |
|---------|--------|
| App träge | Weniger Spieler testen, 2-3 reichen |
| Emulator langsam | Hardware-Acceleration aktivieren |
| Speicher voll | App-Daten löschen: `adb shell pm clear ...` |
| Bilder verschwunden | App neustarten (Cache-Bug) |

---

## Debug-Befehle

### Logs anschauen:
```bash
flutter logs
```

### Emulator-Info:
```bash
adb shell getprop ro.build.version.sdk
```

### Verzeichnis-Inhalt:
```bash
adb shell ls -la /data/user/0/com.example.minute_master/documents/
```

### App-Crash-Logs:
```bash
adb logcat | grep flutter
```

---

## Wenn alles schiefgeht:

### Kernlösung:
```bash
# 1. Alles löschen
flutter clean
rm -r build
rm -r .dart_tool

# 2. Neu aufbauen
flutter pub get
flutter run --no-dds
```

### Mit Emulator-Reset:
```bash
# AVD Manager öffnen
# Emulator auswählen → Cold Boot Now
flutter run
```

---

## ✅ Wenn es funktioniert:

1. **App lädt:** ✓ SetupScreen sichtbar
2. **Button funktioniert:** ✓ "Foto hinzufügen" tappbar
3. **Kamera öffnet:** ✓ Oder Galerie-Dialog
4. **Foto speichert:** ✓ Im Grid sichtbar
5. **Spiel startet:** ✓ Task-Screen mit Foto

---

## 📞 Bei Fragen:

Siehe auch:
- `QUICK_START.md` - Erste Schritte
- `PHOTO_FEATURE_SUMMARY.md` - Feature-Übersicht
- `IMPLEMENTATION_GUIDE.md` - Technische Details

---

**Viel Erfolg! 🚀**

