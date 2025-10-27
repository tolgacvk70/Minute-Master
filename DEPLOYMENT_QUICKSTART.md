# 🚀 Deployment Quick Start für Minute Meister

Schnelle Anleitung für die Veröffentlichung im App Store & Play Store.

---

## ✅ Was du hast

- ✅ **Flutter App** - Vollständig implementiert
- ✅ **iOS Konfiguration** - Ready für Xcode
- ✅ **Android Konfiguration** - Ready für Android Studio
- ✅ **45+ Aufgaben** - Einzigartige Spieler-Aufgaben

---

## 🍎 iOS - Xcode Launch (ca. 30 Min)

### 1. Xcode öffnen

```bash
cd ios
open Runner.xcworkspace
```

Wenn `.xcworkspace` fehlt:
```bash
flutter create --platforms=ios .
```

### 2. Apple Developer Account

- Registriere dich: https://developer.apple.com
- $99/Jahr

### 3. Signing einrichten

In Xcode:
1. **Runner** → **Signing & Capabilities**
2. Team auswählen
3. Bundle ID: `de.minutemeister.app`

### 4. Build & Upload

```bash
# Terminal in Xcode:
flutter build ios --release

# Dann in Xcode:
Product → Archive → Distribute
```

### 5. App Store Connect

https://appstoreconnect.apple.com

- Neue App anlegen
- App-Beschreibung (siehe `STORE_RELEASE_GUIDE.md`)
- Screenshots hochladen
- Review einreichen

**Timing**: 1-2 Tage für Review

---

## 🤖 Android - Play Store Launch (ca. 30 Min)

### 1. Google Play Console Account

- Registriere dich: https://play.google.com/console
- $25 einmalig

### 2. Keystore erstellen

```bash
keytool -genkey -v -keystore ~/minute-master-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload
```

**WICHTIG**: Passwort notieren!

### 3. Signing konfigurieren

Erstelle: `android/key.properties`
```properties
storePassword=DEIN_PASSWORT
keyPassword=DEIN_PASSWORT
keyAlias=upload
storeFile=/Users/deinname/minute-master-key.jks
```

### 4. Signing in build.gradle einbinden

In `android/app/build.gradle` (oben, vor `android {`):

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

### 5. Build erstellen

```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

### 6. Upload zu Play Console

1. https://play.google.com/console
2. **Neue App erstellen**
3. **Release** → **Production** → **Create Release**
4. Bundle hochladen (`app-release.aab`)
5. App-Beschreibung (siehe `STORE_RELEASE_GUIDE.md`)
6. Screenshots hochladen

**Timing**: 1-7 Tage für Review

---

## 🎨 App-Icons erstellen

### Du brauchst:

**iOS**: 1024x1024px PNG (ohne Alpha)
**Android**: 512x512px PNG

### Quick & Dirty Online:

1. **Canva**: https://canva.com
   - "App Icon" Template
   - Export 1024x1024px

2. **AppIcon.co**: https://www.appicon.co
   - Upload dein Design
   - Auto-generiert alle Größen

### Design-Ideen:

- Großes "M" oder "MM" für "Minute Meister"
- Farben: Gelb (#FFD60A) + Rot (#FF3B30)
- Spielerisch, bunt, fröhlich
- Runde Ecken (App-Icons werden automatisch gerundet)

---

## 📸 Screenshots für Stores

### Mindestens 5 Screenshots pro Plattform

**Screenshots von**:
1. Start Screen (Titel + Animation)
2. Setup Screen (Spielerverwaltung)
3. Task Screen (Aufgabe + Timer)
4. Rating Screen (5 Sterne)
5. Winner Screen (Konfetti!)

### Screenshots machen:

**iOS Simulator**:
1. App starten
2. Cmd + S
3. Automatisch in Desktop gespeichert

**Android Emulator**:
1. App starten
2. Screenshot-Tool verwenden

### Format:

- **iPhone**: 1290 x 2796px
- **Android**: 1080 x 1920px

**Tipp**: Mockups mit Figma erstellen!

---

## 💡 Quick Tips

### Vor dem Release:
- ✅ App auf echtem Gerät testen
- ✅ Icons erstellen
- ✅ Screenshots machen
- ✅ Beschreibung schreiben

### Kosten:
- iOS: $99/Jahr
- Android: $25 einmalig

### Timeline:
- **iOS**: 1-2 Tage Review
- **Android**: 1-7 Tage Review
- **Total**: ~1 Woche bis LIVE

---

## 🎯 Nächste Schritte

1. **Icons erstellen** (30 Min)
2. **Screenshots machen** (15 Min)
3. **Beschreibung schreiben** (10 Min)
4. **Upload** (10 Min)
5. **Warten auf Review** (1-7 Tage)
6. **🎉 LIVE!**

---

## 📚 Weitere Infos

- **Detail-Anleitung**: Siehe `STORE_RELEASE_GUIDE.md`
- **Setup**: Siehe `SETUP_INSTRUCTIONS.md`
- **README**: Siehe `README.md`

**Viel Erfolg mit Minute Meister! 🚀**

