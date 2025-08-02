# Projeto de Estudo de Shoot 'em up

*Um shoot 'em up (shmup) 2D de estilo arcade, criado como um estudo de mecânicas de jogo e padrões de arquitetura de software no Godot Engine 4. Enfrente ondas infinitas de inimigos, desvie de projéteis e sobreviva o máximo que puder!*

---

## Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Funcionalidades](#funcionalidades)
- [Conceitos Técnicos Implementados](#conceitos-técnicos-implementados)
- [Assets e Créditos](#assets-e-créditos)

---

## Sobre o Projeto

Este jogo foi desenvolvido como um projeto de aprendizado com o objetivo de implementar do zero as mecânicas fundamentais de um "jogo de navinha" clássico. O foco principal foi criar sistemas robustos, organizados e flexíveis, aplicando boas práticas de desenvolvimento em GDScript.

O objetivo do jogador é simples: sobreviver o maior tempo possível contra hordas de inimigos que atiram em sua direção, buscando a maior pontuação.

---

## Funcionalidades

-   **Movimentação Flutuante:** Controle de nave em 8 direções com aceleração e inércia para uma sensação de movimento espacial.
-   **Tiro Contínuo:** Sistema de tiro automático ao segurar o botão, com tempo de recarga de tiro controlada.
-   **Inimigos com Mira:** Inimigos que disparam projéteis na direção do jogador.
-   **Spawner Dinâmico:** Um sistema que gera inimigos processualmente no topo da tela, sem a necessidade de posicionamento manual.
-   **Fundo Infinito:** Cenário com efeito parallax que se move de forma contínua e se adapta a diferentes tamanhos de janela.
---

## Conceitos Técnicos Implementados

Este projeto serviu como campo de provas para diversos padrões e técnicas essenciais no Godot:

-   **Máquina de Estados Finita (Finite State Machine):**
    Gerencia os estados do jogador (`Idle`, `Move`, `Death`) de forma limpa e organizada, separando as lógicas de cada estado e evitando código `if/else` complexo.

-   **Movimento Baseado em Interpolação (`lerp`):**
    A movimentação da nave não é instantânea. Foi usada a função `lerp()` para criar uma sensação "flutuante" de aceleração e desaceleração.

-   **Sistema de Projéteis com `Area2D`:**
    Criação de um sistema de projéteis performático usando `Area2D` para detecção de colisão. A remoção de projéteis que saem da tela é feita eficientemente com `VisibleOnScreenNotifier2D`.

-   **Herança e Composição para Inimigos:**
    Foi criada uma classe base `EnemyBase` com a lógica comum a todos os inimigos (como vida e dano). Inimigos específicos herdam dessa base e compõem sua cena com componentes (Sprites, Hitboxes) para um design de código flexível e reutilizável.

-   **IA de Mira com Vetores:**
    A mira dos inimigos é calculada em tempo real usando operações de vetores (`global_position.direction_to(player_position)`) para encontrar a direção do jogador.

-   **Spawning de Inimigos:**
    O spawner de inimigos utiliza `get_viewport().get_visible_rect()` e `randf_range()` para calcular posições de surgimento aleatórias e dinâmicas, eliminando a necessidade de `Marker2D`s pré-definidos.

-   **Gerenciamento de UI Dinâmica:**
    Tanto o parallax background quanto os limites do jogador se adaptam a diferentes tamanhos de janela, garantindo uma experiência consistente em várias resoluções.

-   **Controle de Efeitos Globais com `Tween`:**
    A tela de Game Over utiliza `Tween` para animar propriedades globais como `Engine.time_scale` (câmera lenta).

-   **Comunicação com Sinais e Grupos:**
    Uso de Grupos para que os inimigos encontrem o jogador de forma desacoplada, e Sinais customizados (ex: `player.died`) para comunicar eventos importantes entre diferentes partes do jogo (Jogador -> UI).

---

## Assets e Créditos

-   **Motor de Jogo:** [Godot Engine](https://godotengine.org/).
-   **Linguagem:** GDScript.
-   **Artes do Jogo ("Mini Pixel Pack 3"):** por [GrafxKid](https://grafxkid.itch.io/mini-pixel-pack-3) no itch.io.
-   **Sons:** 8-Bit Cannon.wav por DeVern (https://freesound.org/people/DeVern/sounds/517664/), 8Bit Explosion por Duskbreaker(https://freesound.org/people/Duskbreaker/sounds/641486/), Perc Bip por SpiceProgram (https://freesound.org/s/399196/).
-   **Músicas:** Por doranarasi (https://doranarasi.itch.io/shmup-bgm-pack).
---
**Criado por João Victor Anunciação da Silva** - 2025
