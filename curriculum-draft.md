# course-git
Git for Software Engineer




Here's the extracted content and assignments, formatted into a `content.md` file as requested.

```markdown
# Git Course Content and Assignments for ThaiChat Application

This document outlines the key concepts and associated assignments from the "Learn Git - The Full Course" on Boot.dev, adapted for developing the ThaiChat application, focusing on using Git for solo development (Course 1) and effectively in a team (Course 2).

## Course Structure and Overview
*   The course is divided into **two main parts**, totaling **22 chapters**.
*   **Course 1** focuses on **using Git as a solo developer**, covering foundational concepts.
*   **Course 2** covers **advanced topics for effective team collaboration** with Git.
*   The course is **highly interactive**, featuring lessons and projects that require hands-on keyboard practice.

### Topics Covered (Course start)
[x] *   Setting up Git
[x] *   Repositories
[x] *   Git internals
[x] *   Git configurations
[x] *   Branches
[x] *   Merging
[x] *   Rebase
[ ] *   Ignoring files with `.gitignore`
[x] *   Git reset
[x] *   Git Reflog
[x] *   Remotes
[x] *   Using Gitlab with Git


### Topics Covered (Course end)
[x] *   Signature
[x] *   Merge conflicts
[x] *   Rebase conflicts
[x] *   Rebase Interactive
[ ] *   Squashing
[x] *   Stashing
[x] *   Reverting
[x] *   Cherry-picking
[x] *   `git checkout <branch> -- <file>`
[ ] *   `git bisect`
[x] *   Tags
[ ] *   Hooks and pre-commit
[-] *   Forking
[-] *   Multi Remotes
[-] *   `git worktree`



## Core Git Concepts and Operations

### 1. Git Fundamentals
*   **Git is a Version Control System** that allows you to track code changes over time by author, with commands to search, manipulate, and revert history.
*   **Git is not GitHub, GitLab, or Stash**; those are companies that use Git.
*   **Porcelain vs. Plumbing Commands**: Git commands are divided into high-level (porcelain) commands, used most often by developers for everyday interaction (e.g., `git status`, `git add`, `git commit`), and low-level (plumbing) commands for underlying tools and operations (e.g., `git cat-file`, `git hash-object`). 99% of the time, developers use porcelain commands.
*   **Git was created by Linus Torvalds** in 5 days in 2005 due to license disputes with BitKeeper.

### 2. Git Configuration
*   **Git configuration stores user information** (name, email) and operational settings.
*   Configurations are stored in **plain text files** in either **global space** (user's home directory, `.gitconfig`) or **local space** (within the project's `.git/config` folder).
*   **Configuration precedence**: Worktree-specific > Local > Global > System.
*   **`git config --add <scope> <key> <value>`**: Adds a key-value pair.
*   **`git config --list <scope>`**: Lists configuration values.
*   **`git config <key>`**: Retrieves a single value.
*   **`git config --unset <key>`**: Removes a single configuration value. Requires both section and key.
*   **`git config --unset-all <key>`**: Removes all values for a multi-existing key.
*   **`git config --remove-section <section>`**: Removes an entire section and all its keys/values.

#### Assignments (Git Configuration)
*   Set ThaiChat-specific key/value pairs (e.g., `thaichat.version`, `thaichat.language`, `thaichat.environment`) in your **local** Git configuration.
*   Retrieve the `thaichat.version` value using `git config`.
*   Remove all `thaichat.language` entries using `git config --unset-all`.
*   Remove the entire `thaichat` section using `git config --remove-section`.

### 3. Git Repository and File States
*   **Git Repository (Repo)**: Represents a single project and is essentially a directory containing project files and a hidden `.git` directory. The `.git` directory stores the **entire state of your Git project**.
*   **File States**: Files in a Git repository can be **untracked**, **staged**, or **committed**.
    *   **Untracked**: Git doesn't know about the file; it's never been added to the index.
    *   **Staged (Index)**: Changes are prepared to be included in the next commit.
    *   **Committed**: A snapshot of the repository at a given time has been recorded.

#### Assignments (Repository and File States)
*   Navigate to your file system, create a new directory called `thaichat`, and initialize a new Git repository using `git init`.
*   Create a file named `README.md` in the root and add ThaiChat application description.
*   Add the `README.md` file to the staging area using `git add`.
*   Commit the `README.md` file with the message "Add ThaiChat README".

### 4. Git Internals: Objects, Trees, and Blobs
*   **Git Objects**: All data in a Git repository is stored as objects in the `.git/objects` directory.
*   **Blobs**: Represent the content of a file.
*   **Trees**: Represent a directory, containing pointers to blobs (files) and other trees (subdirectories).
*   **Commits**: A commit object includes metadata (author, timestamp, message) and a pointer to a **root tree** object.
    *   **Git stores entire snapshots of files per commit**, not just diffs (deltas). This is made efficient through **compression and deduplication** of identical files across commits.
    *   A commit's hash is unique and consistent, generated from its contents, author, timestamp, and parent information.
*   **`git cat-file -p <hash>`**: A plumbing command used to view the contents of Git objects (commits, trees, blobs) directly.

#### Assignments (Internals: Objects, Trees, Blobs)
*   View your latest commit hash using `git log -1` and find its corresponding object file in `.git/objects`.
*   Use `boot.run` to submit the path to your commit object file.
*   Use `git cat-file -p` on your commit hash to find the root tree hash, then use `git cat-file -p` on the tree hash to find the blob hash for `README.md`. Submit the blob hash.
*   Add a new directory called `src`, add two files (`chat.go`, `status.go`), and commit them in a single commit.
*   Use `git cat-file` to view the blob hash for `config.go` (after adding a `config.go` file in a previous implicit step) and observe it remains the same if the file hasn't changed across commits.

### 5. Git Log
*   **`git log`**: Shows the history of commits in a repository, including who made the commit, when, and what changed.
*   **Useful Flags**:
    *   `--one-line`: Condensed view with shortened hashes and commit messages.
    *   `--graph`: Draws ASCII art to visualize branching and merging history.
    *   `--decorate`: Shows branch and tag information (where `HEAD`, branches, and tags point).
    *   `--parents`: Shows the parent commit(s) for each commit (useful for merge commits).
    *   `--no-pager`: Prints output directly to standard out without a pager.

#### Assignments (Git Log)
*   Run `git log --no-pager -n1`.
*   Run `git log --graph --decorate --one-line --parents` and explain the decorations.
*   Answer a question about why a merge commit's log shows three commit hashes (its own and two parents').

### 6. Git Branching
*   **Branch**: A **lightweight, mutable pointer to a commit**. It allows you to keep track of different changes separately.
*   **Tip**: The latest commit on a branch.
*   **Merge Base**: The nearest common ancestor commit between two diverging branches.
*   **Default Branch**: GitHub and GitLab now default to `main` instead of `master`. It's recommended to use `main` if working with GitHub.
*   **Creating Branches**:
    *   `git branch <new-branch-name>`: Creates a new branch at the current commit.
    *   `git switch -c <new-branch-name>`: Creates and immediately switches to a new branch (recommended modern command).
    *   `git checkout -b <new-branch-name>`: Older command to create and switch.
*   **Switching Branches**:
    *   `git switch <branch-name>`: Switches to an existing branch (recommended modern command).
    *   `git checkout <branch-name>`: Older command to switch branches.

#### Assignments (Git Branching)
*   Check your current branch using `git branch`.
*   Create and switch to a new branch called `add-authentication` using `git switch -c`.
*   Switch to `main` and then back to `add-authentication` using `git switch`.
*   On the `add-authentication` branch, create a new file `auth.go` with authentication logic, then stage and commit it with a message starting with 'D'.
*   Answer questions about a branch diagram.

### 7. Git Merging
*   **Merging**: The process of bringing changes from one branch back into another (typically main).
*   **Merge Commit**: A special commit created when merging two diverging branches, unique because it has **two parent commits**. It represents the combined history of both branches.
*   **Fast-Forward Merge**: Occurs when the branch being merged has all the commits of the target branch, and the target branch hasn't diverged. Git simply moves the target branch's pointer forward to the tip of the feature branch, **without creating a new merge commit**.

#### Assignments (Git Merging)
*   Switch to `main`, update `README.md` with ThaiChat features, and commit the changes with a message starting with 'E'.
*   Merge the `add-authentication` branch into `main`, creating a merge commit (message starting with 'F').
*   Delete the `add-authentication` branch.
*   Create a new branch `update-ui` off `main`.
*   Update the `ui.go` file with new Thai language interface and commit it with a message starting with 'G'.
*   Switch back to `main` and merge `update-ui` into it (this should be a fast-forward merge).

### 8. Git Rebasing
*   **Rebase**: Helps to take diverging commits from one branch and **move them to the tip of the base branch**, creating a linear history.
*   **Mechanism**: When rebasing branch `feature` onto `main`, Git effectively checks out `main`, then **replays** `feature`'s commits (starting from their merge base) one by one on top of `main`'s tip.
*   **History Rewrite**: Rebasing **rewrites Git history** by creating new commits with new SHAs, as the parent of the replayed commits changes.
*   **Benefit**: Creates a cleaner, linear history, making it easier to read and potentially revert. Allows for fast-forward merges when integrating into the base branch.
*   **Critical Warning**: **Never rebase a public (shared) branch** like `main`, as it will rewrite shared history and cause conflicts for collaborators. Rebase personal branches onto public branches is generally okay.
*   **Interactive Rebase (`git rebase -i`)**: Allows you to edit commit history (squash, reorder, delete commits) before replaying.

#### Assignments (Git Rebasing)
*   Answer the question: "blank can add additional commit and blank does not rebase" (Answer: Merge, Rebase).
*   Create and switch to a new branch called `update-models` by branching off a specific past commit (e.g., commit 'D').
*   On `update-models`, add two commits (`H` and `I`) by adding new Thai language models to `status.go`.
*   While on `update-models`, rebase it onto `main`.
*   Answer questions about (clears index and working tree). **Very dangerous** as uncommitted changes can be lost forever.
*   **`git revert`**: Creates an **"anti-commit"** that undoes the changes of a previous commit. It **does not rewrite history** but adds a new commit to the history, preserving the full log.
    *   **When to use**: `reset` for personal branches to clean up history; `revert` for shared/public branches to undo changes without breaking collaborators' history.

#### Assignments (Undoing Changes)
*   On `update-models`, overwrite `config.go` with just "DEBUG = true" and commit it with message 'J'.
*   Perform a `git reset --soft HEAD~1` to undo commit 'J' while keeping changes staged.
*   Perform a `git reset --hard HEAD~1` to undo changes and discard them.
*   Answer the question: "get reset hard blank moves your current Branch back to an older commit and destructively discards uncommitted changes".
*   Revert commit 'M' (a documentation change) on `main` with commit message 'N'.
*   Diff the changes between commit 'N' and 'M' using `git diff`.
*   Answer the question: "which creates a new commit revert let's go Which rewrites history reset".

### 10. Git Remotes and GitHub Integration
*   **Remote**: An **external repository** that typically has the same Git history as your local one. In Git's distributed nature, **no single repository is inherently central**; GitHub is just a convention for a central "source of truth".
*   **`origin`**: The standard name for the remote repository that you primarily interact with (e.g., your GitHub repo).
*   **`upstream`**: Often used in fork workflows to refer to the **original, authoritative repository** from which your fork was made.
*   **`git remote add <name> <URI>`**: Adds a new remote.
*   **`git fetch`**: Downloads objects and refs from another repository (a remote) but **doesn't automatically merge or modify your local working directory or branches**.
*   **`git push <remote> <branch>`**: Uploads your local branch commits to the remote repository.
*   **`git pull <remote> <branch>`**: Fetches from a remote and then merges the fetched content into the current local branch. It's a shorthand for `git fetch` followed by `git merge`.
*   **Forking**: A feature offered by Git hosting services (like GitHub) to **create a copy of a repository in your own account**. It's not a Git command. Primarily used for contributing to open-source projects without directly modifying the original.

#### Assignments (Remotes and GitHub)
*   Create a second repo `thaichat-local` as a sibling directory to `thaichat`, initialize it, and add `thaichat` as a remote named `origin`.
*   Fetch changes from `origin` into `thaichat-local`.
*   Merge `origin/main` into your local `main` branch.
*   Create a new repository on GitHub named `thaichat`.
*   Add this GitHub repo as a remote named `origin` to your local `thaichat` repo.
*   Push your local `main` branch to `origin` (GitHub).
*   Use the GitHub UI to edit a file (e.g., `auth.go`) and commit a change (`J` update).
*   Pull the latest changes from `origin/main` into your local `main` branch, resolving any potential merge conflicts (if `pull.rebase` is `false`, it will be a merge; if `true`, it will rebase).
*   Create a new branch `add-features` locally, add Thai language support to `chat.go`, commit it, and push `add-features` to GitHub.
*   Create a pull request on GitHub to merge `add-features` into `main` (but don't merge it yet).

### 11. Git Ignore
*   **`.gitignore`**: A file that tells Git which files or directories to **ignore** from being tracked.
*   Can be placed at the **root** of the project or in **subdirectories**.
*   **Patterns**: Supports wildcards (`*`), root anchoring (`/`), negation (`!`), and comments (`#`).
*   **`.git/info/exclude`**: A file for **local-only ignores** that are not shared with the team.

