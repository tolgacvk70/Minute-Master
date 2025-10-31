# 📱 Store-Release Anleitung für Minute Meister

Diese Anleitung führt dich durch die Veröffentlichung der Minute Meister App im **App Store** (iOS) und **Google Play Store** (Android).

---

## 📋 Vorbereitungen

### Für beide Stores benötigst du:

1. ✅ **Bundle ID / Package Name**
   - iOS: `de.minutemeister.app`
   - Android: `de.minutemeister.app`

2. ✅ **App-Icons**
   - iOS: 1024x1024px PNG (ohne Alpha-Kanal)
   - Android: 512x512px (Mindestgröße)

3. ✅ **Screenshots**
   - Mindestens für iPhone (6,5") und Android (Phone)
   - Empfohlen: 5 Screenshots pro Plattform

4. ✅ **App-Beschreibung**
   - Deutsch und Englisch
   - Kurzbeschreibung + Volltext

---

## 🍎 App Store (iOS) - Schritt für Schritt

### 1. Apple Developer Account

- **Kosten**: $99/Jahr (jährliche Abo)
- **Erstellen**: https://developer.apple.com

### 2. App in Xcode öffnen

```bash
cd ios
open Runner.xcworkspace
```

### 3. Signing & Capabilities konfigurieren

In Xcode:
1. Wähle Projekt → Target "Runner"
2. Tab **Signing & Capabilities**
3. Team auswählen
4. Bundle Identifier: `de.minutemeister.app`

### 4. App-Info anpassen

In `ios/Runner/Info.plist`:
- `CFBundleDisplayName`: "Minute Meister"
- Version: 1.0.0

### 5. App Icon hinzufügen

```bash
# Füge dein Icon hinzu
# ios/Runner/Assets.xcassets/AppIcon.appiconset/
```

**Format**: 1024x1024px PNG ohne Alpha-Kanal

### 6. Release Build erstellen

In Xcode:
1. **Product** → **Archive**
2. Nach erfolgreicher Erstellung:
   - **Distribute App**
   - **App Store Connect**
   - **Upload**

### 7. App Store Connect

1. Gehe zu https://appstoreconnect.apple.com
2. **Meine Apps** → **+ Neue App**
3. Fülle aus:
   - **Name**: Minute Meister
   - **Primäre Sprache**: Deutsch
   - **Bundle ID**: de.minutemeister.app
   - **SKU**: minutemeister-001

### 8. App-Informationen

**Kurzzeile**:  
```
60 Sekunden. Eine Aufgabe. 100% Chaos.
```

**Vollbeschreibung**:
```
MINUTE MEISTER
60 Sekunden. Eine Aufgabe. 100% Chaos.

🎮 Das ultimative Partyspiel!

Spiele mit deinen Freunden das schnellste und lustigste Partyspiel! Eine Person hält das Handy, die anderen spielen live mit. Jede Runde gibt's eine verrückte 60-Sekunden-Aufgabe - und am Ende wird der Minute Meister gekrönt!

✨ FEATURES:
• 45+ einzigartige Aufgaben
• 60-Sekunden-Timer mit Animationen
• 5-Sterne-Bewertungssystem
• Live-Punktestand
• Buntes, fröhliches Design
• Perfekt für Partys & Events

🎯 WIE FUNKTIONIERT'S:
1. Spieler hinzufügen
2. Zufällige Aufgabe erhalten
3. 60 Sekunden zeigen was du kannst
4. Von der Gruppe bewerten lassen
5. Minute Meister werden!

KOSTENLOS. KEINE WERBUNG. REINER SPASS.
```

### 9. Screenshots hochladen

**Benötigte Größen**:
- iPhone (6,5"): 1284 x 2778
- iPhone (6,7"): 1290 x 2796

**Tipp**: Spiel einmal durch und mache Screenshots von allen Screens!

### 10. App übermitteln

1. Im App Store Connect auf **"Zur Review einreichen"**
2. Apple prüft die App (meist 1-2 Tage)
3. Bei Genehmigung: **LIVE!** 🎉

---

## 🤖 Google Play Store (Android) - Schritt für Schritt

### 1. Google Play Developer Account

- **Kosten**: $25 einmalig (lebenslang)
- **Erstellen**: https://play.google.com/console

### 2. App Signing konfigurieren

**Wichtig**: Zeichne deine App vor dem Upload!

```bash
# Release-Build erstellen
flutter build appbundle --release

# Oder APK:
flutter build apk --release
```

### 3. Keystore erstellen (falls noch nicht vorhanden)

```bash
# Erstelle einen neuen Keystore
keytool -genkey -v -keystore ~/minute-master-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Passwort notieren!
```

### 4. Signing konfigurieren

Erstelle: `android/key.properties`
```properties
storePassword=DEIN_PASSWORT
keyPassword=DEIN_PASSWORT
keyAlias=upload
storeFile=/Pfad/zu/deinem/Keystore.jks
```

### 5. build.gradle anpassen

In `android/app/build.gradle` (oben hinzufügen):
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

### 6. Release-Build

```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

### 7. Google Play Console

1. Gehe zu https://play.google.com/console
2. **App erstellen**
3. Fülle aus:
   - **App-Name**: Minute Meister
   - **Standardsprache**: Deutsch
   - **App oder Game**: Game
   - **Kostenlos** oder **Kostenpflichtig**?

### 8. App-Informationen

**Kurzbeschreibung** (max. 80 Zeichen):
```
60 Sekunden. Eine Aufgabe. 100% Chaos.
```

**Vollständige Beschreibung**:
```
Minute Meister - Das ultimative Partyspiel!

🎮 60 SEKUNDEN. EINE AUFGABE. 100% CHAOS.

Das schnellste und lustigste Partyspiel für Gruppen! Eine Person hält das Handy, die anderen spielen live mit. Jede Runde gibt's eine verrückte 60-Sekunden-Aufgabe - und am Ende wird der Minute Meister gekrönt!

✨ FEATURES:
• 45+ einzigartige Aufgaben in 3 Schwierigkeitsstufen
• 60-Sekunden-Timer mit Animationen
• 5-Sterne-Bewertungssystem
• Live-Punktestand und Rankings
• Konfetti-Feier beim Gewinner
• Buntes, fröhliches Design
• Perfekt für Partys & Events
• Komplett offline verfügbar

🎯 SPIELABLAUF:
1. Füge 2+ Spieler hinzu
2. Erhalte eine zufällige Aufgabe
3. Zeige 60 Sekunden was du kannst
4. Lasse dich von der Gruppe bewerten
5. Werde Minute Meister! 👑

KOSTENLOS. KEINE WERBUNG. REINER SPASS.
```

**Kategorien**: Party / Unterhaltung

### 9. Screenshots hochladen

**Benötigt**:
- Smartphone: Mindestens 2 Screenshots
- Tablet (optional)

**Formate**:
- Screenshot: 16:9 oder 9:16
- Feature Graphic: 1024 x 500px

### 10. Content Rating

- Fragebogen ausfüllen
- **PEGI**: 3+
- **USK**: 0+

### 11. App übermitteln

1. **Bundle hochladen** (`app-release.aab`)
2. Google prüft die App (1-7 Tage)
3. Bei Genehmigung: **LIVE!** 🎉

---

## 🎨 App Icons erstellen

### iOS (1024x1024px)

**Design-Tipps**:
- Großes "M" für "Minute Meister"
- Gelb/Orange Hintergrund
- Spielerische, bunte Optik
- Keine Transparenz (Alpha-Kanal)

**Tools**:  
- Canva: https://canva.com
- AppIcon.co: https://www.appicon.co

### Android (512x512px)

**Format**: PNG
**Hintergrund**: Ratsam bunt, da Apps hinter Icon-Formen erscheinen

---

## 📸 Screenshots für Stores

### Wichtige Screenshots:

1. **Start-Bildschirm** - Titel & Animation
2. **Setup-Bildschirm** - Spielerverwaltung
3. **Aufgaben-Bildschirm** - Timer & Aufgabe
4. **Bewertungsbildschirm** - Sterne-System
5. **Siegerbildschirm** - Konfetti-Feier

### Screenshot-Tools:

- **Figma**: Mockups erstellen
- **iOS Simulator**: Screenshots
- **Android Studio**: Screenshots

---

## 💰 Kosten & Entscheidungen

### Kosten:
- **Apple Developer**: $99/Jahr
- **Google Play**: $25 einmalig

### Monetarisierung:
- ✅ **Kostenlos** mit Werbung? (AdMob)
- ✅ **Premium-Version**? (Mehr Aufgaben, kein Werbung)
- ✅ **In-App-Käufe**? (Themenpacks, mehr Aufgaben)

---

## ✅ Checkliste vor dem Release

### Code:
- [ ] App läuft ohne Fehler
- [ ] Portrait-Modus erzwungen
- [ ] App-Icons vorhanden
- [ ] Keine Debug-Consolen-Logs

### Testing:
- [ ] Auf echtem Gerät getestet
- [ ] Alle Screens funktionieren
- [ ] Sounds & Haptics funktionieren
- [ ] Konfetti funktioniert

### Store:
- [ ] Beschreibung geschrieben
- [ ] Screenshots erstellt
- [ ] Privatsphäre-Richtlinie (falls nötig)
- [ ] App-Icons hochgeladen

---

## 🎯 Nach dem Release

1. **Monitoring**: Crash Reports im Auge behalten
2. **User-Feedback**: Auf Reviews reagieren
3. **Updates**: Regelmäßig neue Aufgaben hinzufügen
4. **Marketing**: Social Media, Influencer

---

**Viel Erfolg! 🚀**

