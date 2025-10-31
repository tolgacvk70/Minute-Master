# Swift Version Problem beheben

## ❌ Problem
Xcode zeigt den Fehler: "The target 'Runner' contains source code developed with Swift 3.x"

## ✅ Lösung: Swift-Version in Xcode manuell setzen

### Schritt 1: Projekt in Xcode öffnen
1. Öffne `ios/Runner.xcworkspace` in Xcode (NICHT .xcodeproj!)

### Schritt 2: Build Settings öffnen
1. Klicke auf **Runner** Projekt im Project Navigator (links)
2. Wähle das **Runner** Target (unter "TARGETS")
3. Öffne den Tab **Build Settings**
4. Suche nach **"swift version"** in der Suchleiste oben

### Schritt 3: Swift-Version setzen
1. Finde **"Swift Language Version"** (oder "SWIFT_VERSION")
2. Stelle sicher, dass es auf **"Swift 5"** oder **"Swift 5.0"** steht
3. Falls nicht: Ändere es auf **Swift 5**

### Schritt 4: Für alle Konfigurationen prüfen
Stelle sicher, dass Swift 5 für ALLE Build-Konfigurationen gesetzt ist:
- ✅ Debug
- ✅ Release  
- ✅ Profile (falls vorhanden)

### Schritt 5: Clean Build
1. **Product** → **Clean Build Folder** (oder Shift+Cmd+K)
2. **Product** → **Build** (oder Cmd+B)

---

## 🔄 Alternative: Über Terminal

Falls Xcode nicht reagiert, kannst du die Swift-Version auch direkt setzen:

```bash
cd ios
xcodebuild -project Runner.xcodeproj -target Runner -showBuildSettings | grep SWIFT_VERSION
```

Dann in Xcode manuell ändern oder die project.pbxproj Datei direkt bearbeiten (nicht empfohlen).

---

## ✅ Überprüfung

Nach dem Setzen sollte Xcode die App ohne Fehler kompilieren können.

### Test:
```bash
cd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -sdk iphonesimulator clean build
```

---

## 💡 Warum passiert das?

Das Projekt wurde mit einer neueren Flutter-Version erstellt, aber Xcode interpretiert manchmal die Build-Einstellungen falsch, besonders wenn:
- Die Xcode-Version neu ist
- Das Projekt von einer älteren Vorlage stammt
- Die Build-Einstellungen nicht vollständig migriert wurden

Die Datei `project.pbxproj` hat bereits `SWIFT_VERSION = 5.0`, aber Xcode erkennt es manchmal nicht korrekt, bis man es manuell in den Build Settings setzt.

