# Hangman Game in Assembly Language

This repository contains a Hangman game implemented in Assembly Language.
![image](https://github.com/ajaykumarn3000/hangman_assembly/assets/104309385/2efe60ea-19c4-45b8-98d1-b09ec5737979)
## Prerequisites

To run the Hangman game, you will need the following:

- DOSBox emulator installed on your system. You can download it from [here](https://sourceforge.net/projects/dosbox/).
- An Assembly Language compiler, such as TASM (Turbo Assembler). You can find TASM.exe, TLINK.exe, and TD.exe in the directory.

## Setup

1. Clone this repository to your local machine:

  ```bash
  git clone https://github.com/ajaykumarn3000/hangman_assembly.git
  ```

2. Open DOSBox emulator.

3. Mount the directory where you cloned the repository as a drive in DOSBox. For example, if you cloned the repository to `C:\Users\Admin\hangman_assembly`, you can mount it as follows:

  ```bash
  mount c: C:\Users\Admin\hangman_assembly
  ```

4. Change to the mounted drive:

  ```bash
  c:
  ```

5. Compile the `hangman.asm` file using TASM:

  ```bash
  TASM hangman.asm
  ```

6. Link the object file using Tlink:

  ```bash
  TLINK hangman.obj
  ```

7. Run the Hangman game:

  ```bash
  hangman.exe
  ```

## How to Play

- Follow the on-screen instructions to play the Hangman game.
- Guess letters to uncover the hidden word before running out of attempts.

## Screenshots

![image](https://github.com/ajaykumarn3000/hangman_assembly/assets/104309385/0fc57643-26f1-420a-9407-d5a6d995653b)
![image](https://github.com/ajaykumarn3000/hangman_assembly/assets/104309385/178f41aa-f7ec-45e0-9e2c-3b40b06bbd74)
![image](https://github.com/ajaykumarn3000/hangman_assembly/assets/104309385/be764846-7a93-4c15-a3a5-88d3dfc308ea)


## License

This project is licensed under the [MIT License](LICENSE).
