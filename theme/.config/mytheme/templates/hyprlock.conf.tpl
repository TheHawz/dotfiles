background {
    monitor =
    path = $HOME/.config/mytheme/backgrounds/1-memento-mori.jpg
    blur_passes = 3
    blur_size = 6
}

input-field {
    monitor =
    size = 320, 50
    outline_thickness = 2
    dots_size = 0.30
    dots_spacing = 0.30
    outer_color = {{ accent }}
    inner_color = {{ background }}
    font_color = {{ foreground }}
    fail_color = {{ red }}
    check_color = {{ yellow }}
    placeholder_text = <span foreground="{{ muted }}">Contraseña…</span>
    fade_on_empty = false
    rounding = 8
    position = 0, -80
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:1000] echo "$(date +'%H:%M')"
    color = {{ bright_foreground }}
    font_size = 88
    font_family = JetBrainsMono Nerd Font
    position = 0, 120
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:60000] echo "$(date +'%A, %d de %B')"
    color = {{ light_foreground }}
    font_size = 20
    font_family = JetBrainsMono Nerd Font
    position = 0, 40
    halign = center
    valign = center
}
