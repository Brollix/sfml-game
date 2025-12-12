#pragma once

#include <SFML/Graphics.hpp>

class Game {
private:
    sf::RenderWindow window;
    bool isRunning;

    void processEvents() {
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed) {
                isRunning = false;
            }

            // Handle keyboard input
            if (event.type == sf::Event::KeyPressed) {
                if (event.key.code == sf::Keyboard::Escape) {
                    isRunning = false;
                }
            }
        }
    }

    void update() {
        // Game logic here
    }

    void render() {
        window.clear(sf::Color(20, 20, 30)); // Dark background
        
        // Render game objects here
        
        window.display();
    }

public:
    Game() 
        : window(sf::VideoMode(800, 600), "SFML Game Template")
        , isRunning(true) {
        window.setFramerateLimit(60);
    }

    void run() {
        while (isRunning && window.isOpen()) {
            processEvents();
            update();
            render();
        }
        window.close();
    }
};

