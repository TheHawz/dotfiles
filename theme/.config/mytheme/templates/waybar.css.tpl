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

/* Tres piezas con forma de PESTANA colgando del borde superior.
 *
 * Las de los extremos nacen del borde de la pantalla y solo redondean por
 * dentro; la central redondea por los dos lados.
 *
 * NOTA: Ryoku usa una curva en S (concava) que GTK3 NO puede dibujar. Su
 * shell es Quickshell/QML, con formas libres. GTK3 no tiene clip-path, no
 * admite calc() en background-size, y su motor de degradados no da cortes
 * limpios en curva (se probó con radial-gradient: sale difuminado o recto).
 * border-radius si lo hace impecable, asi que la pestaña va por ahi.
 */
window#waybar {
  background: transparent;
  color: {{ foreground }};
}

.modules-left,
.modules-center,
.modules-right {
  background-color: {{ background }};
}

/* Pieza izquierda: nace del borde, redondea abajo a la derecha */
.modules-left {
  border-radius: 0 0 {{ radius_tab }}px 0;
  padding: 0 16px 0 18px;
}

/* Pieza central: redondea abajo por los dos lados */
.modules-center {
  border-radius: 0 0 {{ radius_tab }}px {{ radius_tab }}px;
  padding: 0 20px;
}

/* Pieza derecha: redondea abajo a la izquierda, nace del borde */
.modules-right {
  border-radius: 0 0 0 {{ radius_tab }}px;
  padding: 0 18px 0 16px;
}

/* ── Panel flotante de monitorizacion ──────────────────────────────────
 * Es la segunda barra (name: "widget"). Al no tocar ningun borde, aqui si
 * redondea las cuatro esquinas y lleva borde completo.
 */
window#waybar.widget {
  background: transparent;
}
window#waybar.widget .modules-right {
  background-color: {{ background }};
  border: 1px solid {{ selection }};
  border-radius: {{ radius }}px;
  padding: 0 14px;
}
window#waybar.widget #cpu,
window#waybar.widget #memory,
window#waybar.widget #temperature,
window#waybar.widget #disk,
window#waybar.widget #custom-gpu,
window#waybar.widget #custom-updates {
  padding: 0 10px;
  color: {{ light_foreground }};
}

/* ── Modulos nuevos de la barra superior ───────────────────────────────── */
#window {
  padding: 0 14px;
  color: {{ muted }};
}

#mpris {
  padding: 0 12px;
  color: {{ green }};
}
#mpris.paused { color: {{ muted }}; }

#privacy {
  padding: 0 8px;
  color: {{ red }};
}

#idle_inhibitor {
  padding: 0 9px;
  color: {{ muted }};
}
#idle_inhibitor.activated { color: {{ yellow }}; }

#custom-gpu.warning  { color: {{ yellow }}; }
#custom-gpu.critical { color: {{ red }}; }
#custom-updates.pending { color: {{ accent }}; }

/* Separador fino tras el boton de menu */
#custom-menu {
  border-right: 1px solid {{ selection }};
}

#workspaces button {
  padding: 0 9px;
  margin: 3px 1px;
  color: {{ muted }};
  background: transparent;
  border-radius: {{ radius_small }}px;
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
  padding: 0 16px;
  margin-right: 8px;
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
#pulseaudio,
#cpu,
#memory,
#temperature {
  padding: 0 9px;
  color: {{ light_foreground }};
}

#bluetooth.connected { color: {{ blue }}; }
#network.disconnected { color: {{ red }}; }
#pulseaudio.muted { color: {{ muted }}; }
#temperature.critical { color: {{ red }}; }

tooltip {
  background: {{ dark_background }};
  border: 1px solid {{ selection }};
  border-radius: {{ radius_small }}px;
  color: {{ foreground }};
}
