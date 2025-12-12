cmake_minimum_required(VERSION 3.17)

project(sfml-game)

# Establece el estándar de C++
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include(FetchContent)
FetchContent_Declare(
  sfml
  GIT_REPOSITORY https://github.com/SFML/SFML.git
  GIT_TAG        2.6.1
)
FetchContent_MakeAvailable(sfml)

# Agrega los archivos fuente
file(GLOB_RECURSE SOURCES "src/*.cpp")

# Crea el ejecutable
add_executable(sfml-game ${SOURCES})

# Linkea las librerías de SFML
target_link_libraries(sfml-game PRIVATE sfml-graphics sfml-window sfml-system)
target_include_directories(sfml-game PRIVATE ${CMAKE_SOURCE_DIR})

# Copia los assets al directorio de build (opcional pero recomendado para correr desde la carpeta build)
# Esto asume que tenés una carpeta 'assets' en la raíz del proyecto
if(EXISTS "${CMAKE_SOURCE_DIR}/assets")
    add_custom_command(TARGET sfml-game POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_SOURCE_DIR}/assets"
        "$<TARGET_FILE_DIR:sfml-game>/assets"
        COMMENT "Copiando assets al directorio de salida"
    )
endif()
