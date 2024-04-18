### deps dont matter if you're using 'target' incorrectly (result/bin/nvim)
WD = $(HOME)/.config/nix/modules/nixvim

.PHONY: all
all: clean result

.PHONY: result
result:
ifeq ($(IN_WD),)
	$(info Changing directory)
	$(MAKE) -C $(WD) all IN_WD=1
else
	./scripts/build.sh
endif

.PHONY: clean
clean:
	rm -f result

.PHONY: run
run:
ifeq ($(IN_WD),)
	$(MAKE) -C $(WD) run IN_WD=1
else
	 ./scripts/run.sh
endif
