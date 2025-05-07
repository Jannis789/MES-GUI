# MacOS Installation

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

# Linux installation

```bash
curl -L https://nixos.org/nix/install | sh
```

Im Repositoryverzeichnis:
```bash
nix-shell
```

# Windows Installation 

### Anmerkung: Der Pfad kann nach Betriebssystemen variieren, dementsprechend müssen Befehle, sowie die launch.json angepasst werden

## 1. MSYS2 installieren

- Lade den MSYS2-Installer von der offiziellen Website herunter: [https://www.msys2.org/](https://www.msys2.org/)
- Installiere MSYS2 im **Standardverzeichnis** `C:\msys64` (dies ist im Installer bereits voreingestellt).

## 2. Pakete installieren

- Starte MSYS2 über `C:\msys64\msys2.exe`  
  Alternativ kannst du am Ende der Installation die Option aktivieren, um MSYS2 direkt zu öffnen.
- Führe im MSYS2-Terminal folgenden Befehl aus, um die benötigten Pakete zu installieren:

  ```bash
  pacman -Syuu mingw-w64-x86_64-python mingw-w64-x86_64-python-pip mingw-w64-x86_64-gtk4 mingw-w64-x86_64-python-gobject
  ```

## 3. Python-Interpreter in VS Code einrichten
- Öffne **Visual Studio Code**
- Python Debugger als Vscode extension herunterlasen
- Drücke `Ctrl+Shift+P`, um die Befehlspalette zu öffnen
- Wähle `Python: Select Interpreter`
- Klicke auf **"Enter interpreter path..."**
- Gib folgenden Pfad ein und bestätige mit Enter:

  ```
  C:\msys64\mingw64\bin\python.exe
  ```
