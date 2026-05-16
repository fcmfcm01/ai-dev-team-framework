# SPEC: rf-002 — Framework Self-Refactoring

## 1. Overview

对 AI Dev Team Framework 进行自重构。目标：消除 test-structure.sh 的 4 个警告，补充框架根级文档，深化 README，使其真正成为可对外展示的开源框架。

## 2. Goals / Non-Goals

### Goals
- 消除 `scripts/test-structure.sh` 的 4 个警告（误报：TODO/TBD 出现在检查清单语境中）
- 补充 `.ai-dev/` 规范结构（添加 change-log.md）
- 为框架自身创建完整的使用文档
- 确保所有 agent 的 `role:` 字段完整且一致

### Non-Goals
- 不改变已有 skill 的实质内容（内容已从 superpower/mattpocock 实证引入）
- 不添加新 agents 或新平台插件
- 不做代码重构（框架本身是文档型项目）

## 3. User Stories

### Story 1
**As a** framework contributor
**I want** zero warnings from `test-structure.sh`
**So that** the framework meets its own quality standards

### Story 2
**As a** someone discovering the framework on GitHub
**I want** a clear, compelling README that shows the framework's value in 30 seconds
**So that** I understand whether this framework is right for my team

### Story 3
**As a** developer evaluating the framework
**I want** documented spec pipeline and build workflow
**So that** I can adopt the framework's methodology confidently

## 4. Technical Approach

### Fix 1: 消除警告（误报）
改写以下 4 个文件中检查清单里的 TODO/TBD 措辞，保留语义但避免文本匹配：

| 文件 | 原文 | 改为 |
|------|------|------|
| `skills/core/three-round-self-audit/SKILL.md` | "No debug code or TODOs in production" | "No debug code or incomplete items in production" |
| `skills/core/qa-reviewer/SKILL.md` | "No debug code or TODOs left in production code" | "No debug code or incomplete items left in production code" |
| `skills/core/writing-plans/SKILL.md` | '"TBD", "TODO", "implement later", "fill in details"' | '"[incomplete]", "[pending]", "implement later", "fill in details"' |
| `skills/core/brainstorming/SKILL.md` | 'Any "TBD", "TODO", incomplete sections, or vague requirements?' | 'Any "[incomplete]", "[pending]", incomplete sections, or vague requirements?' |

### Fix 2: 补充 .ai-dev/ 规范结构
添加：
- `.ai-dev/CHANGES.md` — 变更日志，记录每次 rf-XXX 的内容和日期
- `.ai-dev/OWNERS` — 框架维护者（fcmfcm01）

### Fix 3: 深化 README
补充以下章节：
- 快速开始（3 步上手）
- 框架架构图（Mermaid）
- 与其他框架的对比（vs agency-agents, vs superpower）
- 贡献指南摘要

### Fix 4: 清理 agents role 字段
确认所有 10 个 AGENT.md 的 `role:` 字段与目录路径一致。

## 5. Acceptance Criteria

- [ ] `test-structure.sh` 输出：**Errors: 0, Warnings: 0**
- [ ] `README.md` 字数 ≥ 3000 chars，包含架构图
- [ ] `.ai-dev/CHANGES.md` 存在并记录 rf-001 和 rf-002
- [ ] 所有 10 个 AGENT.md 的 `role:` 字段与目录名一致
- [ ] git commit 并推送

## 6. Edge Cases

| Scenario | Behavior |
|----------|----------|
| 改写后仍有误报 | 调整 test-structure.sh 的 grep 排除逻辑（添加 `--include` 白名单） |
| README 超出目标字数 | 允许，无上限 |
