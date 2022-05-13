
c clean:
	rm -rf ./htdocs

dpw download-pw:
	rm -f ./htdocs/.gitkeep
	rm -f ./htdocs/.gitattributes

	git clone git://github.com/processwire/processwire.git -b dev ./htdocs

	rm -rf ./htdocs/.git
	rm -f ./htdocs/.DS_Store

dcu docker-up:
	mkdir -p ./database/mariadb/data
	mkdir -p ./config/php/pw
	docker-compose up -d

i install:
	make clean
	make download-pw
	make docker-up
