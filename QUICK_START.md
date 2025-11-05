# 🚀 Quick Start - Spieler-Foto Feature

## Installation & Start

### 1. Dependencies installieren
```bash
cd C:\Users\Tolgacvk\Minute-Master
flutter pub get
```

### 2. App starten
```bash
flutter run
```

## Erste Schritte im Spiel

### Setup-Screen
1. Klicke **"Spiel starten"** auf der Startseite
2. Auf der nächsten Seite: Klicke **"Foto hinzufügen"**
3. Wähle **"Kamera"** oder **"Galerie"**
4. Mach ein Foto von Spieler 1 (oder wähle ein Bild)
5. **Wiederhole** für Spieler 2+ (min. 2 erforderlich)
6. Klicke **"Los geht's!"**

### Während des Spiels
- 📷 Der aktuelle Spieler wird oben mit **Foto + Name** angezeigt
- ⏱️ Timer startet mit **Play-Button**
- ⭐ Nach Abschluss → Rating mit Sternen
- 📊 Punktetabelle wird angezeigt

### Siegesehrung
- 👑 Großes Foto des Gewinners in der Mitte
- 🎉 Confetti & Animation
- Buttons: **"Neue Runde"** oder **"Nach Hause"**

---

## 🎯 Feature-Übersicht

| Screen | Was neu ist |
|--------|-----------|
| Setup | 🎥 Foto-Upload statt Text-Input |
| Task | 👤 Spielerfoto neben Name |
| Rating | 👤 Größeres Spielerfoto |
| Winner | 🏆 **Riesen-Foto in Mitte** (NEU!) |
| Score | ✅ Funktioniert wie bisher |

---

## 🎮 Gameplay-Beispiel

### Szenario: 3 Spieler (Alice, Bob, Charlie)

```
1. Setup: 📸 Alice, Bob, Charlie machen Fotos
2. Runde 1: Alice spielt → Aufgabe → Rating → Punkte
3. Runde 2: Bob spielt → Aufgabe → Rating → Punkte
4. Runde 3: Charlie spielt → Aufgabe → Rating → Punkte
5. Runden 4-6: Wiederholung
6. Game Over: 
   ✨ Gewinner = Bob (3 Punkte)
   👑 SEIN GROßES FOTO WIRD ANGEZEIGT
   🎉 Confetti fällt!
```

---

## ❓ Häufige Fragen

### Wo werden die Fotos gespeichert?
- **Lokal auf dem Gerät** im App Documents Folder
- Nur die App hat Zugriff
- Werden bei App-Löschen gelöscht

### Kann ich ein Foto ändern?
- Momentan: Lösche den Spieler und füge ihn neu hinzu
- Feature für später: Foto-Editor

### Was ist die maximale Spieleranzahl?
- Technisch: Unbegrenzt
- Praktisch: 5-6 Spieler empfohlen (Grid passt gut)

### Funktioniert es ohne Internet?
- ✅ **JA** - Alles lokal, keine Cloud

---

## 🐛 Troubleshooting

### "Kamera funktioniert nicht"
- Überprüfe Berechtigungen in Android/iOS Einstellungen
- Starte App neu

### "Fotos werden nicht angezeigt"
- Überprüfe Speicherplatz
- App neu starten

### "Build fehlgeschlagen"
- `flutter clean`
- `flutter pub get`
- `flutter run`

---

## 📱 Tested auf

- Android (APK)
- iOS (wenn Build-Output grün ist)

---

## 💡 Tipps

1. **Beste Fotos:** Gutes Licht, klares Gesicht sichtbar
2. **Performance:** Fotos werden auf 80% Qualität komprimiert
3. **Storage:** ~50-200 KB pro Foto
4. **Spaß:** Lustige oder ernsthafte Fotos - eure Wahl! 😄

---

**Viel Spaß beim Spielen! 🎮✨**

Fragen? Siehe `PHOTO_FEATURE_SUMMARY.md` oder `IMPLEMENTATION_GUIDE.md`

