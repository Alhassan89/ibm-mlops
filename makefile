.DEFAULT: build

check:
	poetry check

install: check
	PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring poetry install --no-root -vvv

lock:
	PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring poetry lock

dvc:
	poetry run dvc pull -a

clean:
	rm -f -r ./build/
	rm -f -r ./dist/
	rm -f -r *.egg-info
	rm -f .coverage

build: clean
	poetry build
