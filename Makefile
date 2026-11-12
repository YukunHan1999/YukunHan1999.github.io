PROJECT_NAME := YukunHan1999.github.io
VERSION := 1.0

# 颜色输出（终端美化）
COLOR_RESET := \033[0m
COLOR_GREEN := \033[32m
COLOR_YELLOW := \033[33m
COLOR_BLUE := \033[34m
COLOR_RED := \033[31m

# ==================== 默认目标 ====================
.PHONY: all
all: help

# ==================== 帮助信息 ====================
.PHONY: help
help: ## > 显示帮助信息
	@echo "$(COLOR_BLUE)================================================================$(COLOR_RESET)"
	@echo "$(COLOR_GREEN)  $(PROJECT_NAME):v$(VERSION) 项目管理工具! $(COLOR_RESET)"
	@echo "$(COLOR_BLUE)================================================================$(COLOR_RESET)"
	@echo ""
	@echo "$(COLOR_YELLOW)可用命令:$(COLOR_RESET)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  $(COLOR_GREEN)%-20s$(COLOR_RESET) %s\n", $$1, $$2}'
	@echo ""

# ==================== 项目管理 ====================
.PHONY: para 
para: ## > 部署para项目
	@echo "$(COLOR_BLUE)→ 开始读取项目para...$(COLOR_RESET)"
	sudo rm -rf p001 && sudo mkdir -p p001
	sudo cp -r /workspace/dev/rust_dev/workspace/github.com/YukunHan1999/para/docs/* ./p001/
	@echo "$(COLOR_GREEN)✓ 成功读取项目para信息到p001目录下, 请验证!$(COLOR_RESET)";

.PHONY: cgroup 
cgroup: ## > 部署cgroup项目
	@echo "$(COLOR_BLUE)→ 开始读取项目cgroup...$(COLOR_RESET)"
	sudo rm -rf p002 && sudo mkdir -p p002 
	sudo cp -r /workspace/dev/python_nodejs_dev/workspace/hyk.com/cgroup/docs/.vitepress/dist/* ./p002/
	@echo "$(COLOR_GREEN)✓ 成功读取项目cgroup信息到p002目录下, 请验证!$(COLOR_RESET)";

.PHONY: deploy
deploy: ## > 不维护提交信息, 开始推送远端仓库
	@echo "$(COLOR_BLUE)→ 开始部署所有项目...$(COLOR_RESET)"
	git checkout --orphan tmp; \
		git rm -rf --cached .; \
		git add -A; \
		git commit -m "deploy"; \
		git branch -D main; \
		git branch -m main; \
		git push -f origin main; \
		git branch --set-upstream-to=origin/main main
	@echo "$(COLOR_GREEN)✓ 成功推送项目, 请稍候验证: https://yukunhan1999.github.io$(COLOR_RESET)";
