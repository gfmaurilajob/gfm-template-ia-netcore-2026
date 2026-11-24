---
name: spec-kit-sdd
description: Use when the user wants to build a feature or application from a written specification, fix a bug with a recorded assessment, or decide whether an idea is worth building, using GitHub's open-source Spec Kit (the Specify CLI and its /speckit commands).
---

# Spec-driven work with GitHub Spec Kit

Spec Kit (GitHub, open source, MIT) gives a coding agent structured processes, templates and recorded outcomes. Its main process is Spec-Driven Development: the user states what to build and why, and the agent turns that specification into a plan, tasks and working code, reviewing each step. It also ships a bug-fixing process and an idea-assessment process. This skill teaches the AI when to use Spec Kit, how to set it up and how to keep each step reviewable.

## When to use it

- A new feature or application where the requirements are still being decided.
- A bug that should end with a documented cause and a verified fix.
- An idea the user is not sure deserves the investment (go, needs clarification or stop).

For a one-line change, do not start a Spec Kit process: just do the change.

## Setup (once per machine, then once per project)

1. Requirements: Python 3.11 or newer, uv, and a supported coding agent (Claude Code, Copilot, Cursor, Codex and others).
2. Install the CLI and create or prepare the project, choosing the integration for the agent in use:

   ```
   uv tool install specify-cli
   specify init my-project --integration copilot
   ```

   For an existing codebase, follow the "Existing projects" page of the official docs. For other agents, look up the integration key and the command syntax in the docs before running `init`.
3. Optional processes are installed per project:

   ```
   specify extension add bug
   specify extension add assess
   ```

Official sources: https://github.com/github/spec-kit and https://github.github.io/spec-kit/. Community extensions, presets and catalogs are not audited by GitHub: read their source before installing them.

## How to work with it

1. Run the Spec Kit commands in the agent chat, one at a time, and stop after each one for the user to review the generated file. Never chain the whole flow without review.
2. Spec-Driven Development, in order: `/speckit-constitution` once per project (principles), then for each feature `/speckit-specify` (what and why, no technology), `/speckit-plan` (technology and architecture), `/speckit-tasks`, `/speckit-implement` and `/speckit-converge`. Repeat implement and converge until convergence reports that it converged.
3. Keep the specification about the problem and the user. Technology choices belong in the plan step.
4. Bug fixing: `/speckit-bug-assess` with a short description and a slug, then `/speckit-bug-fix` and `/speckit-bug-test`. Only a `verified` verdict means the fix is confirmed; report `partial` or `failed` honestly.
5. Idea assessment: the `/speckit-assess-*` commands from intake to decide. A documented "stop" is a valid result.
6. When a generated artifact is wrong, edit the Markdown file and continue, instead of rerunning the whole stage.

The exact command names can differ between agents (some use a dot or a different prefix). Check the invocation syntax page of the docs for the agent in use.

## Typical requests

- "Use Spec Kit to specify and build a booking page for my clinic."
- "Assess with Spec Kit whether offline mode is worth building."
- "Open a Spec Kit bug process for the crash on empty password."

<!-- veyloq-credit -->
> Guide written by VEYLOQ about: Spec Kit, by GitHub, Inc. (MIT). https://github.com/github/spec-kit @ 38c40ae

## Response language

Always answer the user in Brazilian Portuguese (pt-BR), even though these instructions are in English. Keep code, commands, file names and technical terms as they are.
