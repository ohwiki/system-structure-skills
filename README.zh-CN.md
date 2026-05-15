# System Structure Skills

一套面向 AI 编码工作流的“结构优先”技能仓库。

这套技能的目标很明确：**在大模型开始写代码之前，先让它理解问题，再理解系统该怎么落地，然后把这种结构约束一路带到 tasks 和真正编码阶段。**

当前仓库包含四个技能：

- `system-structure-requirements`：先写需求，稳定问题定义
- `system-structure-design`：先做概要设计和详细设计，形成系统蓝图
- `system-structure-tasks`：从设计拆出可执行任务，不能重发明结构
- `system-structure-implementation`：真正写代码时继续服从前面的设计和任务约束

完整链路是：

1. 先定义问题和验收边界
2. 再做概要设计，确定系统框架
3. 再做详细设计，确定内部结构和文件落点
4. 再从设计拆任务
5. 最后按设计和任务实施代码，不允许编码阶段偷偷改结构

这套技能主要解决一种很常见的问题：

- 模型太早开始写代码
- 需求不清就开始设计
- 设计不清就开始拆 tasks
- tasks 不清就直接开工
- 写着写着职责混乱、边界穿透、文件乱长

## 为什么要做这套技能

大模型通常并不是真的“不会写代码”。

真正的问题往往是：**它没有一张足够清楚的图纸。**

比如这些问题如果不先定清楚，后面就很容易走样：

- 现在到底要解决什么问题
- 哪些是范围内，哪些不是
- 旧行为哪些不能回归
- 系统要分成哪几个主模块
- 每个模块下面再拆成哪些结构单元
- 哪些依赖允许，哪些依赖禁止
- 逻辑最终该落在哪些文件
- 任务怎么从设计继承下来
- 真正实现时怎么避免一边写一边重做结构

这套 skills 就是为了解决这个问题而设计的。

## 技能说明

### `system-structure-requirements`

这是第一环。

它负责定义：

- 问题是什么
- 想达到什么结果
- 谁是用户 / 触发者
- 范围和非目标是什么
- 约束和边界是什么
- 输入输出预期是什么
- 验收标准是什么
- 哪些旧行为必须保护，不能回归

它的核心原则是：

**需求阶段定义“要做什么”和“不能破坏什么”，但不提前决定架构、模块和文件结构。**

### `system-structure-design`

这是第二环。

它会产出两阶段设计：

#### 概要设计
- 系统边界
- 非目标
- 框架和技术路线
- 顶层模块
- 系统调用和外部集成
- 关键约束

#### 详细设计
- 关键模块内部结构
- 每个内部单元负责什么 / 不负责什么
- 允许依赖 / 禁止依赖
- 公共接口和私有实现边界
- 关键流程
- 文件和目录落点

它的核心原则是：

**先定系统框架，再定内部结构和文件落点。**

### `system-structure-tasks`

这是第三环。

它的任务是把已经批准的设计拆成可执行 tasks，并且强制要求：

- task 必须继承设计
- 不能在 task 阶段新增模块
- 不能在 task 阶段改边界
- 不能把模糊设计偷偷推给实现阶段猜

也就是说：

**tasks 是从设计长出来的，不是重新做一遍设计。**

### `system-structure-implementation`

这是最后一环。

它不是在说“仓库帮你实现业务功能”，而是说：

**当模型真的开始写代码时，怎么继续服从前面已经批准的 requirements / design / tasks。**

它会约束模型在编码时继续检查：

- 这次实现的是哪个已批准 task
- 这段逻辑属于哪个模块
- 属于哪个内部单元
- 应该改哪些文件
- 哪些依赖允许，哪些依赖禁止
- 如果需要改结构，应该停下来返回设计，而不是直接写偏

它的核心原则是：

**实现阶段执行结构，不重新设计结构。**

## 推荐工作流

完整推荐链路：

```text
system-structure-requirements
-> review and approve requirements
-> system-structure-design
-> review and approve design
-> system-structure-tasks
-> approve tasks
-> system-structure-implementation
```

### 第一步：先写需求

示例提示词：

```text
用 $system-structure-requirements 先写需求，不要做设计。
先明确问题、范围、非目标、约束、验收标准和回归保护对象，不要提前决定架构、模块和文件结构。
```

### 第二步：再做设计

示例提示词：

```text
用 $system-structure-design 先做两阶段设计，不要写代码。
先做概要设计：明确系统边界、技术栈、主模块、系统调用和概要设计不负责的内容。
再做详细设计：明确模块内部结构、职责边界、依赖规则、文件落点和详细设计不负责的内容。
```

### 第三步：按设计拆任务

示例提示词：

```text
用 $system-structure-tasks 按已经确认的设计拆任务。
任务必须继承模块边界、内部结构、依赖规则和文件落点，不能在任务阶段重新发明结构。
```

### 第四步：按任务实现

示例提示词：

```text
用 $system-structure-implementation 实现已经批准的任务。
实现必须遵守模块边界、内部单元职责、依赖规则和文件落点；如果需要改结构，先停下来报告，不要直接改写设计。
```

## 什么时候适合用

适合这些情况：

- 功能已经大到“实现形状”很重要
- 现有仓库本身已经有结构，需要保护
- 要引入新服务、新子系统或新插件
- 你不想让模型再猜“逻辑该放哪里”
- 你希望 task 能追溯回设计
- 你希望编码阶段继续服从设计，而不是越写越散

特别适合：

- 需求澄清后再做架构
- 中大型功能开发
- 必须保护边界的重构
- 插件 / 服务 / 子系统设计
- 跨模块改动

## 什么时候不适合用

通常不适合：

