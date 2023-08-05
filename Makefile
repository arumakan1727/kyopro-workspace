SHELL := /usr/bin/env bash -eu
BITS_STDCPP_PCH_DIR := include/bits/stdc++.h.pch
BITS_STDCPP_H := include/bits/stdc++.h
PCH_DEPS := $(BITS_STDCPP_H) Makefile .rtx.toml external/arumakan1727/kyopro-cpplib/.git/HEAD

.PHONY:	setup
setup:
	[ -e ./external/arumakan1727/kyopro-cpplib/.git ] || git submodule update --init
	make compile_flags.txt pre-compile


.PHONY:	update
update:
	git pull --ff-only
	git submodule update
	make compile_flags.txt pre-compile
	make lint


.PHONY:	pre-compile
pre-compile:	\
	$(BITS_STDCPP_PCH_DIR)/debug.pch \
	$(BITS_STDCPP_PCH_DIR)/release.pch \
	$(BITS_STDCPP_PCH_DIR)/rel_with_check.pch \


.PHONY:	lint
lint:
	clang++ -fsyntax-only -Werror $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_DEBUG_FLAGS template/main.cpp


compile_flags.txt:	Makefile .rtx.toml
	echo $$KPR_CXX_COMMON_FLAGS -DARMKN_DEBUG | tr -s ' ' '\n' > compile_flags.txt


$(BITS_STDCPP_PCH_DIR)/debug.pch:	$(PCH_DEPS)
	@mkdir -p $(BITS_STDCPP_PCH_DIR)
	clang++ -x c++-header $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_DEBUG_FLAGS $< -o $@

$(BITS_STDCPP_PCH_DIR)/release.pch:	$(PCH_DEPS)
	@mkdir -p $(BITS_STDCPP_PCH_DIR)
	clang++ -x c++-header $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_RELEASE_FLAGS $< -o $@

$(BITS_STDCPP_PCH_DIR)/rel_with_check.pch:	$(PCH_DEPS)
	@mkdir -p $(BITS_STDCPP_PCH_DIR)
	clang++ -x c++-header $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_REL_WITH_CHECK_FLAGS $< -o $@


.PHONY:	inspect
inspect:
	@which bash
	@bash --version
	@echo ----------------
	@which gcc
	@gcc --version
	@echo ----------------
	@echo "KPR_CXX_COMMON_FLAGS=$$KPR_CXX_COMMON_FLAGS"
	@echo "KPR_CXX_DEBUG_FLAGS=$$KPR_CXX_DEBUG_FLAGS"
	@echo "KPR_CXX_RELEASE_FLAGS=$$KPR_CXX_RELEASE_FLAGS"
	@echo "KPR_CXX_REL_WITH_CHECK_FLAGS=$$KPR_CXX_REL_WITH_CHECK_FLAGS"
