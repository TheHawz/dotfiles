# Solo Linux (este PC: Arch + Hyprland).

if test (uname) = Linux
    # Navegador para programas de terminal (gh, etc.). No se exporta a la
    # sesión entera: xdg-settings se niega a cambiar el predeterminado si
    # BROWSER está puesto a nivel de sesión.
    if command -q librewolf
        set -gx BROWSER librewolf
    end
end
