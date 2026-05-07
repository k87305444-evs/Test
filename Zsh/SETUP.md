# Terminal Customization — Setup

Step-by-step guide with explanations. Each step links to official documentation
for further details.

---

## 1. Font

Powerlevel10k uses special Unicode symbols (icons) that are not included in
standard fonts. A **Nerd Font** is a monospace font patched with thousands of
icons from Font Awesome, Devicons, Octicons, and other icon sets.

Without it, you will see empty squares instead of icons in your prompt.

**Recommended:** Meslo Nerd Font — created specifically for Powerlevel10k by
its author. It contains every icon the theme may ever need.

[Official font installation guide →](https://github.com/romkatv/powerlevel10k#fonts)

### Manual installation

Create the fonts directory (if missing) and download the font:

```bash
mkdir -p ~/.local/share/fonts
wget -O /tmp/Meslo.zip https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
unzip /tmp/Meslo.zip -d ~/.local/share/fonts
fc-cache -fv
```

`fc-cache -fv` rebuilds the font cache so the system detects the new font
immediately.

### Apply in terminal

Open your terminal settings, find the font option, and select
**MesloLGS NF Regular**.

---

## 2. Color scheme

A color scheme defines the background, text, and accent colors of your terminal.

[Gogh](https://gogh-co.github.io/Gogh/) is a collection of 365+ ready-to-use
terminal themes.

Run the interactive selector:

```bash
bash -c "$(wget -qO- https://git.io/vQgMr)"
```

You will see a numbered list. Enter one or more numbers to preview and apply.

**Recommended:** `116` (Dracula), `12` (Argonaut), `241` (Nord).

The change takes effect immediately. Run the command again to try another theme.

---

## 3. Zsh + Oh My Zsh

### 3.1 Install Zsh

Zsh is a modern shell, fully compatible with Bash. All your commands and scripts
work exactly the same.

Install using your distribution's package manager:

```bash
apt install zsh -y        # Debian/Ubuntu
dnf install zsh -y        # Fedora
pacman -S zsh             # Arch
```

### 3.2 Install Oh My Zsh

Oh My Zsh is a framework that makes Zsh easy to configure — themes, plugins,
aliases are managed with a single config file.

[Official installation guide →](https://ohmyz.sh/#install)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

This command:
- Clones the Oh My Zsh repository to `~/.oh-my-zsh/`.
- Creates a default `~/.zshrc` configuration file.
- Sets Zsh as the current shell for the session.

### 3.3 Add plugins

Plugins extend Zsh with extra features. Three essential ones:

| Plugin | Purpose |
| :--- | :--- |
| `git` | Short aliases (`gst` = `git status`) and Git info in prompt |
| `zsh-autosuggestions` | Grey suggestion from history as you type |
| `zsh-syntax-highlighting` | Green = valid command, red = error — before Enter |

Open `~/.zshrc` and find the line starting with `plugins=`. Replace it with:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

`git` is built-in. The other two need to be downloaded:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Apply changes:

```bash
source ~/.zshrc
```

---

## 4. Powerlevel10k

Powerlevel10k is a theme for Zsh. It turns the prompt into an informative
dashboard: Git status, execution time, current directory, error codes, and more.

[Official installation guide →](https://github.com/romkatv/powerlevel10k#installation)

### 4.1 Install

Clone the theme repository into Oh My Zsh custom themes directory:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### 4.2 Activate

In `~/.zshrc`, find `ZSH_THEME=` and change it to:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Apply:

```bash
source ~/.zshrc
```

### 4.3 Configuration wizard

On first launch, Powerlevel10k starts an interactive wizard. It asks a series
of questions and shows a live preview of the result.

Recommended choices:

| Question | Option | Why |
| :--- | :--- | :--- |
| Style | Classic | Two-line layout with left and right sections |
| Character Set | Unicode | Beautiful triangle separators (requires Nerd Font) |
| Time | 24-hour | Clean, compact format |
| Height | Two lines | Command input always on its own line |
| Frame | Full | HUD-like panel borders |
| Spacing | Sparse | Blank line between commands for readability |
| Icons | Many icons | Folder, Git, clock, OS icons in prompt |
| Flow | Concise | Icons only, no extra words |
| Transient Prompt | Yes | Clean history — only `❯` after command runs |
| Instant Prompt | Verbose | Prompt appears instantly while plugins load |

If you change your mind later, reconfigure at any time:

```bash
p10k configure
```

All settings are saved in `~/.p10k.zsh`. You can edit it manually for deeper
customization.

---

## 5. Set Zsh as default

The installer sets Zsh for the current session only. To make it permanent:

```bash
chsh -s /usr/bin/zsh
```

Enter your password when prompted. Restart the terminal or log out.

---

## 6. Verify

Check that everything is active:

```bash
echo $SHELL        # Should print /usr/bin/zsh
echo $ZSH_THEME    # Should print powerlevel10k/powerlevel10k
```

---

## Rollback

Switch back to Bash at any time:

```bash
chsh -s /bin/bash
```

Reset Powerlevel10k configuration:

```bash
rm ~/.p10k.zsh && p10k configure
```

[Official uninstall guide →](https://github.com/romkatv/powerlevel10k#how-do-i-uninstall-powerlevel10k)
