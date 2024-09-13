.SUFFIXES:

# ==================
# = PROJECT CONFIG =
# ==================

BUILD_NAME := fe6

SRC_DIR = src
ASM_DIR = asm
BUILD_DIR = build

CLEAN_FILES :=
CLEAN_DIRS  :=

all: compare

# ====================
# = TOOL DEFINITIONS =
# ====================

ifeq ($(OS),Windows_NT)
  EXE := .exe
else
  EXE :=
  UNAME_S := $(shell uname -s)
endif

PYTHON := python3
TOOLCHAIN ?= $(DEVKITARM)
AGBCC_HOME ?= tools/agbcc

ifneq (,$(TOOLCHAIN))
  export PATH := $(TOOLCHAIN)/bin:$(PATH)
endif

PREFIX := arm-none-eabi-

ifeq ($(UNAME_S),Darwin)
  ifneq (,$(TOOLCHAIN))
    PREFIX := $(TOOLCHAIN)/bin/$(PREFIX)
  endif
  SHASUM ?= shasum
endif

export OBJCOPY := $(PREFIX)objcopy
export AS := $(PREFIX)as
export CPP := $(PREFIX)cpp
export LD := $(PREFIX)ld
export STRIP := $(PREFIX)strip

CC1     := $(AGBCC_HOME)/bin/old_agbcc$(EXE)
CC1_NEW := $(AGBCC_HOME)/bin/agbcc$(EXE)

SHASUM ?= sha1sum

# ================
# = BUILD CONFIG =
# ================

CPPFLAGS := -I $(AGBCC_HOME)/include -I include -I . -nostdinc -undef
CFLAGS := -g -mthumb-interwork -Wimplicit -Wparentheses -Werror -fhex-asm -ffix-debug-line
CFLAG_OPT := -O2
ASFLAGS := -mcpu=arm7tdmi -I asm/include -I include