#### Assignments (Git Ignore)
*   Create two files: `secrets/api_keys.txt` and `debug.log`.
*   Create a `.gitignore` file that ignores the entire `secrets` directory and `debug.log`. Commit it.
*   Answer questions about which files are ignored based on example `.gitignore` files with various patterns and directory structures.
*   Install `go`, create a `go.mod` file, generate binary files from it, then add binary files to `.gitignore` and commit.

### 12. Git Reflog
*   **`git reflog` (Reference Log)**: Tracks **changes to references (like `HEAD`) over time**, not just committed history.
*   It records every step your `HEAD` has taken, allowing you to **recover commits that are no longer on any branch**, even deleted ones.

#### Assignments (Git Reflog)
*   Run `git reflog` to see its output.
*   Create a new branch `experimental`, create a file `experiment.go` with specified content, commit it, then delete the `experimental` branch.
*   Using `git reflog`, find the commit hash of the deleted `experiment.go` content and demonstrate how to retrieve its content using `git cat-file -p`.
*   Answer the question: "why does get ref log allow us to potentially recover commits on deleted branches".

### 13. Git Merge Conflicts
*   **Merge Conflict**: Occurs when two commits (that are not parent-child) modify the **same line of code**, and Git cannot automatically decide which change to keep.
*   **Conflict Markers**: Git marks conflicted files with `<<<<<<< HEAD` (ours), `=======`, and `>>>>>>> <branch-name>` (theirs).
*   **Resolution**: A manual process where you edit the conflicted files in your editor, remove markers, decide which changes to keep, then `git add` and `git commit` to resolve.
*   **`git merge --abort`**: Stops a merge in progress.
*   **`git checkout --ours <file>` / `git checkout --theirs <file>`**: Tools to resolve conflicts by keeping only the changes from the current branch (`ours`) or the incoming branch (`theirs`). In a merge conflict, `ours` refers to the branch you are currently on, and `theirs` refers to the branch being merged into it.

