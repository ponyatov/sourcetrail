# version
ST_VER = 2021.4.19

# dir
DISTR ?= $(HOME)/distr/Linux

# tool
CURL = curl -L -o

ST_GZ  = Sourcetrail_$(subst .,_,$(ST_VER))_Linux_64bit.tar.gz
ST_URL = https://github.com/CoatiSoftware/Sourcetrail/releases/download

# install
.PHONY: install update
install update: gz
	sudo apt update
	sudo apt install -uy `cat apt.$(shell lsb_release -si)`
gz: Sourcetrail/README

$(DISTR)/$(ST_GZ):
	$(CURL) $@ $(ST_URL)/$(ST_VER)/$(ST_GZ)

Sourcetrail/README: $(DISTR)/$(ST_GZ)
	tar zx < $< && touch $@
