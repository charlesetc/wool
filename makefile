build:
	dune exec ./wool.exe

build-release:
	dune build ./wool.exe --release

deploy: build-release
	cp -f _build/default/wool.exe ~/exes/wool
