# 🚀 SFML 2.6 Quick Start Template

A minimal, out-of-the-box template for rapid game prototyping with **SFML 2.6** and **C++17**. Supports Windows and Linux.

## ✨ Features

- **No SFML Installation Needed**: CMake `FetchContent` downloads and builds SFML automatically.
- **Auto-Globbing**: Any `.cpp` files added to `src/` are automatically compiled.
- **Smart Assets**: Everything in `assets/` is automatically copied to the build directory.
- **Ready-to-use Scripts**: Compile and run with a single script (`run.bat` or `./run.sh`).

---

## 🛠️ Prerequisites

- **CMake 3.17+**
- **C++17 Compiler** (MinGW, Visual Studio, GCC, or Clang)
- **Linux only** (Ubuntu/Debian example): 
  `sudo apt install build-essential cmake libgl1-mesa-dev libx11-dev libudev-dev libopenal-dev libflac-dev libvorbis-dev`

---

## 🏃‍♂️ Build & Run

**Windows:**
```bat
run.bat
```

**Linux:**
```bash
chmod +x *.sh
./run.sh
```

*(Note: The first build takes longer as it downloads and compiles SFML. Subsequent builds are nearly instant).*

---

## 📁 Project Structure

```text
├── src/                  # Source code (auto-detected .cpp files)
├── assets/               # Game assets (auto-copied to build dir)
├── CMakeLists.txt        # CMake configuration
└── build.* & run.*       # Helper scripts
```

---

## 🧹 Clean Build

To completely reset the build environment, simply delete the `build/` directory:
- **Windows:** `rmdir /s /q build`
- **Linux:** `rm -rf build`
