# Zsh and Oh My Zsh: Anatomy of a Modern Shell

## 1. Shell: What It Is and Why Change It

When you open a terminal, you see a prompt and can type commands. The program that
reads those commands, passes them to the system, and displays the result is called
a **shell**.

Most Linux distributions ship with **Bash** (Bourne Again SHell) as the default.
It appeared in 1989 and has been the standard ever since. Bash is reliable,
predictable, and does everything you need: variables, loops, functions, file
completion. But its user interface has barely changed in 35 years — the same
monochrome prompt with minimal visual feedback.

**Zsh** (Z Shell) appeared in 1990 and remained "just another shell" for a long time.
The turning point was **Oh My Zsh** — a framework that made Zsh configuration simple
and accessible. Today it is the de facto standard for developers.

## 2. Zsh: A Superset of Bash, Not a Replacement

Zsh is fully backward-compatible with Bash. Any `.sh` script written for Bash runs
in Zsh without changes. Every familiar command (`ls`, `cd`, `grep`, `sudo`) works
exactly the same.

The difference is in interactive mode. When you work in the terminal manually, Zsh
offers features that Bash either lacks or requires complex configuration for.

### 2.1 Menu-Based Autocompletion

Bash can complete file and command names with Tab. Zsh goes further:

- Shows a **menu of options** instead of blindly inserting the first match.
- **Completes command options**: type `git `, press Tab — see a list of available subcommands.
- **Completes paths with filtering**: `cd ~/D` → Tab → shows only folders starting with D.
- Supports **recursive completion**: `**/file` finds `file` in any nested folder.

### 2.2 Globbing (Extended Patterns)

Bash: `*.txt` — all txt files in the current directory.
Zsh:

- `**/*.txt` — recursively in all subdirectories.
- `*.txt~*.bak` — all txt files, excluding bak.
- `*.(txt|md)` — all txt and md files.
- `<1-100>.*` — files with a number from 1 to 100 in the name.

### 2.3 Syntax Highlighting and Autosuggestions

With plugins enabled (see section 3), Zsh highlights the command in green if it is
valid, and in red if it is not — **before you press Enter**. A grey suggestion from
history saves you from retyping long commands.

## 3. Oh My Zsh: A Management Platform for Zsh

**Oh My Zsh** is an open-source framework (MIT license) created in 2009. It solves
the main problem of Zsh: the complexity of initial setup.

### 3.1 What Oh My Zsh Provides

| Aspect | Before Oh My Zsh | After |
| :--- | :--- | :--- |
| Theme management | Write a `PROMPT` function manually | One line `ZSH_THEME="..."` in config |
| Plugin management | Clone repos, edit `$fpath` | One line `plugins=(...)` in config |
| Aliases | Define each one manually | Ready-made sets: git, docker, rails, python |
| Updates | Manual tracking | `omz update` |

### 3.2 How Oh My Zsh Is Structured

Everything lives in `~/.oh-my-zsh/`. Layout:
~/.oh-my-zsh/  
├── lib/ # Core: config loading, completion system, themes  
├── plugins/ # Built-in plugins  
├── custom/  
│ ├── plugins/ # User plugins  
│ └── themes/ # User themes  
└── themes/ # Built-in themes

### 3.3 Essential Plugins

- **git** — dozens of short aliases (`gst` = `git status`, `gco` = `git checkout`,
  `gcm` = `git commit -m`). Plus the `git_prompt_info` function used by all themes.

- **zsh-autosuggestions** — a grey suggestion from history. `→` (right arrow) — accept,
  `Ctrl+E` — accept and complete, `Ctrl+/` — dismiss.

- **zsh-syntax-highlighting** — real-time syntax highlighting. Green = command exists
  and syntax is correct. Red = error or unknown command.

## 4. Powerlevel10k: Theme as Interface

Powerlevel10k is a theme for Zsh/Oh My Zsh, written from scratch for maximum speed.
Author: Roman Perepelitsa, 2019.

