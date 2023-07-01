SHELL := /usr/bin/env bash
BITS_STDCPP_GCH_DIR := include/bits/stdc++.h.gch
BITS_STDCPP_H := include/bits/stdc++.h
COMPILE_FLAGS_ENV := compile_flags.env

.PHONY:	setup
setup:
	./scripts/gen_cpp_compile_flags.sh > compile_flags.txt


.PHONY:	pre-compile
pre-compile:	\
	$(BITS_STDCPP_GCH_DIR)/debug.gch \
	$(BITS_STDCPP_GCH_DIR)/release.gch \
	$(BITS_STDCPP_GCH_DIR)/rel_with_check.gch \

$(BITS_STDCPP_GCH_DIR)/debug.gch:	$(BITS_STDCPP_H)
	@mkdir -p $(BITS_STDCPP_GCH_DIR)
	g++ -x c++-header $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_DEBUG_FLAGS $^ -o $@

$(BITS_STDCPP_GCH_DIR)/release.gch:	$(BITS_STDCPP_H)
	@mkdir -p $(BITS_STDCPP_GCH_DIR)
	g++ -x c++-header $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_RELASE_FLAGS $^ -o $@

$(BITS_STDCPP_GCH_DIR)/rel_with_check.gch:	$(BITS_STDCPP_H)
	@mkdir -p $(BITS_STDCPP_GCH_DIR)
	g++ -x c++-header $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_REL_WITH_CHECK_FLAGS $^ -o $@


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
