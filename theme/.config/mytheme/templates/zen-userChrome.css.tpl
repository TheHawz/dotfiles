/* Zen Browser — generado por apply-theme.sh desde tu paleta.
 *
 * Solo se redefinen variables de alto nivel, no se estilan widgets concretos:
 * el DOM interno de Zen cambia entre versiones y estilarlo se rompe solo.
 * Las --lwt-* son de Firefox y las más estables; las --zen-* se sacaron del
 * build instalado (grep sobre omni.ja).
 */

:root {
  /* Zen */
  --zen-primary-color: {{ accent }};
  --zen-colors-primary: {{ background }};
  --zen-colors-secondary: {{ lighter_background }};
  --zen-colors-tertiary: {{ dark_background }};
  --zen-colors-border: {{ selection }};
  --zen-colors-hover-bg: {{ selection }};
  --zen-dialog-background: {{ background }};
  --zen-sidebar-themed-icon-fill: {{ foreground }};

  /* Firefox (base estable) */
  --lwt-accent-color: {{ background }};
  --lwt-accent-color-inactive: {{ dark_background }};
  --lwt-text-color: {{ foreground }};
  --lwt-tab-line-color: {{ accent }};
  --lwt-sidebar-highlight-background-color: {{ selection }};
  --lwt-sidebar-highlight-text-color: {{ bright_foreground }};
  --lwt-toolbar-field-highlight: {{ selection }};
  --lwt-toolbar-field-highlight-text: {{ bright_foreground }};

  --toolbar-bgcolor: {{ background }};
  --toolbar-color: {{ foreground }};
  --toolbar-field-background-color: {{ lighter_background }};
  --toolbar-field-color: {{ foreground }};
  --toolbar-field-focus-background-color: {{ lighter_background }};
  --toolbar-field-border-color: {{ selection }};
}
