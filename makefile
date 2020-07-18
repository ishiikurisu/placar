default: run

run:
	love game

build:
	cd game; zip -9 -r placar.love .
	mv game/placar.love .