LDS := $(BUILD_NAME).lds
C_SRCS := $(wildcard $(SRC_DIR)/*.c)
ASM_SRCS := $(wildcard $(SRC_DIR)/*.s) $(wildcard $(ASM_DIR)/*.s)
DATA_SRCS := $(wildcard data/*.s)

C_GENERATED :=

# =========
# = Texts =
# =========
TEXT_DIR := texts
TEXT_TOOLS := tools/texttools

TEXT_DECODER := $(TEXT_TOOLS)/textdecoder.py
TEXT_DPARSER := $(TEXT_TOOLS)/textdeparser.py
TEXT_PROCESS := $(TEXT_TOOLS)/textprocess.py
TEXT_ENCODE := tools/textencode/textencode

TEXT_MAIN := $(TEXT_DIR)/texts.txt
TEXT_DEFS := $(TEXT_DIR)/textdefs.txt
TEXT_SRC  := $(TEXT_MAIN) $(shell find $(TEXT_DIR) -type f -name "*.txt")

TEXT_HEADER := include/constants/msg.h
MSG_LIST    := src/msg_data.c

# this should just be used for testing
$(TEXT_MAIN):
	@echo "[GEN]	$@"
	@$(PYTHON) $(TEXT_DECODER) > $@

$(MSG_LIST) $(TEXT_HEADER): $(TEXT_SRC) $(TEXT_DEFS)
	@echo "[GEN]	$@"
	@$(PYTHON) $(TEXT_PROCESS) $(TEXT_MAIN) $(TEXT_DEFS) $(MSG_LIST) $(TEXT_HEADER) cp932

C_GENERATED += $(MSG_LIST)
CLEAN_FILES += $(MSG_LIST) # $(TEXT_HEADER)

# ===========
# = Targets =
# ===========

ROM := $(BUILD_NAME).gba
ELF := $(ROM:%.gba=%.elf)
MAP := $(ROM:%.gba=%.map)

ifeq (,$(findstring $(C_GENERATED),$(C_SRCS)))
C_SRCS += $(C_GENERATED)
endif

C_OBJS := $(C_SRCS:%.c=$(BUILD_DIR)/%.o)
ASM_OBJS := $(ASM_SRCS:%.s=$(BUILD_DIR)/%.o)
DATA_OBJS := $(DATA_SRCS:%.s=$(BUILD_DIR)/%.o)

ALL_OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_OBJS)
ALL_DEPS := $(ALL_OBJS:%.o=%.d)

SUBDIRS := $(sort $(dir $(ALL_OBJS)))
$(shell mkdir -p $(SUBDIRS))

# ===========
# = RECIPES =
# ===========

compare: $(ROM)
	$(SHASUM) -c fe6.sha1

.PHONY: compare

%.gba: %.elf
	@echo "[OBJCPY]	$@"
	$(OBJCOPY) --strip-debug -O binary $< $@

$(ELF): $(ALL_OBJS) $(LDS)
	@echo "[LD]	$@"
	@cd $(BUILD_DIR) && $(LD) -T ../$(LDS) -Map ../$(MAP) -L../tools/agbcc/lib $(ALL_OBJS:$(BUILD_DIR)/%=%) -lc -lgcc -o ../$@

CLEAN_FILES += $(ROM) $(ELF) $(MAP)

# C dependency file
$(BUILD_DIR)/%.d: %.c
	@$(CPP) $(CPPFLAGS) $< -o $@ -MM -MG -MT $@ -MT $(BUILD_DIR)/$*.o

# C object
$(BUILD_DIR)/%.o: %.c $(BUILD_DIR)/%.d
	@echo "[CC]	$<"
	@$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CFLAGS) $(CFLAG_OPT) -o $(BUILD_DIR)/$*.s
	@echo ".text\n\t.align\t2, 0\n" >> $(BUILD_DIR)/$*.s
	@$(AS) $(ASFLAGS) $(BUILD_DIR)/$*.s -o $@
	@$(STRIP) -N .gcc2_compiled. $@

# ASM dependency file (dummy, generated with the object)
$(BUILD_DIR)/%.d: $(BUILD_DIR)/%.o
	@touch $@

# ASM object
$(BUILD_DIR)/%.o: %.s
	@echo "[AS]	$<"
	@$(AS) $(ASFLAGS) $< -o $@ --MD $(BUILD_DIR)/$*.d

ifneq (clean,$(MAKECMDGOALS))
  -include $(ALL_DEPS)
  .PRECIOUS: $(BUILD_DIR)/%.d
endif

CLEAN_DIRS += $(BUILD_DIR)

# ==============
# = Make clean =
# ==============
CLEAN_DIRS += $(shell find . -type d -name "__pycache__")

clean:
	@rm -f $(CLEAN_FILES)
	@rm -rf $(CLEAN_DIRS)
	@echo "all cleaned..."

.PHONY: clean

# ======================
# = CFLAGS overrides =
# ======================

%/main.o:           CFLAGS += -mtpcs-frame

%/irq.o:            CFLAG_OPT := -O0
%/random.o:         CFLAG_OPT := -O0
%/hardware.o:       CFLAG_OPT := -O0
%/move.o:           CFLAG_OPT := -O0
%/oam.o:            CFLAG_OPT := -O0
%/sound.o:          CFLAG_OPT := -O0
%/ramfunc.o:        CFLAG_OPT := -O0
%/proc.o:           CFLAG_OPT := -O0
%/icon.o:           CFLAG_OPT := -O0
%/debugtext.o:      CFLAG_OPT := -O0
%/text.o:           CFLAG_OPT := -O0
%/banim_sprite.o:   CFLAG_OPT := -O0
%/sprite.o:         CFLAG_OPT := -O0
%/face.o:           CFLAG_OPT := -O0
%/talk.o:           CFLAG_OPT := -O0
%/event.o:          CFLAG_OPT := -O0
%/spriteanim.o:     CFLAG_OPT := -O0
%/gamecontroller.o: CFLAG_OPT := -O0
%/msg.o:            CFLAG_OPT := -O0

%/mu.o:             CFLAG_OPT := -O0
%/manim.o:          CFLAG_OPT := -O0

%/gbasram.o:        CFLAG_OPT := -O1
%/shop.o:        	CFLAG_OPT := -O0