#### Assignments (Git Merge Conflicts)
*   On `main`, create a new branch `add-users`.
*   On `add-users`, create `users.go` and `database.go` with specified content, commit (C).
*   Switch back to `main`. Edit `users.go` and `database.go` with different content, commit (D).
*   Switch to `add-users` and merge `main` into it, which will cause a conflict.
*   Using a text editor, manually resolve the conflict in `users.go` by keeping both changes. Add and commit the resolution.
*   Answer the question: "which code in the conflict is yours and which is theirs".
*   On `add-users`, perform a `git reset --hard` to undo the merge commit.
*   Merge `main` into `add-users` again. This time, manually resolve the conflict in `users.go` by keeping **only the new changes (theirs)**.
*   Create a new branch `delete-features` off `main`. Delete a line from `users.go` and modify `database.go`.
*   Switch back to `main`. Edit `users.go` and `database.go` with conflicting changes.
*   Merge `delete-features` into `main`, which should result in multiple conflicts. Use `git checkout --theirs` for `users.go` and `git checkout --ours` for `database.go` to resolve, then commit.

### 14. Git Rebase Conflicts
*   During a rebase conflict (e.g., `git rebase main` while on `feature` branch), the roles of `ours` and `theirs` are reversed compared to a merge conflict.
    *   **`ours` refers to the target branch (e.g., `main`)**.
    *   **`theirs` refers to the branch being rebased (e.g., `feature`)**.
    *   This is because Git temporarily checks out the target branch and then replays the rebased branch's commits on top.
