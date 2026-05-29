# RULES FOR CONTRIBUTING 

This is a set of rules and guidelines for contributing to this project. Following these rules, will help maintain a high-quality codebase and ensure that contributions are accepted smoothly.

<br>

> [!Note]
> The following keywords in this document are to be interpreted as described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt) when, and only when, they appear in all uppercase form: 
> **MUST**,
> **MUST NOT**,
> **REQUIRED**,
> **SHALL**,
> **SHALL NOT**,
> **SHOULD**,
> **SHOULD NOT**,
> **RECOMMENDED**,
> **MAY**,
> **OPTIONAL**.

<br>

---

## Table of Contents
- [Commit Message Conventions](#commit-message-conventions)
  - [Commit Message Structure](#commit-message-structure)
  - [CLI Command](#cli-command)
  - [Types](#types)
  - [Scopes](#scopes)
  - [Breaking Changes Indicator](#breaking-changes-indicator)
  - [Description](#description)
  - [Body](#body)
  - [Footer](#footer)
  - [Examples](#examples)
- [Versioning](#versioning)
  - [Rules](#rules)
  - [Examples](#examples-1)
- [References](#references)

<br>
<br>

---

## Commit Message Conventions

<br>

> [!Note] 
> This convention is an opinionated standard that follows the specification outlined in [conventional commits](https://www.conventionalcommits.org/)

<br>

### Commit Message Structure
<pre>
<b><a href="#types">&lt;type&gt;</a></b></font>(<b><a href="#scopes">&lt;optional scope&gt;</a></b>): <b><a href="#description">&lt;description&gt;</a></b>
<sub>empty line as separator</sub>
<b><a href="#body">&lt;optional body&gt;</a></b>
<sub>empty line as separator</sub>
<b><a href="#footer">&lt;optional footer&gt;</a></b>
</pre>

See examples of acceptable [commit messages](#examples). 

### CLI Command
<pre>
git commit -m"<b><a href="#types">&lt;type&gt;</a></b></font>(<b><a href="#scopes">&lt;optional scope&gt;</a></b>): <b><a href="#description">&lt;description&gt;</a></b>" \
  -m"<b><a href="#body">&lt;optional body&gt;</a></b>" \
  -m"<b><a href="#footer">&lt;optional footer&gt;</a></b>"
</pre>

### Types
- Changes relevant to the API or UI:
    - `feat` Commits that add, adjust or remove a feature to/of/from the API or UI
    - `fix` Commits that fix an API or UI bug of a preceded `feat` commit
- `refactor` Commits that rewrite or restructure code without altering API or UI behavior
    - `perf` Commits are special type of `refactor` commits that specifically improve performance
- `style` Commits that address code style (e.g., white-space, formatting, missing semi-colons) and do not affect application behavior
- `test` Commits that add missing tests or correct existing ones
- `docs` Commits that exclusively affect documentation
- `build` Commits that affect build-related components such as build tools, dependencies, project version, ...
- `ops` Commits that affect operational aspects like infrastructure (IaC), deployment scripts, CI/CD pipelines, backups, monitoring, or recovery procedures, ...
- `chore` Commits that represent tasks like initial commit, modifying `.gitignore`, ...

  <br>
  <details>
  <summary><b>When to use each commit [type](#types)?</b></summary>
  <br>
  
  >
  > _Did you fix a bug?_ **Yes**: It's `fix`: <br>
  > **No**: _Did you change functionality or affect UI?_ **Yes**: It's `feat`: <br>
  > **No**: _Did you add or change tests?_ **Yes**: It's `test`: <br>
  > **No**: _Did you change code style or formatting (doesn't affect code behaviour)?_ **Yes**: It's `style`: <br>
  > **No**: _Did you make changes to documentation?_ **Yes**: It's `docs`: <br>
  > **No**: _Did you change how the project is built (eg. packages, dependencies, dockerfile, etc)?_ **Yes**: It's `build`: <br>
  > **No**: _Did you change something related to devops (eg. operational, deployment/CI/linting pipelines)?_ **Yes**: It's `ops`: <br>
  > **No**: _Did you complete a maintenance task or other non-code task for the project (eg. modifying .gitignore or making initial commit)?_ **Yes**: It's `chore`: <br>
  > **No**: _Did you rewrite or restructure code specifically for performance?_ **Yes**: It's `perf`: <br>
  > **No**: It's `refactor`: <br>
  >
  > Check out this [mermaid diagram](https://gist.github.com/JohnnyWalkerDigital/7207004e8efd79751dbf55ece0420ef2)

  <br>

  **Note:** If your commit includes multiple types of changes, split them into separate commits to maintain clarity and adhere to the convention.

  </details>

### Scopes
The `scope` provides additional contextual information.
* The scope is an **OPTIONAL** part
* Allowed scopes vary and are typically defined by the specific project
* **MUST NOT** use issue identifiers as scopes

### Breaking Changes Indicator
- A commit that introduce breaking changes **MUST** be indicated by an `!` before the `:` in the subject line e.g. `feat(api)!: remove status endpoint`
- Breaking changes **MUST** be described in the [commit footer section](#footer)

### Description
The `description` contains a concise description of the change. 
- The description is a **MANDATORY** part
- Use the imperative, present tense: "change" not "changed" nor "changes"
  - Think of `This commit will...` or `This commit should...`
- **MUST NOT** capitalize the first letter
- **MUST NOT** end the description with a period (`.`)
- In case of breaking changes also see [breaking changes indicator](#breaking-changes-indicator)

### Body
The `body` should include the motivation for the change and contrast this with previous behavior.
- The body is an **OPTIONAL** part
- Use the imperative, present tense: "change" not "changed" nor "changes"

### Footer
The `footer` should contain issue references and informations about **Breaking Changes**
- The footer is an **OPTIONAL** part, except if the commit introduce breaking changes
- **OPTIONAL** reference issue identifiers (e.g., `Closes #123`, `Fixes JIRA-456`) 
- **Breaking Changes:** **MUST** start with the word `BREAKING CHANGE:`
  - For a single line description just add a space after `BREAKING CHANGE:`
  - For a multi line description add two new lines after `BREAKING CHANGE:`


### Examples
<details>
<summary>Click to see examples</summary>

```
chore: init
```
```
feat: add email notifications on new direct messages
```
```
feat(shopping cart): add the amazing button
```
```
feat!: remove ticket list endpoint

refers to JIRA-1337

BREAKING CHANGE: ticket endpoints no longer supports list all entities.
```
```
fix(shopping-cart): prevent order an empty shopping cart
```
```
fix(api): fix wrong calculation of request body checksum
```
```
fix: add missing parameter to service call

The error occurred due to <reasons>.
```
```
perf: decrease memory footprint for determine unique visitors by using HyperLogLog
```
```
build: update dependencies
```
```
build(release): bump version to 1.0.0
```
```
refactor: implement fibonacci number calculation as recursion
```
```
style: remove empty line
```
</details>

<br>
<br>

<a href="#table-of-contents">↑ Back to the Top</a>

---

## Versioning

### Rules

- **If** your next release contains commit with...
   - **Breaking Changes** incremented the **major version**
   - **API relevant changes** (`feat` or `fix`) incremented the **minor version**
- **Else** increment the **patch version**

`<major>.<minor>.<patch>`

### Examples
- `feat: add new API endpoint` 1.0.0 → 1.1.0
- `fix: correct API response` 1.0.0 → 1.1.0
- `refactor: rewrite API implementation` 1.0.0 → 1.0.1
- `feat!: remove API endpoint` 1.0.0 → 2.0.0

<br>
<br>

<a href="#table-of-contents">↑ Back to the Top</a>

---

## References 
- https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13
- https://www.conventionalcommits.org/
- https://git-scm.com/docs/git-interpret-trailers
- https://www.ietf.org/rfc/rfc2119.txt

<br>
<br>

<a href="#table-of-contents">↑ Back to the Top</a>