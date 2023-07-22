SHELL := /usr/bin/env bash -eu
BITS_STDCPP_PCH_DIR := include/bits/stdc++.h.pch
BITS_STDCPP_H := include/bits/stdc++.h

.PHONY:	setup
setup:
	echo $$KPR_CXX_COMMON_FLAGS | tr -s ' ' '\n' > compile_flags.txt
	[ -e ./external/arumakan1727/kyopro-cpplib/.git ] || git submodule update --init
	make pre-compile

.PHONY:	update
update:
	git pull --ff-only
	git submodule update
	make pre-compile


.PHONY:	pre-compile
pre-compile:	\
	$(BITS_STDCPP_PCH_DIR)/debug.pch \
	$(BITS_STDCPP_PCH_DIR)/release.pch \
	$(BITS_STDCPP_PCH_DIR)/rel_with_check.pch \

$(BITS_STDCPP_PCH_DIR)/debug.pch:	$(BITS_STDCPP_H) Makefile .rtx.toml
	@mkdir -p $(BITS_STDCPP_PCH_DIR)
	clang++ -x c++-header $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_DEBUG_FLAGS $< -o $@

$(BITS_STDCPP_PCH_DIR)/release.pch:	$(BITS_STDCPP_H) Makefile .rtx.toml
	@mkdir -p $(BITS_STDCPP_PCH_DIR)
	clang++ -x c++-header $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_RELEASE_FLAGS $< -o $@

$(BITS_STDCPP_PCH_DIR)/rel_with_check.pch:	$(BITS_STDCPP_H) Makefile .rtx.toml
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
