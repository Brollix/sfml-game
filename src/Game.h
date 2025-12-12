#pragma once

#include <SFML/Graphics.hpp>

class Game {
private:
    sf::RenderWindow window;
    bool isRunning;
    sf::Clock clock;
    float dt;

    void processEvents() {
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed) {
                isRunning = false;
            }

            // Maneja el input del teclado
            if (event.type == sf::Event::KeyPressed) {
                if (event.key.code == sf::Keyboard::Escape) {
                    isRunning = false;
                }
            }
        }
    }

    void update(float dt) {
        // Lógica del juego acá
    }

    void render() {
        window.clear(sf::Color(20, 20, 30)); // Fondo oscuro
        
        // Renderiza los objetos del juego acá
        
        window.display();
    }

public:
    Game() : window(sf::VideoMode(800, 600), "SFML Game Template"), isRunning(true), dt(0.0f) {
        window.setFramerateLimit(60);
    }

    void run() {
        while (isRunning && window.isOpen()) {
            dt = clock.restart().asSeconds();
            
            processEvents();
            update(dt);
            render();
        }
        window.close();
    }
};

