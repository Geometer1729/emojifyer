install: build placeFiles

build:
	ghc -O2 emojifyer

placeFiles:
	cp emojifyer /bin
	cp emojify /bin
