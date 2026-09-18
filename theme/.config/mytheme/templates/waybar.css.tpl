/* waybar — generado por apply-theme.sh desde tu paleta.
 *
 * Disposicion en tres pildoras flotantes, tomada del lenguaje visual de
 * Ryoku ("the pill"): la ventana de la barra es transparente y cada grupo
 * de modulos es su propio bloque con fondo, borde y esquinas redondeadas.
 *
 * Tokens de tamano, para no repartir numeros sueltos por el fichero:
 *   texto 16px · iconos 19px · radio 12px · separacion 10px
 */

* {
  font-family: "JetBrainsMono Nerd Font", monospace;
  font-size: 16px;
  border: none;
  border-radius: 0;
  min-height: 0;
}

/* La barra en si no se ve: solo se ven las pildoras */
window#waybar {
  background: transparent;
  color: {{ foreground }};
}

/* Cada grupo es una pildora */
.modules-left,
.modules-center,
.modules-right {
  background: {{ background }};
  border: 1px solid {{ selection }};
  border-radius: 12px;
  padding: 0 6px;
  margin: 6px 0;
}

#workspaces button {
  padding: 0 9px;
  margin: 3px 1px;
  color: {{ muted }};
  background: transparent;
  border-radius: 8px;
}
#workspaces button.active {
  color: {{ background }};
  background: {{ accent }};
}
#workspaces button:hover {
  color: {{ bright_foreground }};
  background: {{ lighter_background }};
}
#workspaces button.urgent {
  color: {{ background }};
  background: {{ red }};
}

#custom-menu {
  padding: 0 12px;
  color: {{ accent }};
  font-size: 19px;
}
#custom-menu:hover {
  color: {{ bright_foreground }};
}

#clock {
  padding: 0 12px;
  color: {{ foreground }};
  font-weight: bold;
}

#language {
  padding: 0 8px;
  color: {{ muted }};
}

#tray,
#bluetooth,
#network,
#wireplumber,
#cpu,
#memory,
#temperature {
  padding: 0 9px;
  color: {{ light_foreground }};
}

#bluetooth.connected { color: {{ blue }}; }
#network.disconnected { color: {{ red }}; }
#wireplumber.muted { color: {{ muted }}; }
#temperature.critical { color: {{ red }}; }

tooltip {
  background: {{ dark_background }};
  border: 1px solid {{ selection }};
  border-radius: 8px;
  color: {{ foreground }};
}