*   **Commit Dropping**: If a commit becomes **empty** (all its changes are resolved away) during a rebase, Git will **automatically drop it** from the history rewrite.

#### Assignments (Git Rebase Conflicts)
*   Create a new branch `thai-lang` off `main`. Create `language.go` with content (I) and commit.
*   Switch back to `main`. Create a file `language.go` with *different* content (J) and commit.
*   Switch to `thai-lang` and rebase it onto `main`. This will cause a conflict.
*   Resolve the conflict using `git checkout --ours` to keep `main`'s changes, then `git rebase --continue`.
*   Answer the question: "why did git remove our commit".

### 15. Git Rerere (`reuse recorded resolution`)
*   **`git rerere`**: A hidden feature that allows Git to **remember how you resolved a hunk conflict**.
*   If enabled, when the **same conflict reappears** in the future (during merge or rebase), Git can **automatically apply the previous resolution**.
*   Enabled by `git config --global rerere.enabled true`.

#### Assignments (Git Rerere)
*   Create a branch `preferences` off `main`, create `preferences.go` (commit K).
*   Create a copy of `preferences` called `preferences2`.
*   Switch to `main`, create `preferences.go` with *conflicting* content (commit L).
*   Ensure `rerere` is enabled globally.
*   Switch to `preferences` and rebase it onto `main`. Resolve the conflict by accepting both changes, then `git add` and `git rebase --continue`.
*   Switch to `preferences2` and rebase it onto `main`. Observe that the conflict is automatically resolved by `rerere`.
*   Answer: "why is re disabled by default".
*   Delete `preferences2` (using `-D` flag) and merge `preferences` into `main`.

