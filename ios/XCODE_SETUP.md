# iOS Setup für Minute Master

## ✅ Was wurde erstellt?

Die komplette iOS-Struktur für die Minute Master App wurde erstellt:

- ✅ `Runner.xcworkspace` - Xcode Workspace (WICHTIG: Dies öffnen, nicht .xcodeproj!)
- ✅ `Runner.xcodeproj` - Xcode Projekt
- ✅ `Podfile` - CocoaPods Konfiguration
- ✅ `Info.plist` - App-Konfiguration
- ✅ App Icons für alle iOS-Größen
- ✅ Launch Screen Storyboard
- ✅ Swift Code (AppDelegate.swift)

---

## 📱 App in Xcode öffnen

### WICHTIG: Immer `.xcworkspace` öffnen, NICHT `.xcodeproj`!

1. **Xcode öffnen**
2. **File** → **Open** (oder Cmd+O)
3. Navigiere zu: `ios/Runner.xcworkspace`
4. Klicke auf **Open**

**ODER** im Terminal:
```bash
cd ios
open Runner.xcworkspace
```

---

## 🚀 App im iOS-Emulator starten

### Option 1: Über Xcode

1. Öffne `Runner.xcworkspace` in Xcode
2. Wähle oben einen iOS-Simulator (z.B. "iPhone 15 Pro")
3. Klicke auf den **Play** Button (▶️) oder drücke **Cmd+R**

### Option 2: Über Flutter CLI (empfohlen)

```bash
# Im Projekt-Root:
flutter run

# Oder spezifisch für iOS:
flutter run -d ios
```

### Option 3: Über Terminal in Xcode-Projekt

```bash
cd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

---

## 📦 CocoaPods installieren (wenn nötig)

Wenn du zum ersten Mal öffnest, müssen CocoaPods installiert werden:

```bash
cd ios
pod install
```

**Falls `pod` nicht gefunden wird:**
```bash
sudo gem install cocoapods
```

---

## ⚙️ Konfiguration in Xcode

### Signing & Capabilities

1. In Xcode: **Runner** Projekt auswählen
2. Tab **Signing & Capabilities**
3. **Team** auswählen (dein Apple Developer Account)
   - Oder kostenloses "Personal Team" verwenden
4. **Bundle Identifier** anpassen (falls nötig): `de.minutemeister.app`

### Deployment Target

- **Minimum iOS Version**: 12.0 (kannst du in Xcode ändern)
- Aktuell in `Podfile` auf 12.0 gesetzt

---

## 🐛 Häufige Probleme

### Problem: "Pod install failed"

**Lösung:**
```bash
cd ios
pod deintegrate
pod install
```

### Problem: "Signing for Runner requires a development team"

**Lösung:**
1. In Xcode: **Runner** → **Signing & Capabilities**
2. **Team** auswählen oder "Personal Team" nutzen

### Problem: "Could not find module 'Flutter'"

**Lösung:**
```bash
cd ios
pod install
flutter clean
flutter pub get
```

### Problem: App startet nicht im Simulator

**Lösung:**
1. Simulator über Xcode öffnen: **Xcode** → **Open Developer Tool** → **Simulator**
2. Oder: `open -a Simulator`
3. Dann nochmal `flutter run`

---

## 📋 Checkliste vor dem ersten Start

- [ ] Xcode installiert (über App Store)
- [ ] Flutter installiert (`flutter doctor`)
- [ ] CocoaPods installiert (`pod --version`)
- [ ] `ios/Runner.xcworkspace` geöffnet (nicht .xcodeproj!)
- [ ] Signing & Capabilities konfiguriert
- [ ] iOS Simulator gestartet

---

## 🎉 Fertig!

Wenn alles konfiguriert ist, kannst du die App starten:

```bash
flutter run
```

Die App sollte dann im iOS-Simulator erscheinen! 🚀

---

## 📚 Zusätzliche Ressourcen

- [Flutter iOS Setup](https://docs.flutter.dev/get-started/install/macos)
- [Xcode Documentation](https://developer.apple.com/documentation/xcode)
- [CocoaPods Guide](https://guides.cocoapods.org/)

