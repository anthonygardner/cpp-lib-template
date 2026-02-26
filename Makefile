.PHONY: build.cpp build.py clean install notebook test.cpp test.py

build.cpp:
	cmake -S . -B build -DPython3_EXECUTABLE=$$(uv run which python) && cmake --build build -j

build.py:
	uv pip install -e ".[dev]"

clean:
	rm -fr build

commit:
	uv run cz c

notebook:
	uv run marimo edit notebooks/main.py --host 0.0.0.0 --headless --no-token

test.cpp:
	cd build && ctest && cd -

test.py:
	uv run pytest