### 16. Git Squashing
*   **Squashing**: Combining changes from a **series of commits into a single commit**.
*   Done using **`git rebase -i HEAD~<n>`** (interactive rebase). You change `pick` to `squash` (or `s`) for commits you want to combine into the previous one.
*   **Effect**: Removes the individual commit history but keeps all the changes in one large commit.
*   **Use Case**: Keeping Git history clean, simplifying reverts, or adhering to team policies that prefer single-commit pull requests.
*   **Danger**: Squashing and force-pushing to a public branch rewrites shared history and can cause problems for others.

#### Assignments (Git Squashing)
*   Push current changes to GitHub.
*   Create a new branch `temp-main` off `main`.
*   On `temp-main`, squash the last three commits (J, L, K) into a new single commit with the message "J redacted" using `git rebase -i HEAD~3`.
*   Delete `main`, rename `temp-main` to `main`, and then **force-push** your local `main` to the remote `main` branch (demonstrates a dangerous operation).
*   Answer: "when you squash commits you lose history of the individual commits".
*   On `main`, create a new branch `add-security`.
*   In `security/scanner.go`, make three separate commits (L, M, N) that add "password", "token", and "session" security scanning functionality.
*   On `add-security`, squash commits L, M, and N into a single new commit (K) using `git rebase -i`.
*   Push the `add-security` branch to GitHub and open a pull request.
*   Merge the pull request on GitHub, switch back to `main` locally, delete `add-security`, and pull the latest changes.

### 17. Git Stash
*   **`git stash`**: Records the current state of your **working directory and index (staging area)**, reverts them to `HEAD`, and stores these changes in a safe place.
*   **Purpose**: Temporarily save uncommitted work to switch contexts (e.g., fix a bug, pull latest changes) without making an unwanted commit.
*   **Data Structure**: Stash operates like a **LIFO (Last In, First Out) stack**.
*   **`git stash list`**: Shows existing stashes.
*   **`git stash pop`**: Applies the most recent stash to your working directory and removes it from the stash list.
*   **`git stash apply <stash-id>`**: Applies a specific stash without removing it from the stash list.
*   **`git stash drop <stash-id>`**: Removes a specific stash entry without applying it.
*   Can include a message (`git stash save "message"`).

#### Assignments (Git Stash)
*   On `main`, update `README.md` with ThaiChat features, then `git stash` the changes.
*   `git stash pop` the changes back out.
*   Answer the question: "if you push three sets of changes into the stack let's call the first one a the next B the last one C what happens when you run get stash pop".
*   Restash `README.md` changes with message "Good documentation".
*   Update `README.md` again with new content, then `git stash` those changes with message "Bad documentation".
*   Apply changes from "Good documentation" stash (index 1) without dropping it, then `git add` the changes.
*   Drop the "Good documentation" stash, then `git stash pop` the "Bad documentation" stash. Resolve any conflict by keeping "Good documentation" changes, and commit.

### 18. Git Cherry-Pick
*   **`git cherry-pick <commit-hash>`**: "Yinks" (applies) a **single commit (or a few specific commits)** from one branch onto another, without merging or rebasing the entire branch history.
*   **Use Case**: Applying a bug fix from a development branch to a release branch without bringing in other untested features. Requires a clean working tree.

