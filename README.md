# GTA V Pokemon Script

This script for GTA V FiveM servers allows players to summon Mewtwo, interact with it through various commands, and capture it using a pokeball. The script provides an immersive experience for players to engage with one of the most iconic Pokémon in the game.

## Features

- Summon Mewtwo with a custom command.
- Command it to attack nearest NPC or player.
- Mewtwo can follow the player or be sent to a vehicle.
- Use a pokeball to capture or release Mewtwo.
- Interaction and capture mechanics are displayed through in-game notifications and floating help notifications.

## Prerequisites

- FiveM server with the ESX framework installed.
- Administrative rights on the server for script installation.

## Installation

1. Download the script and extract it into the `resources` directory of your FiveM server.
2. Add `ensure script_name` to your `server.cfg` file.
3. Restart your FiveM server or load the script using the `refresh` command followed by `ensure script_name` in your server's console.

## Usage

- **Summon Mewtwo:** The script is triggered by a specific event. Use the event `esx_pokeball:lance` to summon Mewtwo.
- **Interactions:** 
  - Press `X` to command Mewtwo to enter the nearest vehicle.
  - Press `E` to command Mewtwo to attack the nearest NPC or player.
  - Press `H` to have Mewtwo follow you.
  - Press `CTRL` to capture Mewtwo back into a pokeball.

- **Capture Mewtwo:** Approach a pokeball object and press `E` to capture Mewtwo, initiating a custom animation.

## Contribution

Feel free to contribute to this script by forking the repository, making your changes, and submitting a pull request with your improvements.

## License

This script is released into the public domain. You are free to use, modify, and distribute it in any way you see fit.