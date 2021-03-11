ASM  := rgbasm
LINK := rgblink
GFX  := rgbgfx
FIX  := rgbfix
MD5  := md5sum -c

PYTHON := python3

ASMFLAGS :=

SCANINC := tools/scan_includes

SOURCES := \
	home.asm \
	main.asm \
	wram.asm

OBJS := $(SOURCES:%.asm=%.o)

ROM := shi_kong_xing_shou.gbc
MAP := $(ROM:%.gbc=%.map)
SYM := $(ROM:%.gbc=%.sym)

ROM_TITLE := "TIMER MONSTER  "

.PHONY: all tools clean compare
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(ROM) compare

tools:
	@$(MAKE) -C tools/

compare: $(ROM)
	@$(MD5) rom.md5

clean:
	$(RM) $(ROM) $(MAP) $(SYM) $(OBJS)
	$(RM) data/text/*.asm		# Text preprocessor generated files
	$(MAKE) clean -C tools/

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2)
	$$(ASM) $$(ASMFLAGS) -L -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))
$(foreach obj, $(OBJS), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif

$(ROM): $(OBJS)
	$(LINK) -n $(SYM) -m $(MAP) -p 0 -o $@ $(OBJS)
	$(FIX) -cv -t $(ROM_TITLE) -l 0x33 -k A7 -m 0x1b -r 2 -p 0 $@

# Text preprocessor
%.asm: %.tx
	$(PYTHON) tools/tx_parse.py $< > $@
