setupclassroom:
	mkdir -p .github/classroom/
	mkdir -p .github/workflows/
	touch .github/.keep
	cp scripts/autograding.json .github/classroom/autograding.json
	cp scripts/classroom.yml .github/workflows/classroom.yml
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	git add .github/.keep
	git commit -m"update classroom.yml .keep autograding.json for classroom CI test"
	git push

# for github codespaces ubuntu with zsh SHELL, need root for sudo
codespaces_setenv:
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	/bin/zsh && source /home/codespace/.cargo/env
	rustc --version
	cargo install --force --path .

ubuntu_local_setenv:
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	/bin/bash && source /home/codespace/.cargo/env
	rustc --version
	cargo install --force --path .

test:
#	cargo install --force --path .
	rustlings verify