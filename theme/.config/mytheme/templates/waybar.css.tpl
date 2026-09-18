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
  border-radius: {{ radius_small }}px;
  color: {{ foreground }};
}
