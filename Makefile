help:
clean:
	rm -rf dist target coverage .tox .pytest_cache .coverage tests/__pycache__ src/terminalizer2asciinema/__pycache__
run:
	poetry run terminalizer2asciinema test-data.yml
build:
	scripts/set-version.sh
	poetry build
install:
	poetry install
flake8:
	poetry run flake8
update:
	poetry update
test:
	poetry run pytest --capture=sys \
	--junit-xml=coverage/test-results.xml \
	--cov=terminalizer2asciinema \
	--cov-report term-missing \
	--cov-report xml:coverage/coverage.xml \
	--cov-report html:coverage/coverage.html \
	--cov-report lcov:coverage/coverage.info

all: clean install flake8 build tox-run

release:
	scripts/release.sh

tox-run:
	tox run
