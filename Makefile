help:
clean:
	rm -rf dist target coverage
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

commit:
	scripts/git-commit.sh

fix-cert:
	pip install pip-system-certs --trusted-host pypi.org --trusted-host files.pythonhosted.org

fix-pyenv:
	 pyenv versions --bare > .python-version

tox-run:
	tox run
