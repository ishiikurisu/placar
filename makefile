default: run

run:
	love game

build:
	cd game; zip -9 -r game.love .
	mv game/game.love .
