This is PlatformIO project for ESP32 and uses Arduino framework.

## Instructions

### Coding Standards

- Adhere to `.clang-format` defined in the root of the repo.
- Imports: thirdparty or stdlib is `#include <...>`, own code is `#include "..."`.
- For class members, use `m_` prefix.
- For globals, use `g_` prefix.

### Verification

- Use `make build` or `pio build -v` to build a project and verify.
- Project ships with `.clang-format`. Use `clang-format` after editing source files.

### Plans

Implementation plans have to be written into plans/ directory of the repo.
Plan file format is `[number]-[description].md`.

### Design & Implementation

Before building any assumptions on ESP-IDF or other library behavior, check library sources:

- `~/.platformio/packages/framework-arduinoespressif32/cores/esp32/` - HAL
- `~/.platformio/packages/framework-arduinoespressif32/libraries/` - Builtin libraries (BLE, SPI, etc)
- `.pio/libdeps/espwroom32/` - Project third-party dependencies

Source code is a source of truth.

Certain hardware features of the board might not be available, therefore certain features like BLE privacy support might not work as expected.

Check `~/.platformio/packages/framework-arduinoespressif32-libs/esp32/include/soc/esp32/include/soc/soc_caps.h` for hardware features.

### Tools

#### Code Search And Replace

Prefer using `ast-grep` to search and modify source code files.

Use `fzf` or `rg` instead of `grep`.

#### GitHub

External GitHub repos and files can be accessed using github cli (`gh`). Don't do `curl`.
If the same file needs to be grepped multiple times - download a file locally and then, grep it.