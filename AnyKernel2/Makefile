NAME ?= PolesApart-mdroid15.1-wt88047-zram

DATE := $(shell date +'%Y%m%d-%H%M')

ZIP := $(NAME)-$(DATE).zip

EXCLUDE := Makefile *.git* *.zip *.sha1

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf "$(NAME)-"*.zip*
	@rm -vf dtb
	@rm -vf zImage
	@echo "Done."
