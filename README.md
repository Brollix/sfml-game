# SFML Game Template

Template minimalista para juegos 2D con SFML.  
Listo para Windows y Linux. Un solo `.cpp`, todo lo demás en headers.

## Estructura del Proyecto

```
sfml-game/
├── src/
│   ├── main.cpp          # Punto de entrada (único archivo .cpp)
│   └── Game.h            # Clase principal del juego (header-only)
├── assets/               # Recursos del juego (imágenes, audio, etc.)
│   └── spritesheet.png
├── CMakeLists.txt        # Configuración de CMake
├── build.bat             # Script de compilación (Windows)
├── build.sh              # Script de compilación (Linux)
├── run.bat               # Script de compilación y ejecución (Windows)
├── run.sh                # Script de compilación y ejecución (Linux)
└── README.md             # Este archivo
```

## Requisitos

### Windows

- **CMake** 3.17 o superior ([Descargar](https://cmake.org/download/))
- **MinGW-w64** o **Visual Studio** con C++17
- Git (opcional)

> SFML se descarga automáticamente durante la compilación.

### Linux

- **CMake** 3.17+ y **GCC**/Clang con C++17
- Dependencias mínimas:

#### Ubuntu/Debian
```bash
sudo apt install build-essential cmake libgl1-mesa-dev libx11-dev
```

#### Fedora/RHEL
```bash
sudo dnf install cmake gcc-c++ mesa-libGL-devel libX11-devel
```

#### Arch Linux
```bash
sudo pacman -S cmake gcc mesa libx11
```

> SFML se descarga automáticamente. Solo necesitas OpenGL y X11.  
> *Opcional:* `libudev-dev` si usarás joysticks.

## Compilar y Ejecutar

**Windows:**
```batch
run.bat          # Compila y ejecuta
build.bat        # Solo compila
```

**Linux:**
```bash
chmod +x *.sh    # Solo la primera vez
./run.sh         # Compila y ejecuta
./build.sh       # Solo compila
```

## Cómo Desarrollar

### Agregar clases (header-only)

Crea un nuevo `.h` en `src/`:

```cpp
// src/Player.h
#pragma once
#include <SFML/Graphics.hpp>

class Player {
public:
    Player(float x, float y) : pos(x, y) {}
    
    void update(float dt) { /* lógica aquí */ }
    void render(sf::RenderWindow& w) { /* dibujar aquí */ }
    
private:
    sf::Vector2f pos;
};
```

Inclúyela en `Game.h`: `#include "Player.h"`

### Agregar recursos

Pon tus imágenes/sonidos en `assets/`. Se copian automáticamente al build:

```cpp
sf::Texture tex;
tex.loadFromFile("assets/player.png");
```

## Estructura Básica

**`main.cpp`** - Solo crea y ejecuta el juego  
**`Game.h`** - Game loop con `processEvents()`, `update()`, `render()`

**Controles:** ESC o cerrar ventana para salir

## Limpiar Build

**Windows:** `rmdir /s /q build`  
**Linux:** `rm -rf build`

## Desarrollo Colaborativo

El `.gitignore` está configurado para que ambos puedan trabajar sin conflictos:
- Se ignora el directorio `build/`
- Se ignoran archivos compilados y temporales
- Solo se sincroniza código fuente y assets

## Problemas Comunes

**Windows: "cmake no se reconoce como comando"**
→ Agrega CMake al PATH del sistema

**Linux: "Permission denied" al ejecutar scripts**
```bash
chmod +x build.sh run.sh
```

**Primer build tarda mucho**
→ Es normal, SFML se descarga y compila automáticamente (solo la primera vez)

## Recursos

- [Documentación SFML](https://www.sfml-dev.org/documentation/2.6.1/)
- [Tutoriales SFML](https://www.sfml-dev.org/tutorials/2.6/)
- [Assets gratuitos](https://opengameart.org/)
