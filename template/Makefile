SHELL := /usr/bin/env bash -eu
PCH_DIR := $$KPR_REPO_ROOT/include/bits/stdc++.h.pch
SRCS := main.cpp

.PHONY:	clean
clean:
	rm -rf build a.out


build/cpp/debug:	$(SRCS)
	@mkdir -p $(dir $@)
	clang++ $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_DEBUG_FLAGS -include-pch $(PCH_DIR)/debug.pch \
		$^ -o $@
	ln -snf $@ a.out

build/cpp/release:	$(SRCS)
	@mkdir -p $(dir $@)
	clang++ $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_RELEASE_FLAGS -include-pch $(PCH_DIR)/release.pch \
		$^ -o $@
	ln -snf $@ a.out

build/cpp/rel_with_check:	$(SRCS)
	@mkdir -p $(dir $@)
	clang++ $$KPR_CXX_COMMON_FLAGS $$KPR_CXX_REL_WITH_CHECK_FLAGS -include-pch $(PCH_DIR)/rel_with_check.pch \
		$^ -o $@
	ln -snf $@ a.out
