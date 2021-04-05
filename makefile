INSTALL_FOLDER=/usr/local/lib/brightnessctl
BIN_FOLDER=/usr/local/bin

install:
	echo installing
	mkdir -p $(INSTALL_FOLDER)
	cp -R ./*  $(INSTALL_FOLDER)/
	ln -fs $(INSTALL_FOLDER)/brightness.sh $(BIN_FOLDER)/brightness

uninstall:
	echo uninstalling
	rm -R $(INSTALL_FOLDER)
	rm $(BIN_FOLDER)/brightness