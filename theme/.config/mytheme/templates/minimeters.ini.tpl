# MiniMeters — generado por apply-theme.sh desde tu paleta.
# Ojo: MiniMeters usa RGB DECIMAL (172, 192, 222), no hexadecimal.
# De ahí el modificador _rgb de las plantillas.

credit = Generado desde ~/.config/mytheme/colors.toml

[All]
primary = {{ accent_rgb }}
secondary = {{ muted_rgb }}
selection = {{ selection_rgb }}
text = {{ foreground_rgb }}
background = {{ background_rgb }}
background_secondary = {{ lighter_background_rgb }}

tooltip = {{ dark_background_rgb }}
tooltip_accent = {{ selection_rgb }}
tooltip_text = {{ foreground_rgb }}
quad_guides = {{ muted_rgb }}
quad_guide_bg = {{ lighter_background_rgb }}
error = {{ red_rgb }}
warning = {{ yellow_rgb }}
record_icon = {{ red_rgb }}

[Spectrum]
primary = {{ accent_rgb }}
secondary = {{ bright_blue_rgb }}
frequency_lines = {{ muted_rgb }}
threshold_line = {{ yellow_rgb }}
target_curve = {{ green_rgb }}
filter_overlay = {{ blue_rgb }}

[Oscilloscope]
primary = {{ accent_rgb }}
secondary = {{ muted_rgb }}

[Waveform]
primary = {{ accent_rgb }}
low_band = {{ red_rgb }}
mid_band = {{ green_rgb }}
high_band = {{ blue_rgb }}
history_low_band = {{ bright_red_rgb }}
history_mid_band = {{ bright_green_rgb }}
history_high_band = {{ bright_blue_rgb }}

[Stereometer]
primary = {{ accent_rgb }}
guides = {{ muted_rgb }}
low_band = {{ red_rgb }}
mid_band = {{ green_rgb }}
high_band = {{ blue_rgb }}

[Spectrogram]
frequency_lines = {{ muted_rgb }}
white_key = {{ light_foreground_rgb }}
black_key = {{ dark_background_rgb }}
selected_key = {{ accent_rgb }}

[Loudness]
primary = {{ accent_rgb }}
text = {{ background_rgb }}
accent = {{ yellow_rgb }}

[VUMeter]
primary = {{ accent_rgb }}
needle = {{ orange_rgb }}
above_zero = {{ bright_red_rgb }}
peak_indicator = {{ orange_rgb }}
clip_indicator = {{ red_rgb }}
