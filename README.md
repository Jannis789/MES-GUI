# MacOS Installation

### 1. Homebrew installieren (falls noch nicht vorhanden)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. GTK 4 und PyGObject installieren

```bash
brew install gtk4 pygobject3
```

### 4. Virtuelle Umgebung einrichten (optional, aber empfohlen)

```bash
python3 -m venv venv
source venv/bin/activate
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
