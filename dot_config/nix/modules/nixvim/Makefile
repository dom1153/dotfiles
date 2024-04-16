DEP = $(shell find config/ -type f -name '*.nix' -o -name '*.lua')
DT = date "+%Y/%m/%d %H:%M:%S"
WD = $(HOME)/.config/nix/modules/nixvim
# IN_WD = 0
LOG_FILE = build.log
LOGFILE=$(LOGPATH)$(shell date)

ECHO_CMD = echo "Running $@..."

define custom_log
@echo $(1) | tee -a $LOG_FILE
endef

### .PHONY - does not look for a real file 'all'
.PHONY: clean all
all: result

.PHONY: result
result: $(DEP)
ifeq ($(IN_WD),)
	$(info Changing directory)
	$(MAKE) -C $(WD) all IN_WD=1
else
	@echo "PWD is $(shell PWD)" | tee -a $(LOG_FILE)
	@date +"=== Start %Y/%m/%d %H:%M:%S" | tee -a $(LOG_FILE)
	nix build . 2>&1| tee -a $(LOG_FILE)
	@date +"=== Complete %Y/%m/%d %H:%M:%S" | tee -a $(LOG_FILE)
endif

.PHONY: clean
clean:
	rm -f result

# $(info your_text) : Information. This doesn't stop the execution.
# $(warning your_text) : Warning. This shows the text as a warning.
# $(error your_text) : Fatal Error. This will stop the execution.

### makefile reference
# https://github.com/twpayne/chezmoi/blob/master/Makefile
### logging
# https://stackoverflow.com/questions/54933242/how-do-i-make-a-makefile-to-log-both-command-and-its-output-to-a-file
### wildcards
# https://stackoverflow.com/questions/2483182/recursive-wildcards-in-gnu-make

# @echo $d
# @echo $(LOGFILE)
# @echo "=== $(shell $(DT))" | tee -a $(LOG_FILE)
# @sleep 2
