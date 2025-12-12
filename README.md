# SFML Game Template

Template básico para desarrollar juegos 2D con SFML en C++17.  
Configurado para desarrollo multiplataforma (Windows y Linux).

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
- Git (opcional, para clonar el repositorio)

### Linux

- **CMake** 3.17 o superior
- **GCC** o **Clang** con soporte C++17
- Librerías del sistema necesarias:

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install build-essential cmake git
sudo apt install libx11-dev libxrandr-dev libxcursor-dev libxi-dev libudev-dev libgl1-mesa-dev
sudo apt install libflac-dev libvorbis-dev libopenal-dev
```

#### Fedora/RHEL
```bash
sudo dnf install cmake gcc-c++ git
sudo dnf install libX11-devel libXrandr-devel libXcursor-devel libXi-devel systemd-devel mesa-libGL-devel
sudo dnf install flac-devel libvorbis-devel openal-soft-devel
```

#### Arch Linux
```bash
sudo pacman -S cmake gcc git
sudo pacman -S libx11 libxrandr libxcursor libxi systemd mesa
sudo pacman -S flac libvorbis openal
```

## Compilación y Ejecución

### Windows

#### Solo compilar:
```batch
build.bat
```

#### Compilar y ejecutar:
```batch
run.bat
```

### Linux

#### Solo compilar:
```bash
chmod +x build.sh run.sh  # Solo la primera vez
./build.sh
```

#### Compilar y ejecutar:
```bash
./run.sh
```

## Desarrollo

### Agregar nuevas clases

Este proyecto usa **header-only** para todas las clases excepto `main.cpp`.

**Ejemplo - Agregar una clase Player:**

```cpp
// src/Player.h
#pragma once

#include <SFML/Graphics.hpp>

class Player {
private:
    sf::Vector2f position;
    sf::RectangleShape shape;

public:
    Player(float x, float y) 
        : position(x, y)
        , shape(sf::Vector2f(50.f, 50.f)) {
        shape.setPosition(position);
        shape.setFillColor(sf::Color::Green);
    }

    void update(float deltaTime) {
        // Lógica de actualización
    }

    void render(sf::RenderWindow& window) {
        window.draw(shape);
    }

    sf::Vector2f getPosition() const { return position; }
    void setPosition(float x, float y) {
        position = sf::Vector2f(x, y);
        shape.setPosition(position);
    }
};
```

Luego incluirla en `Game.h`:
```cpp
#include "Player.h"
```

### Agregar recursos

Coloca tus recursos en la carpeta `assets/`. El CMake los copiará automáticamente al directorio de build.

```cpp
// Cargar una textura
sf::Texture texture;
if (!texture.loadFromFile("assets/player.png")) {
    // Error al cargar
}
```

## Estructura del Código

### main.cpp
Punto de entrada mínimo, solo crea y ejecuta el juego:
```cpp
#include "Game.h"

int main() {
    Game game;
    game.run();
    return 0;
}
```

### Game.h
Contiene el game loop principal:
- `processEvents()` - Maneja input del usuario
- `update()` - Actualiza la lógica del juego
- `render()` - Dibuja en pantalla

## Controles Predeterminados

- **ESC** - Cerrar el juego
- **X** (botón de cerrar) - Cerrar el juego

## Limpieza del Build

Para limpiar los archivos compilados y empezar desde cero:

### Windows
```batch
rmdir /s /q build
```

### Linux
```bash
rm -rf build
```

## Notas para Desarrollo Colaborativo

### Git Workflow Recomendado

1. El `.gitignore` ya está configurado para excluir:
   - Directorio `build/`
   - Archivos compilados
   - Archivos de IDE
   - Logs de build

2. Los cambios en código fuente (`src/`) y recursos (`assets/`) se sincronizarán automáticamente.

3. Ambos desarrolladores pueden trabajar simultáneamente sin conflictos de archivos temporales.

### Troubleshooting

#### Windows: "cmake no se reconoce como comando"
- Asegúrate de que CMake esté en el PATH del sistema
- O especifica la ruta completa: `"C:\Program Files\CMake\bin\cmake.exe"`

#### Linux: "Permission denied" al ejecutar scripts
```bash
chmod +x build.sh run.sh
```

#### Error: "No se puede encontrar -lsfml-graphics"
- En Linux: Instala las dependencias del sistema (ver sección Requisitos)
- El proyecto descarga SFML automáticamente, pero necesita las librerías del sistema

## Recursos

- [Documentación SFML](https://www.sfml-dev.org/documentation/2.6.1/)
- [Tutoriales SFML](https://www.sfml-dev.org/tutorials/2.6/)
- [Assets gratuitos](https://opengameart.org/)
