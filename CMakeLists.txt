cmake_minimum_required(VERSION 3.17)

project(sfml-game)

# Set C++ Standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include(FetchContent)
FetchContent_Declare(
  sfml
  GIT_REPOSITORY https://github.com/SFML/SFML.git
  GIT_TAG        2.6.1
)
FetchContent_MakeAvailable(sfml)

# Add source files
file(GLOB_RECURSE SOURCES "src/*.cpp")

# Create executable
add_executable(sfml-game ${SOURCES})

# Link SFML libraries
target_link_libraries(sfml-game PRIVATE sfml-graphics sfml-window sfml-system)
target_include_directories(sfml-game PRIVATE ${CMAKE_SOURCE_DIR})

# Copy assets to build directory (optional but recommended for running from build folder)
# This assumes you have an 'assets' folder in your project root
if(EXISTS "${CMAKE_SOURCE_DIR}/assets")
    add_custom_command(TARGET sfml-game POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_SOURCE_DIR}/assets"
        "$<TARGET_FILE_DIR:sfml-game>/assets"
        COMMENT "Copying assets to output directory"
    )
endif()
