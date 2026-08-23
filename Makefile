.PHONY: help
help:
	@echo "Usage: make [build|upload|monitor|compiledb|webui]"

.PHONY: check_pio
check_pio:
	@command -v pio >/dev/null 2>&1 || (echo "Error: pio command not found. Please install PlatformIO Core: https://docs.platformio.org/en/latest/core/index.html" && exit 1)

.PHONY: compiledb
compiledb: check_pio
	@pio run -t compiledb

.PHONY: build
build: check_pio
	@pio run

.PHONY: upload
upload: check_pio
	@pio run --target upload

.PHONY: monitor
monitor: check_pio
	@pio device monitor

.PHONY: clean
clean: check_pio
	@pio run -t clean

.PHONY: webui
webui:
	@python3 -m http.server 8000 --bind 127.0.0.1 --directory tools/webui