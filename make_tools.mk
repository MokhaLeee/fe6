
MAKEFLAGS += --no-print-directory

TOOLDIRS :=
TOOLDIRS += tools/gbagfx

.PHONY: all $(TOOLDIRS) clean

all: $(TOOLDIRS)

$(TOOLDIRS):
	@$(MAKE) -C $@

clean:
	@$(foreach tooldir,$(TOOLDIRS),$(MAKE) clean -C $(tooldir);)