#### Assignments (Git Cherry-Pick)
*   Create a new branch `add-integrations` off `main`.
*   Update `integrations.go` with content (commit O).
*   Update `integrations.go` again with different content (commit P).
*   Cherry-pick commit `O` from `add-integrations` onto `main`.
*   Delete the `add-integrations` branch.

### 19. Git Bisect
*   **`git bisect`**: A command that uses a **binary search algorithm** to quickly find which commit introduced a bug or a specific change.
*   **Workflow**:
    1.  `git bisect start`
    2.  `git bisect bad` (current commit or known bad commit)
    3.  `git bisect good <known-good-commit-hash>`
    4.  Git checks a middle commit.
    5.  You test the code and mark the current commit as `git bisect good` or `git bisect bad`.
    6.  Repeat step 5 until Git finds the culprit commit.
    7.  `git bisect reset` to exit.
*   **`git bisect run <script>`**: Automates the testing process by running a script that returns a specific exit code (0 for good, non-zero for bad).

#### Assignments (Git Bisect)
*   Answer: "the purpose of bisect is to find a commit that introduced a bug or change".
*   Start `git bisect`. Mark `HEAD` as bad. Mark the first commit (A) as good.
*   Follow the binary search process: if `security/scanner.go` content (more than 1 line) is present, mark bad; otherwise, mark good. Repeat until the bug-introducing commit is found.
*   Revert the commit that introduced the `scanner.go` script.
*   Create an executable script `scripts/bisect.sh` that checks for "security" in `security/scanner.go` and exits with 0 if not found, 1 if found.
*   Start `git bisect`, mark known good/bad commits, then run `git bisect run scripts/bisect.sh` to automate the search.

### 20. Git Worktrees
*   **Worktree (Working Tree/Directory)**: The directory on your file system where the code you are tracking with Git lives. The "main" worktree contains the full `.git` directory.
*   **Linked Worktrees**: Allow you to have **multiple working directories connected to the same repository**, allowing you to work on different branches simultaneously without cloning the entire repo multiple times or stashing.
    *   A linked worktree is a lightweight directory containing a `.git` file that points to the main worktree's `.git` directory.
    *   **Restriction**: Cannot check out a branch that is already checked out by another worktree.
*   **`git worktree list`**: Lists all active worktrees.
*   **`git worktree add <path> [<branch-name>]`**: Creates a new linked worktree. If no branch is specified, it uses the last segment of the path as the branch name.
*   **Deleting Worktrees**: Can be done with `git worktree remove <path>` or simply by deleting the directory. If the directory is deleted, Git will mark it as "prunable" in `git worktree list`, and `git worktree prune` can clean up the references.

#### Assignments (Git Worktrees)
*   List your current working trees using `git worktree list`.
*   Create a new linked working tree called `thaichat-mobile` as a sister directory to your main worktree, using the default `thaichat-mobile` branch name.
*   Attempt to switch to `main` within the `thaichat-mobile` worktree and observe the error (branch already in use).
*   List the contents of the `.git/worktrees` directory in your main repo to see how linked worktrees are tracked.
*   Answer: "how can you tell if a branch has checked out in a different work tree" (Answer: It will have a '+' prefix in `git branch`).
*   Delete the `thaichat-mobile` worktree directory and then `git worktree prune`.

### 21. Git Tags
*   **Tag**: An **immutable pointer to a specific commit**. Unlike branches, tags don't move.
*   **`git tag`**: Lists existing tags.
*   **`git tag -a <tag-name> -m "message"`**: Creates an **annotated tag** (includes author, date, message).
*   **`git checkout <tag-name>`**: Checks out the code at the tagged commit, putting you in a **detached HEAD state**.
*   **Use Cases**: Commonly used to mark **release versions** (e.g., `v1.0.0`).
*   **Semantic Versioning (SemVer)**: A naming convention for version numbers (`MAJOR.MINOR.PATCH`).
    *   **MAJOR**: API-breaking changes.
    *   **MINOR**: Additive, backward-compatible API changes.
    *   **PATCH**: Backward-compatible bug fixes or internal changes.

#### Assignments (Git Tags)
*   Create an annotated tag `beta` on the latest commit with a descriptive message.
*   Answer the question: "if I'm using some code that's on V1 124 and I see a new version 224 is available should I expect to be able to safely upgrade without making any changes to use it".
*   Add another tag `v1.0.0` to the same latest commit.

```