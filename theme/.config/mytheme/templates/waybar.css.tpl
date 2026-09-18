* {
  font-family: "JetBrainsMono Nerd Font", monospace;
  font-size: 13px;
  border: none;
  border-radius: 0;
  min-height: 0;
}

window#waybar {
  background: {{ background }};
  color: {{ foreground }};
}

#workspaces button {
  padding: 0 8px;
  color: {{ muted }};
  background: transparent;
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
  font-size: 15px;
}
#custom-menu:hover {
  background: {{ lighter_background }};
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
  padding: 0 8px;
  color: {{ light_foreground }};
}

#bluetooth.connected { color: {{ blue }}; }
#network.disconnected { color: {{ red }}; }
#wireplumber.muted { color: {{ muted }}; }
#temperature.critical { color: {{ red }}; }

tooltip {
  background: {{ dark_background }};
  border: 1px solid {{ selection }};
  color: {{ foreground }};
}
