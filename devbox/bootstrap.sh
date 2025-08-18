#!/bin/zsh
echo "Welcome to devbox!"

# Ensure target directories exist
mkdir -p /home/devbox/space

if [ ! -L /home/devbox/.config ]; then
  ln -s /home/devbox/work/.config /home/devbox/.config
fi

# Link all configs from mounted work/.config → $HOME/.config
  # TODO: symlink for all home config
  # if [ -d /home/devbox/work/.config ]; then
  # for f in /home/devbox/work/.config/*; do
  #   base=$(basename "$f")
  #   target="/home/devbox/.config/$base"
  #   # If file/symlink already exists, skip to avoid overwriting
  #   if [ ! -e "$target" ]; then
  #     ln -s "$f" "$target"
  #   fi
  # done
  # fi

exec $@

