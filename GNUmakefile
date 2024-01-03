.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# The build soure files - if any of these change, the site needs to be rebuilt
HUGOSOURCES = $(shell find assets content layouts hugo.toml -type f)

public: $(HUGOSOURCES) ## Build the site
	hugo \
		--ignoreCache

.PHONY: clean
clean: ## Clean the build directory
	rm -rf resources public

.PHONY: checkimg
checkimg: ## Check for zero byte generated images
	scripts/checkimg.sh
