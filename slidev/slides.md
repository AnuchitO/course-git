---
theme: seriph
fonts:
  sans: Robot
  serif: Robot Slab
  mono: Fira Code
background: https://cover.sli.dev
title: Git for Software Engineers
info: |
  ## Git for Software Engineers
  Master version control, collaboration, and modern development workflows
class: text-center
drawings:
  persist: false
transition: slide-left
mdc: true
---

# Git for Software Engineers

Master the tool that powers collaboration, version control, and modern software development.

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover:bg="gray hover:bg-opacity-1" >
    by AnuchitO
  </span>
</div>

<div class="abs-br m-6 flex gap-2">
  <button @click="$slidev.nav.openInEditor()" title="Open in Editor" class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon:edit />
  </button>
  <a href="https://github.com/AnuchitO/course-git" target="_blank" alt="GitHub" title="Open in GitHub"
    class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon-logo-github />
  </a>
</div>

<!--
Welcome to Git for Software Engineers! This course will take you from Git basics to advanced workflows used in professional software development.
-->

<!-- I want to introduction slide that when we talk about git it not github, gitlab, bitbucket those just use git we talk about it itself. -->

---

# Important: Git ≠ GitHub/GitLab/Bitbucket

Before we dive in, let's clarify what we're actually learning about.

<div class="grid grid-cols-2 gap-12 mt-8">
  <div>

  ## <img src="/assets/git.png" alt="Git" class="inline w-6 h-6 ml-2" /> Git (the actual tool) 🛠️
  - **Distributed Version control system**
  - **Command-line software** that runs locally
  - **Open source** and completely free
  - **Works offline** on your machine
  - **Core functionality**: track changes, branches, history

    <div class="mt-6 p-4 bg-green-100 dark:bg-green-900 rounded">
    ✅ <strong>This course focuses on Git itself</strong>
    </div>

  </div>

<div>

## Git Hosting Platforms 🌐

<div class="flex items-center gap-4 mb-6">
  <div class="w-12 h-12 rounded flex items-center justify-center">
    <img src="/assets/github.png" alt="GitHub" class="w-10 h-10" />
  </div>
  <div class="w-12 h-12 rounded flex items-center justify-center">
    <img src="/assets/gitlab.png" alt="GitLab" class="w-10 h-10" />
  </div>
  <div class="w-12 h-12 rounded flex items-center justify-center">
    <img src="/assets/bitbucket.png" alt="Bitbucket" class="w-10 h-10" />
  </div>
<div class="w-12 h-12 rounded flex items-center justify-center bg-black dark:bg-transparent">
    <img src="/assets/codeberg.png" alt="Bitbucket" class="w-10 h-10" />
  </div>
</div>

- **Web services** that host Git repositories
- **Additional features**: Issues, CI/CD, Wiki
- **Team collaboration** tools
- **Built on top of Git** - they use Git underneath

</div>

</div>


---

# What is Git?

Git is a **distributed version control system** that tracks changes in files and coordinates work among multiple developers.

<div class="grid grid-cols-2 gap-8 mt-8">

<div>

## Why Git?

- 📈 **Track changes** over time
- 🤝 **Collaborate** with teams
- 🔄 **Backup** and sync code
- 🌿 **Branch** for features
- ⏪ **Rollback** mistakes
- 📊 **Audit** code history

</div>

<div>

## Git vs Others

| Feature     | Git | SVN | Mercurial | BitKeeper |
|-------------|-----|-----|-----------|-----------|
| Distributed | ✅   | ❌   | ✅         | ✅         |
| Speed       | ⚡   | 🐌  | ⚡         | ⚡         |
| Branching   | 🌟  | 😐  | 👍        | 👍        |
| Popularity  | 🔥  | 📉  | 📉        | 📉        |
| Open Source | ✅   | ✅   | ✅         | ❌         |
</div>

</div>

<!--
Git revolutionized version control by being distributed - every developer has a complete copy of the project history. This enables offline work and makes collaboration more flexible.
-->

---

# Git: [The Stupid Content Tracker](https://github.com/git/git/commits/master/?since=2005-04-07&until=2005-04-07)

Understanding Git's original design philosophy and core architecture.

<div class="grid grid-cols-2 gap-8 mt-8">

<div>

## What "Git" Means 🤔

According to Linus Torvalds, "git" can mean:

- **Random three-letter combination** that's pronounceable
- **Stupid, contemptible, despicable** - take your pick from slang dictionary
- **"Global Information Tracker"** - when you're in a good mood ✨
- **"Goddamn Idiotic Truckload of Sh*t"** - when it breaks 💥

<div class="mt-2 p-3 bg-yellow-100 dark:bg-yellow-900 rounded text-xs">
💡 It's a <strong>stupid but extremely fast</strong> directory content manager
</div>

</div>

<div>

Git was created by Linus Torvalds in 2005 to replace BitKeeper, which Linux kernel development was using but wasn't open source.

<div>

<div class="flex items-center gap-4 mb-4">
  <img src="/assets/linus-torvalds.png" alt="Linus Torvalds" class="w-60 rounded-full" />
  <div>
    <p class="font-semibold">Linus Torvalds</p>
    <p class="text-sm opacity-75">Creator of Git & Linux</p>
  </div>
</div>

</div>

</div>
</div>

<!--
In 2005, Andrew Tridgell, the creator of Samba and rsync, reverse-engineered the BitKeeper protocol by connecting to a BitKeeper server and analyzing the network traffic. BitMover (the company behind BitKeeper) considered this a violation of their license terms.

