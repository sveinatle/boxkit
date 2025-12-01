#!/bin/sh
# Run chezmoi init on first interactive shell launch
CHEZMOI_MARKER="${HOME}/.config/chezmoi/.initialized"

if [ ! -f "${CHEZMOI_MARKER}" ] && command -v chezmoi >/dev/null 2>&1; then
    echo "Running chezmoi initialization on first launch..."
    
    if chezmoi init --apply git@github.com:sveinatle/dotfiles.git; then
        mkdir -p "$(dirname "${CHEZMOI_MARKER}")"
        touch "${CHEZMOI_MARKER}"
        echo "✓ chezmoi initialization complete"
    else
        echo "⚠ chezmoi initialization failed"
    fi
fi