### 4.1 Why Not Other Themes

Most themes (including the popular Powerlevel9k) recalculate the prompt every time
you press Enter. If the Git repository is large or there are many plugins, a noticeable
delay occurs.

Powerlevel10k solves this with two mechanisms:

- **Instant Prompt** — the prompt appears instantly when the terminal starts, without
  waiting for all plugins to load. Plugins load in the background and the prompt updates
  when they are ready.

- **Gitstatus** — instead of slow `git status` calls, a daemon `gitstatusd` caches the
  repository state and updates it asynchronously.

Result: the prompt is always displayed instantly, regardless of repository size or
the number of plugins.

### 4.2 Interactive Wizard

Instead of editing a configuration file, Powerlevel10k offers the `p10k configure`
wizard. It shows styling options in real time and writes your choices to `~/.p10k.zsh`.

### 4.3 Transient Prompt

When enabled, the full prompt is replaced with a simple `❯` after a command is executed.
The terminal history becomes clean: only commands, without repeated prompt decoration.
Copying a sequence of commands from history requires no cleanup of prompt lines.

### 4.4 Informational Segments

Powerlevel10k displays the following in the prompt:

- **os_icon** — distribution icon (detected from `/etc/os-release`).
- **dir** — current directory. Long paths are intelligently truncated.
- **vcs** — Git status: branch, commits ahead/behind remote, staged/unstaged/untracked
  changes, stash, conflicts.
- **status** — exit code of the last command (red = error).
- **command_execution_time** — duration of the last command (if above the threshold,
  default 3 seconds).
- **time** — current time.
- **background_jobs** — background tasks.

Segments can be added or removed in `~/.p10k.zsh`.

## 5. Nerd Font: Why Icons Work

Powerlevel10k uses symbols from the Unicode Private Use Area. These symbols are not
included in standard fonts. **Nerd Font** is a project that adds thousands of icons
from Font Awesome, Devicons, Octicons, and Material Design Icons to popular monospace
fonts (Fira Code, Hack, JetBrains Mono).

Without a Nerd Font, icons appear as squares or blank spaces.
With one — the distribution icon, folder symbol, Git symbol, clock icon, etc.

## 6. Comparison: Plain Bash vs. Zsh + Oh My Zsh

| Aspect | Bash (plain) | Zsh + Oh My Zsh + P10k |
| :--- | :--- | :--- |
| Prompt | `user@host:~$ ` | Icons, Git, time, status |
| Autocompletion | Tab for files | Menu, command options, filtering |
| Suggestions | None | From history, in grey |
| Highlighting | None | Green/red, real-time |
| Git aliases | Manual | 100+ ready-made |
| Command history | Plain list | Shared across all sessions |
| Startup speed | Fast | Instant (Instant Prompt) |
| Configuration | Write functions | `p10k configure` wizard |

## 7. When Zsh Is Not Needed

- You work on dozens of servers where Bash is the only available shell and you want
  consistency.
- You write scripts that must be maximally portable (Bash is guaranteed everywhere).
- You use the terminal rarely and non-critically.

In all other cases, the switch is justified.

## Summary

Zsh is Bash with a modern user interface. Oh My Zsh is a platform that makes Zsh
configuration trivial. Powerlevel10k is a theme that turns the prompt into an
informational panel. Together they provide a professional tool without sacrificing
compatibility or speed.

The entire configuration is contained in three elements: `~/.zshrc`, `~/.p10k.zsh`,
and the `~/.oh-my-zsh/` directory. To migrate to another machine — copy these three
and install Zsh.

## Additional Materials

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) — anonymous
theme repository. Comprehensive documentation on installation, configuration,
information segments, and troubleshooting.
- [Oh My Zsh](https://ohmyz.sh) — official website of the framework.
- [Nerd Fonts](https://www.nerdfonts.com) — a collection of patched fonts with icons.
- [Gogh](https://gogh-co.github.io/Gogh/) — a catalog of terminal color schemes.