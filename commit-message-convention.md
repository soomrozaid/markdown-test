# Commit Message Conventions

Git commit message conventions provide a standardized way to document changes, making project histories easier to read and automate. The most widely adopted standard is the Conventional Commits specification.


## 1. Structural Elements
A standard commit message generally follows this multi-part structure:
- Header (Mandatory): A short summary of the change.
- Body (Optional): Detailed explanation of the "why" behind the change.
- Footer (Optional): Metadata like breaking changes or issue tracking (e.g., Fixes #123)


## 2. Conventional Commits Format
The Conventional Commits specification uses a specific syntax for the header:

`<type>(<optional scope>): <description>`

Common types include:
- `feat`: A new feature for the user.
- `fix`: A bug fix.
- `docs`: Documentation-only changes.
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc.).
- `refactor`: Code changes that neither fix a bug nor add a feature.
- `perf`: A code change that improves performance.
- `test`: Adding missing tests or correcting existing ones.
- `chore`: Updates to build tasks, package manager configs, etc.

Breaking Changes are indicated by an exclamation mark after the type/scope (e.g., `feat(api)!: ...`) and a `BREAKING CHANGE:` text in the footer.

## 3. Best Practices: 
The "50/72 Rule"Industry standards, such as those detailed in the GitKraken Guide, often follow these rules:
- Limit the subject line to 50 characters: Keep it concise for easy scanning.
- Capitalize the subject line: Treat it like a sentence.
- Do not end the subject line with a period: Save space and maintain a clean look.
- Use the imperative mood: Write the subject as if you are giving a command (e.g., "Add feature" instead of "Added feature").
- Separate subject from body with a blank line: This ensures tools like git log --oneline only show the summary.
- Wrap the body at 72 characters: This prevents text from overflowing in terminal displays.


## 4. Example Commit
```bash
feat(auth): add multi-factor authentication

Implement MFA using TOTP to enhance user security. This change includes new database tables for storing secret keys and updates to the login flow.

Closes #456
```