This incident led to BitMover revoking the free license that the Linux kernel development community had been using for BitKeeper. Larry McVoy (BitKeeper's creator) was particularly upset about this reverse engineering attempt.
-->

---

# The Linux Kernel Migration Challenge

Understanding the scale of what Git needed to handle from day one.

<div class="grid grid-cols-2 gap-4 mt-2">

<div>

## Linux Kernel by Numbers (2005)

<div class="space-y-4 mt-2">
  <div class="flex justify-between items-center p-3 bg-blue-100 dark:bg-blue-900 rounded">
    <span class="font-semibold">Lines of Code</span>
    <span class="text-xl font-bold text-blue-600">~6.6 Million</span>
  </div>

  <div class="flex justify-between items-center p-3 bg-green-100 dark:bg-green-900 rounded">
    <span class="font-semibold">Active Developers</span>
    <span class="text-xl font-bold text-green-600">~1,000+</span>
  </div>

  <div class="flex justify-between items-center p-3 bg-purple-100 dark:bg-purple-900 rounded">
    <span class="font-semibold">Files</span>
    <span class="text-xl font-bold text-purple-600">~17,000</span>
  </div>

  <div class="flex justify-between items-center p-3 bg-red-100 dark:bg-red-900 rounded">
    <span class="font-semibold">Commits per Day</span>
    <span class="text-xl font-bold text-red-600">~100-200</span>
  </div>
</div>

</div>

<div>

## The Migration Challenge 🚀

**BitKeeper History to Preserve:**
- Thousands of commits from hundreds of developers
- Complex branching and merging patterns
- Detailed commit metadata and authorship

**Git's First Test:**
- Handle massive repository size
- Support distributed development
- Enable fast branching/merging
- Maintain complete history integrity

</div>

</div>

---

# Performance Requirements

| **Requirement** | **Challenge**               | **Git's Solution**        |
|-----------------|-----------------------------|---------------------------|
| **Speed**       | Handle 100+ commits/day     | Optimized data structures |
| **Scale**       | Support 1000+ developers    | Distributed architecture  |
| **Integrity**   | Preserve 3+ years history   | SHA-1 checksums           |
| **Branching**   | Complex feature development | Lightweight branches      |


<div class="mt-6 p-4 bg-yellow-100 dark:bg-yellow-900 rounded">
💡 <strong>Amazing Fact:</strong> Git successfully migrated the entire Linux kernel history and became the primary VCS within weeks of its creation!
</div>

<!--
The Linux kernel was the perfect stress test for Git. If it could handle one of the world's largest and most active software projects, it could handle anything. This real-world pressure shaped Git's design from the very beginning.
-->


---

# Git Development Timeline

The 10-Day Git Creation (April 2005)

```mermaid
timeline
    title Git Development Timeline

    April 3, 2005  : Linus starts Git project
                   : Linux kernel needs new VCS
                   : Initial development begins

    April 7, 2005  : First Git commit
                   : Basic repository structure
                   : SHA-1 hashing implemented

    April 10, 2005 : Merge functionality added
                   : Branch operations working
                   : Core Git commands ready

    April 13, 2005 : Git hosting itself
                   : Self-hosting milestone
                   : Performance optimizations

    April 16, 2005 : First Linux kernel commit
                   : Production ready for kernel development
                   : Mission accomplished! 🎉

    July 26, 2005  : Linus hands over to Junio Hamano
                   : Junio becomes Git maintainer
                   : Linus focuses back on Linux kernel
```

---
class: text-xs
---

# Types of Version Control Systems (VSC)

Understanding the evolution of version control helps appreciate Git's advantages.

<div class="grid grid-cols-3 gap-4">

<div class="p-6 border rounded-lg">

##### 📁 Local VCS (LVCS)

<div class="mt-4 mb-4">
  <img src="/assets/lvcs-diagram.svg" alt="LVCS" class="w-full h-32 object-contain" />
</div>

- RCS (Revision Control System)
- SCCS (Source Code Control System)
- Local file copying

<div class="mt-4 p-3 bg-red-100 dark:bg-red-900 rounded text-sm">
❌ <strong>Limitations:</strong> No backup, no collaboration
</div>

</div>

<div class="p-6 border rounded-lg">

##### 🌐 Centralized VCS (CVCS)

<div class="mt-4 mb-4">
  <img src="/assets/cvcs-diagram.svg" alt="CVCS" class="w-full h-32 object-contain" />
</div>

- **Subversion (SVN)**
- **CVS (Concurrent Versions System)**
- **Perforce**
- **Team Foundation Server (TFS)**

<div class="mt-4 p-3 bg-yellow-100 dark:bg-yellow-900 rounded text-sm">
⚠️ <strong>Issues:</strong> Single point of failure, requires network
</div>

</div>

<div class="p-6 border-4 border-green-500 rounded-lg">

##### 🔄 Distributed VCS (DVCS)

<div class="mt-4 mb-4">
  <img src="/assets/dvcs-diagram.svg" alt="DVCS" class="w-full h-32 object-contain" />
</div>


- **Git** ⭐
- **Mercurial (Hg)**
- **Bazaar**

<div class="mt-4 p-3 bg-green-100 dark:bg-green-900 rounded text-sm">
✅ <strong>Advantages:</strong> Offline work, multiple backups, flexible workflows
</div>

</div>

</div>

<div class="mt-8 p-4 bg-blue-100 dark:bg-blue-900 rounded">
💡 <strong>Evolution:</strong> LVCS → CVCS → DVCS represents the progression toward more flexible and robust version control
</div>

<!--
The evolution from local to centralized to distributed version control reflects the growing needs of software development teams. Git's distributed nature makes it incredibly flexible and resilient.
-->


---

# Git Files State and Workflow

Understanding Git's stages workflow is crucial

```mermaid
%%{init: {
  "theme": "base",
  "themeVariables": {
    "lineColor": "#00e5ff"
  }
}}%%
graph LR
    A[Working Directory] -->|git add| B[Staging Area]
    B -->|git commit| C[Repository - .git folder]
    C -->|git checkout| A
    B -->|git reset| A
    C -->|git reset --hard| A
    C -->|git pull/push| D[Remote Repository e.g. GitHub, GitLab, etc.]
```

<div class="grid grid-cols-3 gap-4 mt-8">

<div class="p-4 border rounded">
<h3>🗂️ Working Directory</h3>
Your current files and folders where you make changes
</div>

<div class="p-4 border rounded">
<h3><img src="/assets/git.png" alt="Git" class="inline w-6 h-6 ml-2" />  Git Staging Area</h3>
Prepared changes ready to be committed <br/>(like a shopping cart)
</div>

<div class="p-4 border rounded">
<h3>📚 Repository</h3>
Permanent storage of committed snapshots <br/> (.git folder)
</div>

</div>

<!--
Think of Git as a camera: Working Directory is what you see, Staging Area is what you frame, and Repository is the photo album of snapshots you've taken.
-->

---

# Git Installation

<div class="flex justify-center mt-4 mb-8">
  <img src="/assets/nogit.png" alt="No Git" class="w-full" />
</div>

<div class="grid grid-cols-3 gap-3 mt-8">
  <div>
    <div>
      <h3><carbon:download class="inline text-2xl mr-2" /> Download Git</h3>
    </div>

  Visit **[git-scm.com](https://git-scm.com/downloads)** to download Git for your operating system.

  </div>

<div class="col-span-2">
    <div>
      <h3><carbon:terminal class="inline text-2xl mr-2" /> Installation</h3>
    </div>

  - **Windows:** Download installer from  **[git-scm.com](https://git-scm.com/downloads)** and run it
  - **macOS:** `brew install git`
  - **Linux:**
    - `sudo apt install git` (Ubuntu/Debian)
    - `sudo yum install git` (CentOS/RHEL)

  </div>

</div>

---

# Essential Git Commands

Let's start with the fundamental commands every developer needs to know.

<div class="grid grid-cols-2 gap-8">

<div>

## Getting Started
```bash
# Initialize a new repository
git init

# Check repository status
git status

# View commit history
git log
```

</div>

<div>

## Basic Workflow
```bash
# Stage files for commit
git add <file>

# Commit staged changes
git commit -m "Your message"

# View commit history
git log
```

</div>

</div>

<div class="mt-8 p-4 bg-yellow-100 dark:bg-yellow-900 rounded">
💡 <strong>Pro Tip:</strong> Use <code>git status</code> frequently - it's your best friend for understanding what's happening!
</div>

<!--
These commands form the core Git workflow. Practice them until they become muscle memory. The key is understanding what each command does to the three trees.
-->

---


#### 📝 Excercise: Create Your First Repository

**Task 1:** Create a new project folder and initialize Git

```bash
mkdir thaichat # Step 1: Create a new folder called 'thaichat'
cd thaichat # Step 2: Navigate into the folder

git init # Step 3: Initialize Git repository
# Step 4: Verify Git initialization
ls -la  # You should see a .git folder

git branch -m main # rename current branch to main
```

<div v-click>

**Task 2:** Configure default branch to be `main`

```bash
# Configure Git to use 'main' as the default branch name
git config --global init.defaultBranch main

# Navigate back to parent directory and create a new demo project
cd ../
mkdir demo
cd demo

# Initialize Git repository (should not show hints about default branch)
git init # the default branch should be `main`
```

</div>


---

# Exploring .git & First Commit

##### 1. Explore the .git directory
```bash
ls -la .git # See what's inside the .git directory
git status
git log
```

##### 2. Create your first commit
```bash
echo "# ThaiChat - A most popular real-time chat application in Thailand" > README.md
git status

git add README.md
git status

git commit -m "A: my first commit"
```

##### 3. Config user name and email
```bash
  git config --global user.email "you@example.com" # you can try with out --global and commit in demo/ folder see the difference
  git config --global user.name "Your Name"
```

##### 4. then we can commit
```bash
git commit -m "A: my first commit"
git log
```

---

# Git Config: Local vs Global

option `--global` will apply to all repositories

#### Local Configuration (Specific to current repository, stored in .git/config)
```bash
# Navigate to your project
cd thaichat/
cat .git/config
git config --list # Check effective config

cd demo/
cat .git/config
git config --local user.email "email@demo.com" # or `git config user.email "email@demo.com"`
git config --local user.name "Demo" # or `git config user.name "Demo"`
```

#### Verify in Different Directories
```bash
# In thaichat/
cd ~/projects/thaichat
git config user.email  # Shows dev@thaichat.com

# In demo/
cd ~/projects/demo
git config user.email  # Shows email@demo.com
```

---

# Git Configuration Scopes

Git has three configuration levels that determine where settings are stored and their priority.

<div class="flex justify-center">
  <img src="/assets/config-scope.svg" alt="Git Configuration Scopes" class="w-120" />
</div>

---

# Porcelain and Plumbing

Git commands are divided into **high-level commands** (porcelain) and **low-level commands** (plumbing).

<div class="grid grid-cols-2 gap-12 mt-8">
  <div>

  ## Porcelain Commands 🚿

 you will use most often as a developer to interact with your code

<div class="grid grid-cols-2 gap-12 mt-8">
  <div>
    <ul>
      <li><code>git status</code></li>
      <li><code>git add</code></li>
      <li><code>git commit</code></li>
    </ul>
  </div>
  <div>
    <ul>
      <li><code>git push</code></li>
      <li><code>git pull</code></li>
      <li><code>git log</code></li>
    </ul>
  </div>
  </div>

  <div class="mt-6 p-4 bg-green-100 dark:bg-green-900 rounded">
  ✅ <strong>These are your daily Git tools</strong>
  </div>

  </div>

<div>

## Plumbing Commands 🔧

Low-level commands that manipulate Git's internal structures. Rarely used directly

  <ul>
    <li><code>git cat-file</code></li>
    <li><code>git apply</code></li>
    <li><code>git commit-tree</code></li>
    <li><code>git hash-object</code></li>
    <li><code>git ls-tree</code></li>
  </ul>

  <div class="mt-6 p-4 bg-yellow-100 dark:bg-yellow-900 rounded">
    Understanding plumbing helps with porcelain
  </div>

</div>

</div>

---

# Git Cat-File - Exploring Git Objects

a powerful plumbing tool that lets you examine the raw contents and metadata of Git objects like blobs, trees, commits, and tags.

<div class="grid grid-cols-2 gap-8">

  <div>

  - **Blobs** - file contents
  - **Trees** - directory structures
  - **Commits** - snapshots with metadata
  - **Tags** - annotated references

  ```bash
  # Basic syntax
  git cat-file <type> <object>
  git cat-file -t <object>  # show type
  git cat-file -s <object>  # show size (bytes)
  git cat-file -p <object>  # pretty print based on its type.
  ```

  </div>
    <div class="flex justify-center mt-8">
      <img src="/assets/git-object-model.png" alt="Git Object Model" class="w-90 bg-transparent" />
    </div>
  <div>

  </div>
</div>


---

# Git Object Inspection

#### Using `git cat-file` with ThaiChat

```bash
# 1. Navigate to ThaiChat and check status
cd path/to/thaichat
git status

git --no-pager log --parents --oneline

git cat-file -p <commit-hash> # could be <commit-hash>, <tree-hash>, <blob-hash>
ls -al .git/

echo "Most popular chat for Thai people" >> note.md
git add note.md
git commit -m "B: most popular chat"

git --no-pager log --parents --oneline  # Copy the commit hash

git cat-file -p <commit-hash>  # then cat tree-hash to see blob objects

git ls-tree HEAD  # Both README files point to same blob hash
git ls-tree <tree-hash> # tree hash of first commit
```

##### 💡 **Key Insight**: Git's content-addressable storage means identical files are stored only once, saving space and maintaining history efficiently.

---

# Git Object Model

everything in Git is stored as objects (blobs for files, trees for directories, commits for **snapshots**) linked by SHA-1 hashes.

<div class="flex justify-center">

<div class="flex justify-center">
  <img src="/assets/git-object.png" alt="Git Object Model" class="w-110" />
</div>
</div>

<div class="mt-2 p-2 bg-blue-100 dark:bg-blue-900 rounded">
💡 <strong>Key Insight:</strong> store objects - commits, trees, and blobs form a directed acyclic graph (DAG)
</div>

<!--
Git's object model is elegant in its simplicity. Every piece of data is stored as an object with a SHA-1 hash. Understanding this model helps you grasp why Git operations work the way they do.
-->

---

# Excercise: Create Chat Channels Configuration

Let's create a channels configuration for ThaiChat and track it with Git.

````md magic-move {lines: true}
```bash
# Step 1: Create directory structure
mkdir -p chat
git status
```

```bash
# Step 1: Create directory structure
mkdir -p chat
git status

# Step 2: Create channels.csv with headers
echo "id,name,description,is_private,created_at" > chat/channels.csv
```

```bash
# Step 1: Create directory structure
mkdir -p chat
git status

# Step 2: Create channels.csv with headers
echo "id,name,description,is_private,created_at" > chat/channels.csv

# Step 3: Add ThaiChat channels into channels.csv
1,general,General discussion,false,2025-08-25T10:00:00+07:00
2,random,Random chat,false,2025-08-25T10:05:00+07:00
3,private,Private chat,true,2025-08-25T10:10:00+07:00
```

```bash
# Step 1: Create directory structure
mkdir -p chat
git status

# Step 2: Create channels.csv with headers
echo "id,name,description,is_private,created_at" > chat/channels.csv

# Step 3: Add ThaiChat channels into channels.csv
1,general,General discussion,false,2025-08-25T10:00:00+07:00
2,random,Random chat,false,2025-08-25T10:05:00+07:00
3,private,Private chat,true,2025-08-25T10:10:00+07:00

# Step 4: Initialize git and add files
git add chat/channels.csv
git commit -m "C: feat: add initial chat channels"
```

```bash
# Step 1: Create directory structure
mkdir -p chat
git status

# Step 2: Create channels.csv with headers
echo "id,name,description,is_private,created_at" > chat/channels.csv

# Step 3: Add ThaiChat channels into channels.csv
1,general,General discussion,false,2025-08-25T10:00:00+07:00
2,random,Random chat,false,2025-08-25T10:05:00+07:00
3,private,Private chat,true,2025-08-25T10:10:00+07:00

# Step 4: Initialize git and add files
git add chat/channels.csv
git commit -m "C: feat: add initial chat channels"

# Step 5: View the file and git log
cat channels.csv
git log --oneline
```
````

---

# Exercise: Interactively Add Files to Git

Use `git add -p` to add server logic to Git.

<v-switch>
  <template #1>

#### D: Assume we have an existing file in our Git repository

<font size="1"><code>git commit -m "D: assume we have it already"</code></font>

```go
package server // thaichat/server/server.go

func filterBadMessages(messages []string) (bads []string) {

	return bads
}

```

  </template>

  <template #2>

#### E: Add emojis filter only

<font size="1"><code>git commit -m "E: want to add emojis filter only"</code></font>

```go {3-6}
package server // thaichat/server/server.go

func filterEmojis(messages []string) (emojisx []string) {

	return emojisx
}

func filterBadMessages(messages []string) (bads []string) {

	return bads
}

func filterGoodMessages(messages []string) (goodx []string) {

	return goodx
}

```

  </template>

  <template #3>

#### F: We want to add logic to commit and good messages without committing debug logs

<font size="1"><code>git commit -m "F: want to commit logic and good messages without DEBIRD logs"</code></font>

```go
package server // thaichat/server/server.go

func filterBadMessages(messages []string) (bads []string) {
	println("Debug: Checking for new messages...") // don't commit this line

	for _, message := range messages {
		if message == "bad" {
			println("Debug: Message is good:", message) //  don't commit this line
			return append(bads, message)
		}
	}

	return bads
}

```
  </template>
</v-switch>

---

# Discarding Changes: git restore

Let's remove the `println` statements in `server.go` that are not committed.

```bash
git restore .
```

---

# Replace the tip of the current branch

Use `git commit --amend` to replace the tip of the current branch with a new commit.

1. fix commit message "DEBIRD" (typo in early commit message)
```bash
git commit --amend
```

2. fix the variable name `emojisx` to `emojis` commit message
```bash
git add server.go
git commit --amend
```

3. fix the variable name `goodsx` to `goods` commit message
```bash
git add server.go
git commit --amend --no-edit
```
---

# Stage and commit in one command

Instead of using two commands (`git add` + `git commit -m`), you can use `-am` to stage and commit tracked files in one step. This only works for modified files, not new files.

Edit `server.go` to change `goods` to `goodies`
Then stage and commit in one command

```bash
git commit -am "G: refactor: rename goods to goodies for clarity"
```

Note: `-a` only stages changes to tracked files. For new files, you still need to `git add` them first.

---

# Branches

Branches allow you to work on different features simultaneously without affecting the main codebase.
They are like **lightweight, mutable pointers to a commit**. You can move them around, change where they point to commit and even delete them.

#### List all branches
```bash
git branch         # List local branches
git branch -a      # List all branches (local + remote)
```

#### Create branches (3 ways)

```bash
git branch new_branch  # 1. only creates, doesn't switch new_branch
git switch -c new_branch  # 2. Create and switch to new_branch (modern way)
git checkout -b new_branch  # 3. Create and switch to new_branch (legacy way) but still widely used
```

Creating a new branch starts from the current commit.

---

# Branch: Adding User Authentication

Create a new branch `auth` and add `users.csv` to it.

```mermaid {scale: 1.3}
gitGraph
    commit id: "A: my first commit"
    commit id: "B: most popular chat"
    commit id: "C: feat: add initial chat ..."
    commit id: "..."
    commit id: "G: refactor: rename goods ..."
    branch auth
    checkout auth
    commit id: "H: add users.csv header"
    commit id: "I: add anuchito user"
    commit id: "J: add thai_dev user"
```

🌐 [Learn Git Branching](https://learngitbranching.js.org/?NODEMO)

---

# Branch: Adding User Authentication

```bash
# Create and switch to new branch
git switch -c auth

# 1. Create users.csv header
echo 'user_id,username,display_name,avatar,status,last_seen' > users.csv
git add users.csv
git commit -m "H: add users.csv header"

# 2. Add anuchito user
echo 'user1,anuchito,AnuchitO,AO,online,2025-08-25T10:30:00Z' >> users.csv
git add users.csv
git commit -m "I: add anuchito user"

# 3. Add thai_dev user
echo 'user2,thai_dev,Thai Dev,TD,away,2025-08-25T09:45:00Z' >> users.csv
git add users.csv
git commit -m "J: add thai_dev user"
```

---

# Branch: Switch to Main to Add Channels

Now let's switch back to `main` branch to add more channels.

<v-switch>
  <template #1>

```mermaid {scale: 1.3}
gitGraph
    commit id: "A: my first commit"
    commit id: "..."
    commit id: "G: refactor: rename goods ..."
    branch auth
    checkout auth
    commit id: "H: add users.csv header"
    commit id: "I: add anuchito user"
    commit id: "J: add thai_dev user"
    checkout main
    commit id: "K: add more bot channel"
    commit id: "L: add more admin channel"
```

  </template>

  <template #2>

```bash
git checkout main
# Add bot channel
echo '4,bot,Bot chat,true,2025-08-25T10:15:00+07:00' >> channels.csv
git add channels.csv
git commit -m "K: add bot channel"

# Add admin channel
echo '5,admin,Admin chat,true,2025-08-25T10:20:00+07:00' >> channels.csv
git add channels.csv
git commit -m "L: add admin channel"
```
  </template>
</v-switch>

---

# Merging Strategies

There are different ways to combine branches, each with its own use cases.

<div class="grid grid-cols-2 gap-8">

<div>

## Fast-Forward Merge

Fast-forward merge occurs when **the target branch has no new commits**. Git simply moves the branch pointer to the tip of the merged branch.

```bash
git switch main
git merge auth
```

```mermaid
gitGraph
    commit id: "A"
    commit id: "B"
    commit id: "C"
    commit id: "D" type: HIGHLIGHT
    commit id: "E" type: HIGHLIGHT
```

This is the behavior you want when merging branches that contain the same commits. This is the default behavior of `git merge`, and it is the reason why `git merge` is so fast.

</div>

<div>

## Three-Way Merge

Three-way merge combines changes from both branches using their common ancestor. Git creates a new commit that combines the changes.

```bash
git switch main
git merge --no-ff auth
```

```mermaid
gitGraph
    commit id: "A"
    commit id: "B"
    branch auth
    commit id: "D"
    commit id: "E"
    switch main
    commit id: "C"
    merge auth id: "Merge"
```

</div>

</div>

---

# Demo: 🌐 [Learn Git Branching](https://learngitbranching.js.org/?NODEMO)

### Fast-Forward Merge

when the target branch has no new commits, git simply moves the branch pointer to the tip of the merged branch.

we will merge `auth` branch into `main` (target) branch.

```bash
git switch main
git merge auth
```


### Three-Way Merge

when the target branch has new commits, git creates a new commit that combines the changes.

we will merge `auth` branch into `main` (target) branch.

```bash
git switch main
git merge auth  # use --no-ff to force three-way merge
```

---

# Exercise: Merging Branches in ThaiChat repository

let's merge `auth` branch into `main` (target) branch.
use `git merge --no-ff auth` to force three-way merge.

```bash
# switch to main branch
git switch main

# merge auth branch into main branch
# use --no-ff to force three-way merge
git merge --no-ff auth

git log --oneline --graph --all
```

---

# Rebase

Let's say you're working on a feature branch `chatui` in ThaiChat, but the `main` branch has been updated with important bug fixes. let's incorporate these changes into `chatui` branch while keeping a clean history.

<div class="grid grid-cols-2 gap-6">

<div>

### Before Rebase
```mermaid
gitGraph
    commit id: "A"
    commit id: "B"
    branch chat-ui
    commit id: "C"
    commit id: "D"
    checkout main
    commit id: "E"
    commit id: "F"
```

### After Rebase
```mermaid
gitGraph
    commit id: "A"
    commit id: "B"
    commit id: "E"
    commit id: "F"
    branch chat-ui
    commit id: "C'"
    commit id: "D'"
```

</div>

<div>

```bash
# add some change to main branch
$ echo "# thai chat is awesome" >> README.md
$ git add README.md
$ git commit -m "M: update README with project description"

# switch to feature branch
$ git switch -c chatui
$ mkdir web/
$ echo "# thai chat ui is awesome" >> web/ui.md
$ git add web/ui.md
$ git commit -m "N: add UI documentation"

$ git rebase main

# If there are conflicts, resolve them and continue
$ git add <file>
$ git rebase --continue

# log to see the changes
$ git log --oneline --graph --all
```

</div>

</div>

---

# .gitignore: Ignoring Files

<div class="grid grid-cols-2 gap-6">

<div>

## Levels of .gitignore

1. **Repository-level** (`.gitignore` in root)
2. **Directory-level** (`.gitignore` in subdirectories)
3. **Global** (`~/.config/git/ignore` or `~/.gitignore`)
   - Applies to all repositories on your machine
   - Configure with: `git config --global core.excludesfile ~/.gitignore_global`

## Generate .gitignore file

- <carbon-link /> [Gitignore.io](https://www.toptal.com/developers/gitignore)

</div>

<div>

## Common Patterns

- `*.log` - Ignore all .log files
- `!important.log` - Except important.log
- `logs/` - Ignore the logs directory
- `*.tmp` - Ignore all .tmp files
- `temp?` - Ignore temp1, temp2, etc.

## Debugging

```bash
# Check ignored files -- is the file ignored?
git check-ignore -v <file>

# Show ignored files
git status --ignored
```

</div>

</div>

---

# Git Reset

You're working on the `chatui` feature in ThaiChat and accidentally committed sensitive data to the `main` branch. Let's fix this while keeping your other changes.

<div class="grid grid-cols-2 gap-6">

<div>

### Demo: Remove Sensitive Data

```mermaid
gitGraph
    commit id: "A"
    commit id: "B"
    branch chatui
    commit id: "Add chat UI components"
    commit id: "Add message input"
    commit id: "Add API credentials" type: HIGHLIGHT
    commit id: "Fix message rendering"
```

🌐 [Learn Git Branching](https://learngitbranching.js.org/?NODEMO)

</div>

<div>

### Undoing Changes

```bash
git reset --soft <commit>

# reset to the commit before the current commit one commit
git reset --soft HEAD~1

# reset to the commit before the current commit two commits
git reset --soft HEAD~2
```

### Reset Options

- `--mixed`: (default) the changed files are preserved but not marked for commit
- `--soft`: Keep changes in staging area
- `--hard`: Discard all changes

</div>
</div>

---

# Git Reflog: Your Safety Net

<div class="grid grid-cols-2 gap-6">

<div>

## What is Reflog?

- Tracks all reference updates in your local repository
- Acts as a safety net for recovering lost commits
- Local only - not shared when pushing/pulling

## Common Use Cases

- Recover lost commits after a `reset`
- Find and restore deleted branches
- Debug when branches point to unexpected commits


> ℹ️ Reflog entries expire after 90 days by default
</div>

<div>

## Key Commands

```bash
git reflog # Show complete reference log
git reflog show <branch> # for a specific reference

# Recover a lost commit
git checkout -b recovered-branch HEAD@{2}
```

## Example Workflow

```bash
# 1. Make some commits
git commit -m "Add feature"

# 2. Accidentally reset hard
git reset --hard HEAD~1

# 3. Find the lost commit
git reflog

# 4. Restore the lost commit
git checkout -b recovered-feature HEAD@{1}
# or just git checkout HEAD@{1}
```

</div>
</div>

---

# Remotes: Collaborating with Others

<div class="grid grid-cols-2 gap-6">

<div>

### What is a Remote?

- A reference to another Git repository
- Can be any valid Git repository location:
  - `https://github.com/user/repo.git`
  - `git@github.com:user/repo.git`
  - `file:///path/to/local/repo`
  - `ssh://user@server/project.git`

### Common Commands

```bash
git remote -v # List all remote

git remote add <name> <url> # Add a new remote

git remote remove <name> # Remove a remote

git remote rename <old> <new> # Rename a remote
```

</div>

<div>


### Remote Operations

```bash
# Fetch changes from remote
git fetch <remote>

# Pull changes (fetch + merge)
git pull <remote> <branch>

# Push changes
git push <remote> <branch>
```

### Example

```bash
git remote add local /path/to/local/repo

# push to local remote
git push local main

# pull from local remote
git pull local main

git remote add origin https://gitlab.com/devbox.demo/thaichat.git
```

</div>
</div>

---

# Git with GitLab

<div class="grid grid-cols-2 gap-6">

<div>

### Personal Access Token

[Go to GitLab → User Settings → Access Tokens](https://gitlab.com/-/profile/personal_access_tokens)


### Config Credentials for HTTPS

```bash
# Store credentials in plaintext (not recommended)
git config --global credential.helper store

# macOS
git config --global credential.helper osxkeychain
```

### Config Credentials for SSH

```bash
# generate ssh key
ssh-keygen -t ed25519 -C "your_email@example.com"

# add ssh key to ssh-agent
ssh-add ~/.ssh/id_ed25519

# add ssh key to gitlab
# go to GitLab → User Settings → SSH Keys
# copy the content of ~/.ssh/id_ed25519.pub
# paste it into the SSH Keys section
```

</div>

<div>

### Update Remote URL (if needed)

```bash
git remote set-url origin https://username:YOUR_ACCESS_TOKEN@gitlab.com/username/repository.git
# or
git remote add origin git@gitlab.com:username/repository.git
# or
git remote add origin https://gitlab.com/username/repository.git
```

### Verify

```bash
# This should work without password prompt
git pull
git push
```

> ⚠️ **Security Note**: Never commit your token or store it in plaintext in scripts. Use environment variables or Git's credential helper.

</div>
</div>

---

# GPG Commit Signing

<div class="grid grid-cols-2 gap-6">

<div>

#### 1. Install GPG

```bash
# macOS (using Homebrew)
brew install gnupg

# Linux (Debian/Ubuntu)
sudo apt-get install gnupg
```

#### 2. Generate GPG Key

```bash
# Generate a new key
gpg --full-generate-key

# Follow the prompts
```

#### 3. Configure Git to Use GPG

```bash
# Get your GPG key ID (after rsa.../)
gpg --list-secret-keys --keyid-format=long
# Configure Git
git config user.signingkey YOUR_KEY_ID
# Enable auto-signing
git config commit.gpgsign true
```

</div>

<div>

#### 4. Use noreply email for commits

```bash
# use noreply email
git config user.email "29738004-demo@users.noreply.gitlab.com"
```

#### 5. Configure GPG TTY

```bash
# ~/.zshrc or ~/.bashrc # GPG can be used in the terminal
export GPG_TTY=$(tty)
```

#### 6. Add GPG public key to GitLab

```bash
gpg --export --armor YOUR_KEY_ID
# copy the output
# go to GitLab → User Settings → GPG Keys
```
</div>
</div>

---

# Handling Merge Conflicts

Conflicts occur when Git can't automatically merge changes. Let's see how to resolve them step by step.

## Conflict Resolution Workflow

````md magic-move {lines: true}
```bash
# Scenario: Merging feature branch into main
git checkout main
git merge feature/auth-refactor
```

```bash
# Scenario: Merging feature branch into main
git checkout main
git merge feature/auth-refactor

# Output: Conflict detected!
# Auto-merging auth.js
# CONFLICT (content): Merge conflict in auth.js
# Automatic merge failed; fix conflicts and then commit the result.
```

```bash
# Scenario: Merging feature branch into main
git checkout main
git merge feature/auth-refactor

# Output: Conflict detected!
# Auto-merging auth.js
# CONFLICT (content): Merge conflict in auth.js
# Automatic merge failed; fix conflicts and then commit the result.

# Step 1: Check which files have conflicts
git status
```

```bash
# Step 1: Check which files have conflicts
git status

# Output shows:
# Unmerged paths:
#   (use "git add <file>..." to mark resolution)
#         both modified:   auth.js

# Step 2: Open the conflicted file and you'll see:
```

```bash
// The conflicted file (auth.js) looks like this:
// <<<<<<< HEAD
function login(username, password) {
    return authenticate(username, password);
}
// =======
function login(user, pass) {
    return auth.validate(user, pass);
}
// >>>>>>> feature/auth-refactor
```

```bash
# Step 3: Resolve the conflict by choosing or combining changes
function login(username, password) {
    return auth.validate(username, password);
}
# Remove conflict markers and keep the best parts
```

```bash
# Step 4: Stage the resolved file and commit
git add auth.js
git status  # should show "All conflicts fixed"
git commit  # Git will create a merge commit message
```
````

<div class="mt-4 p-3 bg-yellow-100 dark:bg-yellow-900 rounded text-sm">
💡 <strong>Pro Tip:</strong> Use <code>git merge --abort</code> if you want to cancel the merge and start over!
</div>

<!--
Conflicts are a normal part of collaborative development. The key is to stay calm, understand what each side is trying to do, and make thoughtful decisions about which changes to keep.
-->

---

# Exercise: Resolve Merge Conflicts

Resolving Conflicts in users.csv **Scenario**: Two team members modify `users.csv` simultaneously: **Nong** adds a new user: `user3,somyod,somyod@example.com` **Mai** updates a user: `user3,somchai,somchai@example.com`

2. **Conflict occurs** when both try to push changes:
   ```bash
   git pull origin main
   # CONFLICT (content): Merge conflict in users.csv
   ```


<div class="grid grid-cols-2 gap-4">
<div>

3. **Resolve the conflict** by editing the file:

```bash
user1,anuchito,AnuchitO,AO,online,2025-08-25T10:30:00Z'
user2,thai_dev,Thai Dev,TD,away,2025-08-25T09:45:00Z
// <<<<<<< HEAD
user3,somyod,SY,online,2025-08-25T10:30:00Z'
=======
user3,somchai,SC,away,2025-08-25T09:45:00Z
// >>>>>>> user
```

</div>

<div>

4. **Final resolved version**:

```bash
user1,anuchito,AnuchitO,AO,online,2025-08-25T10:30:00Z'
user2,thai_dev,Thai Dev,TD,away,2025-08-25T09:45:00Z
user3,somyod,SY,online,2025-08-25T10:30:00Z'
# Resolved by keeping changes from main branch
```

</div>
</div>

---

# Handling Rebase Conflicts

Resolving Rebase Conflicts in `users.csv` **Scenario**: You're rebasing your `user` branch with `main`: Your change: `user3,somchai,SC,away,2025-08-25T09:45:00Z` Main branch has: `user3,somyod,SY,online,2025-08-25T10:30:00Z`

**Conflict occurs** during rebase:

```bash
git checkout user
git rebase main
# CONFLICT (content): Merge conflict in users.csv
```

<div class="grid grid-cols-2 gap-4">
<div>

**Resolve the conflict** by editing the file:

```bash
user1,anuchito,AnuchitO,AO,online,2025-08-25T10:30:00Z'
user2,thai_dev,Thai Dev,TD,away,2025-08-25T09:45:00Z
// <<<<<<< HEAD
user3,somyod,SY,online,2025-08-25T10:30:00Z'
=======
user3,somchai,SC,away,2025-08-25T09:45:00Z
// >>>>>>> user
```

</div>

<div>

**After resolving**, continue the rebase:

```bash
git add users.csv
git rebase --continue
```

**Final result** (if keeping your change):
```bash
user1,anuchito,AnuchitO,AO,online,2025-08-25T10:30:00Z'
user2,thai_dev,Thai Dev,TD,away,2025-08-25T09:45:00Z
user3,somchai,SC,away,2025-08-25T09:45:00Z
```

</div>
</div>

---

# Git Rerere: Reuse Recorded Resolution

<div class="grid grid-cols-2 gap-4">
<div>

## What is Rerere?

- **Reuse Recorded Resolution**
- Automatically remembers how you resolved conflicts
- Reuses the same resolution for similar conflicts

## Enable Rerere

```bash
# Enable globally
# Enable for all repositories
git config --global rerere.enabled true

# Or enable per repository
git config rerere.enabled true
```

</div>

<div>

## How It Works

1. Records conflict resolutions
2. Saves them in `.git/rr-cache`
3. Reapplies them automatically

## Common Use Cases

- Long-running feature branches
- Rebase workflows
- Maintaining multiple branches

## View Recorded Resolutions

```bash
git rerere diff
```

</div>
</div>

---

# Exercise: Use rerere

<div class="grid grid-cols-2 gap-4">
<div>

**Enable rerere** (if not already enabled):

```bash
git config --global rerere.enabled true
```

**Create a conflict**:

```bash
# On main branch
echo 'user4,bot,BOT,online,2025-08-25T11:00:00Z' >> users.csv
git add users.csv
git commit -m "Add bot"

# On feature branch
git checkout -b mod
sed -i '' 's/bot/ai/g' users.csv
git commit -am "Update bot to ai"

# create new branch mod2
git checkout -b mod2

# Back to mod branch and rebase
git checkout mod
git rebase main
```

</div>

<div>

## The Exercise

**Solve the conflict**

```bash
# On mod branch
# Edit users.csv to resolve the conflict
```

**Go to mod2 branch and rebase**

```bash
# On mod2 branch
# Edit users.csv the conflict will be resolved automatically
```

**Verify** rerere worked by checking:

```bash
git rerere diff
```

</div>
</div>

---

# Git Interactive Rebase

Rewrites commit history, Reorders, combines, or modifies commits, Perfect for cleaning up before sharing

<div class="grid grid-cols-2 gap-4">
<div>

### Basic Commands

```bash
git rebase -i HEAD~3
# Or
git rebase -i <commit-hash>
```

### Common Actions

- `pick`: Keep commit as is
- `reword`: Change commit message
- `edit`: Pause for amendments
- `squash`: Combine with previous commit
- `drop`: Remove commit

</div>

<div>

### Example Workflow

**Start interactive rebase**:

```bash
git rebase -i HEAD~3
```

**Edit the list**:

```bash
pick a1b2c3d Add login form
reword b2c3d4e Fix typo
squash c3d4e5f Update styles
```

> The order of the commits in the interactive rebase will be from oldest to newest, unlike `git log` where the order is from newest to oldest.

</div>
</div>

---

# Git Stash: Save Your Work in Progress

<div class="grid grid-cols-2 gap-4">
<div>

### Basic Usage

```bash
# Stash changes
git stash

# List stashes
git stash list

# Apply stash
git stash pop

# Drop a stash
git stash drop stash@{n}
```

</div>

<div>

### Stash Options

```bash
# Stash including untracked files
git stash -u

# Stash with message
git stash save "Work in progress"

# Stash but keep staged changes
git stash --keep-index

# Apply and drop from stash list
git stash pop
```

</div>
</div>


### Common Workflow

Working on a feature or bug fix and need to switch branches:

```bash
git stash
git checkout other-branch
# Do some work
git checkout feature-branch
git stash pop
```

---

# Git Revert: Undo Changes Safely

<div class="grid grid-cols-2 gap-4">
<div>

### Basic Usage

```bash
# Revert a specific commit
git revert <commit-hash>

# Revert the most recent commit
git revert HEAD

# Revert a range of commits
git revert OLDER_COMMIT..NEWER_COMMIT
```

### Common Options

```bash
# Revert without committing
git revert -n <commit>

# Edit the commit message
git revert -e <commit>

# Continue after resolving conflicts
git revert --continue
```

</div>

<div>

### Example Workflow

**Revert a specific commit**:

```bash
git revert b2c4d4e
# Creates a new commit that undoes the changes
```

**Resolve conflicts** (if any):

```bash
# After fixing conflicts
git add .
git revert --continue
```

### Key Points

- Creates a new commit that undoes changes
- Safe for shared branches
- Preserves history
- Use `git reset` for local changes instead

</div>
</div>

---

# Git Cherry-pick

<div class="grid grid-cols-2 gap-4">
<div>

### Basic Usage

```bash
# Cherry-pick a single commit
git cherry-pick <commit-hash>

# Cherry-pick multiple commits
git cherry-pick <commit1> <commit2>

# Cherry-pick a range of commits
git cherry-pick <start-commit>..<end-commit>
```

### Common Options

```bash
# Edit the commit message before committing
-e, --edit
# Don't create a commit
-n, --no-commit
# Sign off the commit
-s, --signoff
```
</div>

<div>

### Example Workflow

```bash
# On feature branch
git log --oneline
# a1b2c3d (feature) Add payment processing
# c3d4e5f Initial commit

# Switch to main and cherry-pick
git checkout main
git cherry-pick a1b2c3d
```

#### When to Use

- Backport bug fixes
- Apply specific features between branches
- Move commits without merging

#### ⚠️ Warning
- Can create duplicate commits
- May cause merge conflicts
- Use with caution on shared branches

</div>
</div>

---

# Checkout File from Another Branch

<div class="grid grid-cols-2 gap-4">
<div>

### Basic Usage

```bash
# Get a file from another branch
git checkout <branch> -- <file>

# Get multiple files
git checkout <branch> -- file1.txt file2.txt

# Get files from a specific commit
git checkout <commit-hash> -- <file>
```

### Common Scenarios

- Recover a deleted file from another branch
- Get a specific version of a file
- Compare changes between branches

</div>

<div>

### Example Workflow

```bash
# Accidentally deleted a file
git status
# On branch main
# Deleted: important-config.json

# Get it back from develop branch
git checkout develop -- important-config.json

git status
# On branch main
# Changes to be committed:
#   (use "git restore --staged <file>..." to unstage)
#       new file:   important-config.json
```

### ⚠️ Caveats

- Overwrites the file in your working directory
- Doesn't switch branches
- Always commit or stash changes first
- Use with caution as changes can't be undone

</div>
</div>

---

# Debugging with Git

Git provides powerful tools for finding and fixing bugs. Let's see them in action!

## Git Bisect - Find the Bug-Introducing Commit

````md magic-move {lines: true}
```bash
# Scenario: Your tests are failing, but they worked last week
# You need to find which commit introduced the bug
git log --oneline  # see recent commits
```

```bash
# Scenario: Your tests are failing, but they worked last week
# You need to find which commit introduced the bug
git log --oneline

# Start the bisect process
git bisect start
```

```bash
# Start the bisect process
git bisect start

# Mark current commit as bad (has the bug)
git bisect bad
```

```bash
# Mark current commit as bad (has the bug)
git bisect bad

# Mark a commit you know was good (e.g., last week)
git bisect good HEAD~10
# Git will checkout a commit in the middle
```

```bash
# Mark a commit you know was good
git bisect good HEAD~10

# Git checks out middle commit
# Test your code (run tests, check functionality)
npm test  # or whatever your test command is

```bash
# Test your code (run tests, check functionality)
npm test  # or whatever your test command is

# If tests pass:
git bisect good
# If tests fail:
git bisect bad

# Git will checkout another commit to test
```

```bash
# Keep testing and marking commits as good/bad
# Git will eventually find the exact commit that introduced the bug

# When found, Git will show:
# abc123 is the first bad commit
# commit abc123
# Author: Someone <someone@example.com>
# Date: Mon Jan 15 10:30:00 2024
#     Add new feature that broke everything

# End the bisect session
git bisect reset
```
````

---

# Exercise: Find the Bug with Git Bisect

### Scenario
You're working on a Go project and a test just started failing. Your task is to find which commit introduced the bug using `git bisect`.

### Clone the repository

```bash
git clone https://github.com/AnuchitO/demo-bisect.git
cd demo-bisect

go test

git bisect start
git bisect bad HEAD
git bisect good <good-commit>
```

### Tips
- Use `git bisect visualize` to see the current state
- Run `git bisect log` to see your bisect history
- If you make a mistake, use `git bisect reset` to start over

---

# Bisect script

```bash
# Create a script to run tests
#!/bin/sh
go test
if [ $? -ne 0 ]; then
  echo "Tests failed, commit aborted"
  exit 1
else
  exit 0
fi
```

```bash
git bisect start
git bisect bad HEAD
git bisect good <good-commit>
# Run the script with bisect
git bisect run scripts/bisect_test.sh
```

---

# Git Tags & Semantic Versioning

Git tags are references (or pointers) to specific points in a project's history, typically used to mark releases.
While annotated tags are effectively immutable, lightweight tags can technically be moved, but it's discouraged.

<div class="grid grid-cols-2 gap-4">
<div>

### Basic Tag Commands

```bash
# List all tags
git tag
# Create lightweight tag
git tag v1.0.0
# Create annotated tag
git tag -a v1.0.0 -m "Release v1.0.0"
# Show tag details
git show v1.0.0
# Push tags to remote
git push origin v1.0.0
# Push all tags
git push origin --tags

git checkout v1.0.0 # Checkout specific tag
git tag -d v1.0.0 # Delete local tag
git push --delete origin v1.0.0 # Delete remote tag
```
</div>

<div>

### Semantic Versioning (SemVer)

`MAJOR.MINOR.PATCH` (e.g., `v2.1.3`)

- **MAJOR**: Incompatible API changes
- **MINOR**: Backward-compatible features
- **PATCH**: Backward-compatible bug fixes

### Pre-release & Build Metadata
- `1.0.0-alpha.1` - Alpha release
- `1.0.0-beta.2` - Beta release
- `1.0.0-rc.1` - Release candidate

</div>
</div>

> Best Practices: Use annotated tags for releases, Follow SemVer strictly, Sign important tags, Document changes in release notes

---

# Git Hooks

Git hooks are scripts that run automatically before or after specific Git events.

<div class="grid grid-cols-2 gap-4">
<div>

### Common Local Hooks

- `pre-commit`: Runs before commit
- `prepare-commit-msg`: Before commit message editor
- `commit-msg`: After commit message is created
- `post-commit`: After commit is completed
- `pre-push`: Before pushing to remote

</div>
<div>

### Example: Pre-commit Hook

```bash
#!/bin/sh
# .git/hooks/pre-commit

echo "Running tests..."
go test

# If tests fail, prevent commit
if [ $? -ne 0 ]; then
  echo "❌ Tests failed. Commit aborted."
  exit 1
fi

echo "✅ All tests passed!"
```

</div>
</div>

### dry-run

```bash
git commit --dry-run
```

---

# Pre-commit Framework

A framework for managing and maintaining multi-language pre-commit hooks.

<div class="grid grid-cols-2 gap-4">
<div>

### Setup

```bash
# Install pre-commit
pip install pre-commit

# Create config file
cat > .pre-commit-config.yaml <<EOL
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
    -   id: trailing-whitespace
    -   id: end-of-file-fixer
    -   id: check-yaml
    -   id: check-added-large-files

-   repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
    -   id: black

# Install hooks
pre-commit install
```

</div>
<div>

### How to Use pre-commit

1. Install:
   ```bash
   pip install pre-commit
   ```
2. Add config file: `.pre-commit-config.yaml`
3. Install hooks:
   ```bash
   pre-commit install
   ```
4. Run: `pre-commit run --all-files`

### Common Hooks

- Code formatting (Black, Prettier)
- Linting (ESLint, Pylint)
- Security scanning (Bandit, TruffleHog)
- Testing (Run tests before commit)
- Custom scripts

</div>
</div>

---

# Git Tools and Integrations

Enhance your Git workflow with these tools and integrations.

<div class="grid grid-cols-3 gap-6">

<div>

## GUI Tools
- **GitKraken** - Visual Git client
- **Sourcetree** - Free Git GUI
- **GitHub Desktop** - Simple GitHub integration
- **Tower** - Professional Git client

## IDE Extensions
- **GitLens** (VS Code) - Git supercharged
- **Git Graph** (VS Code) - Visualize branches
- **Magit** (Emacs) - Git porcelain
- **Fugitive** (Vim) - Git wrapper

</div>

<div>


## Command Line Tools
```bash
# Enhanced git log
git log --graph --pretty=format:'%h %s'

# Git aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch

# Tig - text-mode interface
brew install tig
tig

# Lazygit - simple terminal UI
brew install lazygit
lazygit
```

</div>

<div>

## Automation & CI/CD
- **GitHub Actions** - Automated workflows
- **GitLab CI** - Integrated CI/CD
- **Jenkins** - Build automation
- **Husky** - Git hooks for Node.js

## Git Hooks
```bash
# Pre-commit hook example
#!/bin/sh
npm test
if [ $? -ne 0 ]; then
  echo "Tests failed, commit aborted"
  exit 1
fi
```

</div>

</div>

<!--
The right tools can significantly improve your Git experience. Start with basic command line skills, then add tools that match your workflow and preferences.
-->

---

# Git Performance and Optimization

Keep your Git repositories fast and efficient with these optimization techniques.

<div class="grid grid-cols-2 gap-8">

<div>

## Repository Maintenance
```bash
# Clean up unnecessary files
git gc --aggressive
# Verify repository integrity
git fsck
# Show repository size
git count-objects -vH
# Prune remote tracking branches
git remote prune origin
# Clean untracked files
git clean -fd
```

## Large File Handling
```bash
# Git LFS for large files
git lfs install
git lfs track "*.psd"
git add .gitattributes

# Shallow clone for large repos
git clone --depth 1 <url>

# Partial clone (Git 2.19+)
git clone --filter=blob:none <url>
```

</div>

<div>

## Configuration Optimization
```bash
# Enable parallel processing
git config --global pack.threads 0

# Increase pack size limit
git config --global pack.packSizeLimit 2g

# Enable file system monitor
git config --global core.fsmonitor true

# Use SSH instead of HTTPS
git config --global url."git@github.com:".insteadOf "https://github.com/"
```

</div>

</div>

---
layout: center
class: text-center
---

# Thank You!

You now have the foundation to use Git effectively in professional software development.

<div class="mt-8 grid grid-cols-3 gap-8">

<div class="p-4">
<carbon:checkmark-filled class="text-4xl text-green-500 mx-auto mb-2" />
<h3>Master the Basics</h3>
<p class="text-sm">You understand Git's core concepts and essential commands</p>
</div>

<div class="p-4">
<carbon:logo-git class="text-4xl text-blue-500 mx-auto mb-2" />
<h3>Collaborate Effectively</h3>
<p class="text-sm">You can work with teams using branches and pull requests</p>
</div>

<div class="p-4">
<carbon:tools class="text-4xl text-purple-500 mx-auto mb-2" />
<h3>Handle Complex Scenarios</h3>
<p class="text-sm">You know how to resolve conflicts and recover from mistakes</p>
</div>

</div>

<div class="mt-12">
<p class="text-lg mb-4">Remember: Git mastery comes with practice!</p>
<p class="text-sm opacity-75">Made with ❤️ by AnuchitO using <a href="https://sli.dev" target="_blank">Slidev</a></p>
</div>

<!--
Congratulations on completing the Git for Software Engineers course! You now have the knowledge and tools to use Git confidently in your development work. Keep practicing and don't hesitate to refer back to these slides when needed.
-->