FROM debian:bookworm-slim

RUN echo "uedwiak" > /etc/hostname

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
# ---------------- Base dev dependencies ----------------
RUN apt-get update && apt-get install -y \
    # shells & editors
    zsh \
    neovim \
    # source control
    git \
    # network tools
    curl \
    wget \
    ca-certificates \
    openssh-client \
    gnupg \
    # compilers & build tools
    build-essential \
    pkg-config \
    python3 \
    python3-pip \
    # common system libs
    libssl-dev \
    libffi-dev \
    libc6 \
    libstdc++6 \
    libgcc-12-dev \
    # utils
    unzip \
    tar \
    xz-utils \
    tree \
    sudo \
    tmux \
    htop \
    && rm -rf /var/lib/apt/lists/*




# ---------------- Locale ----------------
RUN apt-get update && apt-get install -y locales \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# ---------------- Dev user ----------------
RUN useradd -ms /bin/zsh devbox \
    && echo "devbox ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER devbox
WORKDIR /home/devbox
ENV HOME=/home/devbox

# ---------------- Oh My Zsh ----------------
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/devbox/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/home/devbox/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' /home/devbox/.zshrc

RUN sed -i '1s|^.*$|PROMPT="%{%n@%m %(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"|' /home/devbox/.oh-my-zsh/themes/robbyrussell.zsh-theme

# Increase history & buffer size for zsh
RUN echo "HISTSIZE=10000" >> /home/devbox/.zshrc \
    && echo "SAVEHIST=10000" >> /home/devbox/.zshrc \
    && echo "setopt APPEND_HISTORY" >> /home/devbox/.zshrc \
    && echo "setopt HIST_IGNORE_DUPS" >> /home/devbox/.zshrc \
    && echo "setopt INC_APPEND_HISTORY" >> /home/devbox/.zshrc \
    && echo "export LESS='-R'" >> /home/devbox/.zshrc \
    && echo "export PAGER=less" >> /home/devbox/.zshrc

# Set a hostname
ENV HOSTNAME=uedwiak

# ---------------- Node.js & npm ----------------
USER root
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get update && apt-get install -y nodejs \
    && npm install -g npm@latest \
    && rm -rf /var/lib/apt/lists/*

USER devbox

# ---------------- Bun ----------------
RUN curl -fsSL https://bun.sh/install | bash \
    && echo 'export PATH=$HOME/.bun/bin:$PATH' >> /home/devbox/.zshrc

# ---------------- Go ----------------
ENV GO_VERSION=1.23.0
RUN curl -fsSL https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz \
    | sudo tar -C /usr/local -xz \
    && sudo ln -s /usr/local/go/bin/go /usr/local/bin/go \
    && sudo ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt \
    && echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/devbox/.zshrc \
    && echo 'export PATH=$PATH:$HOME/go/bin' >> /home/devbox/.zshrc

# ---------------- Git config ----------------
# RUN git config --global user.name "Dev Box" \
#     && git config --global init.defaultBranch main
#     &&  git config --global --add safe.directory /home/devbox/work/* \
#     && git config --global user.email "devbox@example.com" \
#     && git config --global core.editor "nvim" \
#     && git config --global color.ui auto \
#     && git config --global pull.rebase false


# -------------- Bootstrap script -----------
COPY ./bootstrap.sh bootstrap.sh
# Volumes & Shell
VOLUME ["/home/devbox/work"]


# Set it as the default command when container starts
ENTRYPOINT ["/home/devbox/bootstrap.sh"]

CMD ["zsh"]
