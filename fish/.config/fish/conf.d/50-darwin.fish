# Solo macOS.

if test (uname) = Darwin
    # Homebrew: pone PATH, MANPATH e INFOPATH
    for brew in /opt/homebrew/bin/brew /usr/local/bin/brew
        if test -x $brew
            $brew shellenv | source
            break
        end
    end

    # Ghostty: compatibilidad con image.nvim y snacks.nvim
    if test "$TERM_PROGRAM" = ghostty
        set -gx KITTY_WINDOW_ID 1
        set -gx SNACKS_GHOSTTY true
    end

    if status is-interactive
        alias tmux_sheet 'open -n https://tmuxcheatsheet.com'

        if test -x /Applications/gowsumed.app/Contents/MacOS/gowsume
            alias gowsume /Applications/gowsumed.app/Contents/MacOS/gowsume
        end
    end
end
