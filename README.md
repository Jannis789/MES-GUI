# 🛠️ GTK 4 + PyGObject Installation auf macOS

Diese Anleitung hilft dir, ein Python-Projekt mit **GTK 4** und **PyGObject** unter macOS zum Laufen zu bringen.

## 📦 Voraussetzungen

- macOS mit [Homebrew](https://brew.sh)
- Python 3 (idealerweise über Homebrew installiert)

## 🔧 Installation

### 1. Homebrew installieren (falls noch nicht vorhanden)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. GTK 4 und PyGObject installieren

```bash
brew install gtk4 pygobject3
```

> Hinweis: `pygobject3` unterstützt sowohl GTK 3 als auch GTK 4.

### 3. Umgebungsvariablen setzen

Füge diese Zeilen zu deiner `~/.zshrc` oder `~/.bash_profile` hinzu:

```bash
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig"
export GI_TYPELIB_PATH="/opt/homebrew/lib/girepository-1.0"
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"
```

Dann lade das Profil neu:

```bash
source ~/.zshrc  # oder ~/.bash_profile
```

### 4. Virtuelle Umgebung einrichten (optional, aber empfohlen)

```bash
python3 -m venv venv
source venv/bin/activate
pip install pygobject
```

> Achte darauf, dass `python3` auf die Homebrew-Version zeigt:

```bash
which python3
# Sollte z. B. /opt/homebrew/bin/python3 sein
```

### 5. Installation testen

```bash
python3 -c "from gi.repository import Gtk; print(Gtk.MAJOR_VERSION)"
```

Wenn du `4` siehst → alles funktioniert ✅

## 🧪 Fehlerbehebung

- **Fehler: `libglib-2.0.0.dylib` nicht gefunden**  
  → Umgebungsvariablen (siehe oben) nicht korrekt gesetzt

- **PyGObject findet Gtk nicht**  
  → Stelle sicher, dass `GI_TYPELIB_PATH` gesetzt ist und `Gtk-4.0.typelib` vorhanden ist:

```bash
ls /opt/homebrew/lib/girepository-1.0/Gtk-4.0.typelib
```

## 🧹 Cleanup (optional)

Wenn du versehentlich GTK 3 installiert hast:

```bash
brew uninstall gtk+3
```

