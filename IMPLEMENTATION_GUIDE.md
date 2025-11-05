# 🎯 Implementierungs-Guide: Spieler-Fotos

## 📱 Übersicht der Änderungen

### Screen-Flow mit Fotos

```
┌─────────────────────────────────────────────────────────────┐
│                     START SCREEN                            │
│                  (Keine Änderungen)                         │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                  SETUP SCREEN (NEU!)                        │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Header: "Wer spielt mit?"                         │   │
│  │  Button: "Foto hinzufügen" (Camera + Gallery)      │   │
│  │  ┌─────────────────────────────────────────────┐   │   │
│  │  │  [Foto1] │ [Foto2]                         │   │   │
│  │  │ Spieler1 │ Spieler2                        │   │   │
│  │  │          │                                 │   │   │
│  │  │ [Delete] │ [Delete]                        │   │   │
│  │  └─────────────────────────────────────────────┘   │   │
│  │  Button: "Los geht's!" (ab 2 Spieler aktiv)       │   │
│  └─────────────────────────────────────────────────────┘   │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                  TASK SCREEN (UPDATED)                      │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Player Badge mit Foto:                            │   │
│  │  ┌─────┐                                           │   │
│  │  │Photo│ Spieler Name                             │   │
│  │  └─────┘                                           │   │
│  │  ────────────────────────────────────────────────  │   │
│  │  AUFGABE                                          │   │
│  │  "Mache XYZ..."                                   │   │
│  │  ────────────────────────────────────────────────  │   │
│  │  [Timer: 60 Sekunden]                             │   │
│  │  [Play Button]                                    │   │
│  └─────────────────────────────────────────────────────┘   │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                 RATING SCREEN (UPDATED)                     │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 ┌──────────┐                        │   │
│  │                 │  Photo   │ ← Spieler-Foto        │   │
│  │                 └──────────┘                        │   │
│  │              Spieler Name                          │   │
│  │          "Wie war die Leistung?"                   │   │
│  │          ⭐ ⭐ ⭐ ⭐ ⭐                               │   │
│  └─────────────────────────────────────────────────────┘   │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                  WINNER SCREEN ⭐ (NEU!)                    │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                    👑                              │   │
│  │                                                    │   │
│  │             ┌──────────────┐                       │   │
│  │             │              │                       │   │
│  │             │ GEWINN-FOTO  │ ← BIG & PROMINENT   │   │
│  │             │   (200x200)  │                       │   │
│  │             │              │                       │   │
│  │             └──────────────┘                       │   │
│  │                                                    │   │
│  │          ist der MINUTE MEISTER!                  │   │
│  │                                                    │   │
│  │  [Neue Runde] [Nach Hause]                        │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔧 Code-Struktur

### Player-Klasse (Neu)
```dart
// lib/models/player.dart
class Player {
  String name;
  String imagePath;  // Lokaler Pfad zum Foto
  
  Player({
    required this.name,
    required this.imagePath,
  });
}
```

### GameState Anpassungen
```dart
// Statt List<String> players
List<Player> players;

// Neue Methoden:
String? getCurrentPlayerImage()  // Aktuelles Foto
String? getWinnerImage()         // Gewinner-Foto
```

---

## 🎨 UI-Komponenten

### SetupScreen - Foto-Upload
```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,      // 2 Spalten
    childAspectRatio: 0.75, // Größere Höhe für Bilder
  ),
  itemBuilder: (context, index) {
    // Zeigt Spieler-Foto mit Name & Delete-Button
  },
)

// Image Picker Dialog
showDialog(
  builder: (context) => AlertDialog(
    title: Text('Foto aufnehmen'),
    actions: [
      TextButton('Kamera'),   // ImageSource.camera
      TextButton('Galerie'),  // ImageSource.gallery
    ],
  ),
)
```

### Winner-Screen - Großes Foto
```dart
Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 5),
    boxShadow: [/* Shadow Effect */],
  ),
  child: ClipOval(
    child: Image.file(File(imagePath), fit: BoxFit.cover),
  ),
)
```

---

## 💾 Dateienspeicherung

### Wie Fotos gespeichert werden

```dart
Future<String> _saveImageToLocal(XFile imageFile) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
  
  final File savedImage = await File(imageFile.path).copy(
    '${appDir.path}/$fileName',
  );
  
  return savedImage.path; // Rückgabe des lokalen Pfads
}

// Beispiel-Pfad:
// /data/user/0/com.example.minute_master/
//   documents/1730813456789.jpg
```

### Bildqualität
- **Kompression:** 80% (weniger Speicher)
- **Format:** JPG
- **Größe:** Typisch ~50-200 KB pro Foto
- **Speicherort:** App Documents (privat & sicher)

---

## ✅ Checkliste für Tester

### Setup-Screen
- [ ] "Foto hinzufügen" Button funktioniert
- [ ] Kamera startet korrekt
- [ ] Galerie öffnet sich
- [ ] Foto wird gespeichert und angezeigt
- [ ] Grid-Layout ist 2 Spalten
- [ ] Delete-Button entfernt Spieler
- [ ] Minimum 2 Spieler erforderlich
- [ ] "Los geht's!" Button ist disabled bei < 2 Spielern

### Task-Screen
- [ ] Spieler-Foto neben Name sichtbar
- [ ] Foto ist rund und hat Border
- [ ] Richtiger Spieler wird angezeigt
- [ ] Timer funktioniert normal

### Rating-Screen
- [ ] Spieler-Foto oben angezeigt
- [ ] Foto ist größer als auf Task-Screen
- [ ] Rating-Sterne funktionieren

### Winner-Screen
- [ ] Großes Gewinner-Foto in der Mitte
- [ ] Foto hat weiße Umrandung
- [ ] Pulsierende Animation funktioniert
- [ ] Confetti fällt noch immer
- [ ] "Neue Runde" & "Nach Hause" Buttons funktionieren

### Edge Cases
- [ ] App funktioniert mit 2 Spielern
- [ ] App funktioniert mit 5+ Spielern
- [ ] Fotos werden nach Runde beibehalten
- [ ] App startet neu ohne Fehler

---

## 🐛 Mögliche Fehler & Lösungen

### "Camera/Microphone permission denied"
- **Android:** Berechtigungen in AndroidManifest.xml prüfen
- **iOS:** Info.plist mit Camera permission aktualisieren

### "Bilder werden nicht angezeigt"
- Prüfen Sie: `File(imagePath).existsSync()`
- Fallback auf Initialen-Avatar funktioniert?

### "Speicher voll nach vielen Spielen"
- Bilder werden ~50-200 KB pro Foto
- Alte Fotos könnte man optional löschen

---

## 📚 Wichtige Code-Referenzen

| Feature | Datei | Zeilen |
|---------|-------|--------|
| Image Picker Integration | setup_screen.dart | 50-80 |
| Foto Speicherung | setup_screen.dart | 32-45 |
| GridView Layout | setup_screen.dart | 140-220 |
| Winner-Foto Display | winner_screen.dart | 140-180 |
| Player-Klasse | player.dart | 1-8 |
| GameState Updates | game_state.dart | 1-80 |

---

## 🚀 Nächste Schritte (Optional)

1. **Foto-Editor:** Foto zuschneiden/rotieren vor Speicherung
2. **Foto-Galerie:** Spielerfotos in separater Galerie-View
3. **Cloud Backup:** Fotos in Cloud speichern
4. **Filter:** Foto-Filter auf Winner-Screen
5. **Sound Effect:** Kamera-Sound beim Foto machen

---

Viel Erfolg! 🎮✨