- 很小的一次性脚本
- 临时自动化
- 极小范围的本地修补
- 纯样式或文案类改动

## 安装方式

你可以用三种常见方式安装：

1. 用 `skills CLI`
2. `git clone` 后复制 `skills/` 目录
3. 使用仓库自带安装脚本

### 技能应该装到哪里

常见目录如下：

| 环境 | 常见 skills 目录 |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Codex 本地技能目录 | `~/.codex/skills/` 或 `$CODEX_HOME/skills/` |
| 项目本地 agent 配置 | `<project>/.claude/skills/` 或等价本地目录 |

如果你的 agent 已经支持直接加载 skills 仓库，就优先用那个机制，不一定需要手工复制。

### 方式 1：用 skills CLI 安装全部技能

```bash
npx skills add ohwiki/system-structure-skills -g --all
```

### 方式 1a：只安装某一个 skill

```bash
npx skills add ohwiki/system-structure-skills -g --skill system-structure-requirements
npx skills add ohwiki/system-structure-skills -g --skill system-structure-design
npx skills add ohwiki/system-structure-skills -g --skill system-structure-tasks
npx skills add ohwiki/system-structure-skills -g --skill system-structure-implementation
```

### 方式 1b：只列出仓库里有哪些技能

```bash
npx skills add ohwiki/system-structure-skills -l
```

### 方式 2：clone 后手工复制

先 clone 仓库：

```bash
git clone https://github.com/ohwiki/system-structure-skills.git ~/.claude/plugins/system-structure-skills
```

然后把 `skills/` 下面的目录复制到你自己的技能目录。

Claude Code 示例：

```bash
mkdir -p ~/.claude/skills
cp -R ~/.claude/plugins/system-structure-skills/skills/* ~/.claude/skills/
```

Codex 示例：

```bash
mkdir -p ~/.codex/skills
cp -R ~/.claude/plugins/system-structure-skills/skills/* ~/.codex/skills/
```

### 方式 3：使用仓库自带安装脚本

如果已经 clone 仓库，可以执行：

```bash
cd system-structure-skills
bash scripts/install.sh
```

默认脚本会把 skills 安装到：

```bash
~/.claude/skills
```

如果你要给 Codex 安装到 `~/.codex/skills`，可以手工复制，或者按自己的环境改脚本。

## 安装后怎么验证

安装完成后，目标 skills 目录里应该能看到：

```text
system-structure-requirements/
system-structure-design/
system-structure-tasks/
system-structure-implementation/
```

并且你应该能直接通过名字调用它们：

- `$system-structure-requirements`
- `$system-structure-design`
- `$system-structure-tasks`
- `$system-structure-implementation`

## 安装后的最小使用流程

最短可用链路就是：

1. 先写需求
2. 再做设计
3. 再拆任务
4. 最后按任务实现

最小示例提示词：

```text
Use $system-structure-requirements to define the problem before design.
Use $system-structure-design to produce high-level and detailed design.
Use $system-structure-tasks to derive executable tasks from the approved design.
Use $system-structure-implementation to implement one approved task without reshaping the system.
```

## 仓库结构

```text
system-structure-skills/
├── README.md
├── README.zh-CN.md
├── .gitignore
├── scripts/
│   └── install.sh
├── examples/
│   └── theme-toggle-workflow/
└── skills/
    ├── system-structure-requirements/
    │   ├── SKILL.md
    │   ├── agents/
    │   │   └── openai.yaml
    │   └── references/
    │       ├── requirements-template.md
    │       └── review-gate.md
    ├── system-structure-design/
    │   ├── SKILL.md
    │   ├── agents/
    │   │   └── openai.yaml
    │   └── references/
    │       ├── diagram-guidance.md
    │       ├── review-gate.md
    │       └── system-blueprint-template.md
    ├── system-structure-tasks/
    │   ├── SKILL.md
    │   ├── agents/
    │   │   └── openai.yaml
    │   └── references/
    │       ├── review-gate.md
    │       └── task-template.md
    └── system-structure-implementation/
        ├── SKILL.md
        ├── agents/
        │   └── openai.yaml
        └── references/
            ├── execution-template.md
            └── review-gate.md
```

## 设计理念

这套 skills 建立在几个硬原则上：

- requirements、design、tasks、implementation 是四个不同阶段
- 每个阶段都必须明确“做什么 / 不做什么”
- requirements 先定义问题和验收边界，不能提前决定架构
- design 分概要设计和详细设计
- 详细设计必须把结构落到文件
- tasks 必须继承设计，而不是重写设计
- implementation 必须继承 design 和 tasks，而不是一边写一边偷偷重做结构
- 图可以帮助理解，但真正重要的是结构、边界、依赖和文件落点

## 示例

完整示例请看：

- [examples/theme-toggle-workflow](./examples/theme-toggle-workflow)
- [examples/cli-config-support-workflow](./examples/cli-config-support-workflow)
- [examples/legacy-module-refactor-workflow](./examples/legacy-module-refactor-workflow)

其中：

- `theme-toggle-workflow` 是偏前端的例子：
  - 增加浅色/深色主题切换
  - 展示状态、UI、持久化和文件落点如何贯穿四个阶段

- `cli-config-support-workflow` 是偏后端 / 工具链的例子：
  - 给现有 CLI 工具增加配置文件支持
  - 展示兼容性、优先级规则、解析边界和回归保护如何贯穿四个阶段

- `legacy-module-refactor-workflow` 是偏维护型重构的例子：
  - 把一个臃肿旧模块拆成 `service + adapter + policy`
  - 展示如何在保护既有行为的前提下，重划结构、职责和文件落点

它们都演示了一个真实需求如何依次经过：

- requirements
- design
- tasks
- implementation

## License

MIT
