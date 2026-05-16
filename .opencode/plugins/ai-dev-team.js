"use strict"
/**
 * AI Dev Team Framework — OpenCode Plugin
 *
 * Hooks into OpenCode session lifecycle to:
 * 1. Inject framework context on session creation
 * 2. Preserve framework context during session compaction
 * 3. Register custom tools for orchestrator workflow
 *
 * Plugin structure: .opencode/plugins/ai-dev-team.js
 */

const FRAMEWORK_PATHS = {
  skillsCore: "skills/core",
  skillsEngineering: "skills/engineering",
  skillsDesign: "skills/design",
  agents: "agents",
  specTemplates: "specs/templates",
  changesLog: ".ai-dev/CHANGES.md",
}

/**
 * Read a file safely, return null if not found.
 */
async function safeReadFile(filePath, project) {
  try {
    return await project.readFile(filePath)
  } catch {
    return null
  }
}

/**
 * List files in a directory recursively.
 */
async function listFrameworkFiles(project, basePath) {
  try {
    const files = []
    const entries = await project.readDirectory(basePath)
    for (const [name, type] of entries) {
      const relPath = `${basePath}/${name}`
      if (type === "file" && (name.endsWith(".md") || name === "plugin.json")) {
        files.push(relPath)
      }
    }
    return files
  } catch {
    return []
  }
}

export const AiDevTeamPlugin = async ({ project, client, $, directory }) => {
  // Inject framework context into the session on creation
  await injectFrameworkContext(project, client)

  return {
    /**
     * Session compaction hook — ensure framework context survives compaction.
     * The AI Dev Team Framework is knowledge-intensive; we want the LLM to
     * retain understanding of skills, agents, and workflows across compaction.
     */
    "experimental.session.compacting": async (input, output) => {
      output.context.push(`
## AI Dev Team Framework — Session Context

This session uses the AI Dev Team Framework. Key files:
- .ai-dev/CHANGES.md — framework changelog
- CLAUDE.md — AI agent instructions
- AGENTS.md — agent coordination protocol
- skills/core/orchestrator/SKILL.md — orchestrator workflow
- skills/core/spec-driven/SKILL.md — spec creation pipeline
- skills/core/subagent-driven/SKILL.md — subagent dispatch pattern
- skills/core/tdd/SKILL.md — test-driven development
- skills/core/qa-reviewer/SKILL.md — QA review gate
- skills/core/three-round-self-audit/SKILL.md — quality self-check

Core principle: Orchestrator First. The orchestrator never codes directly.
It decomposes, delegates, and reviews.
`)
    },

    /**
     * After each tool execution, check if the worktree state is consistent.
     * This is informational — helps the LLM keep worktrees in sync.
     */
    "tool.execute.after": async (input, output) => {
      // Log framework-aware tool usage for observability
      if (input.tool === "bash") {
        const cmd = output.args?.command || ""
        if (cmd.includes("git worktree")) {
          await client.app.log({
            body: {
              service: "ai-dev-team",
              level: "info",
              message: "Worktree operation detected",
              extra: { command: cmd.slice(0, 100) },
            },
          })
        }
      }
    },

    /**
     * Custom tools for orchestrator workflow.
     * These are available to the LLM via the tools interface.
     */
    tool: {
      /**
       * List available skills in the framework.
       */
      "ai-dev-team.list-skills": {
        description: "List all available skills in the AI Dev Team Framework",
        args: {
          category: {
            type: "string",
            description: "Skill category: core, engineering, or design",
            optional: true,
          },
        },
        async execute(args, context) {
          const { project } = context
          const category = args.category || "core"
          const basePath = category === "core" ? "skills/core"
            : category === "engineering" ? "skills/engineering"
            : category === "design" ? "skills/design"
            : "skills"

          const files = await listFrameworkFiles(project, basePath)
          const skills = files
            .filter((f) => f.endsWith("/SKILL.md"))
            .map((f) => f.replace("/SKILL.md", "").replace(basePath + "/", ""))

          return `Available ${category} skills:\n${skills.map((s) => `- ${s}`).join("\n")}`
        },
      },

      /**
       * Read a skill file and return its content.
       */
      "ai-dev-team.read-skill": {
        description: "Read a skill file from the AI Dev Team Framework",
        args: {
          skillPath: {
            type: "string",
            description: "Skill path relative to skills/ (e.g., core/tdd or engineering/diagnose)",
          },
        },
        async execute(args, context) {
          const { project } = context
          const skillPath = `skills/${args.skillPath}/SKILL.md`
          const content = await safeReadFile(skillPath, project)
          if (!content) {
            return `Skill not found: ${skillPath}`
          }
          return content
        },
      },

      /**
       * Read an agent definition file.
       */
      "ai-dev-team.read-agent": {
        description: "Read an agent definition from the AI Dev Team Framework",
        args: {
          agentPath: {
            type: "string",
            description: "Agent path relative to agents/ (e.g., engineering/frontend-developer)",
          },
        },
        async execute(args, context) {
          const { project } = context
          const agentPath = `agents/${args.agentPath}/AGENT.md`
          const content = await safeReadFile(agentPath, project)
          if (!content) {
            return `Agent not found: ${agentPath}`
          }
          return content
        },
      },

      /**
       * List specs in .ai-dev/specs/.
       */
      "ai-dev-team.list-specs": {
        description: "List all specs in .ai-dev/specs/",
        args: {},
        async execute(args, context) {
          const { project } = context
          const files = await listFrameworkFiles(project, ".ai-dev/specs")
          return `Available specs:\n${files.map((f) => `- ${f}`).join("\n")}`
        },
      },
    },
  }
}

/**
 * Inject AI Dev Team Framework context into the session on creation.
 * Reads key files and injects them as system context.
 */
async function injectFrameworkContext(project, client) {
  try {
    // Check if this is a framework project
    const hasFramework = await project.fileExists("CLAUDE.md") &&
                          await project.fileExists("AGENTS.md") &&
                          await project.fileExists("skills/core/orchestrator/SKILL.md")

    if (!hasFramework) {
      return
    }

    // Log that framework is active
    await client.app.log({
      body: {
        service: "ai-dev-team",
        level: "info",
        message: "AI Dev Team Framework detected — orchestrator mode available",
      },
    })
  } catch (err) {
    // Non-fatal: framework detection should not break the session
    await client.app.log({
      body: {
        service: "ai-dev-team",
        level: "warn",
        message: "Framework context injection failed (non-fatal)",
        extra: { error: String(err) },
      },
    })
  }
}
