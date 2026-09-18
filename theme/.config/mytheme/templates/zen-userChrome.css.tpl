/* Zen Browser — generado por apply-theme.sh desde tu paleta.
 *
 * DOS COSAS QUE HAY QUE SABER, aprendidas a base de que no funcionara:
 *
 * 1. !important es OBLIGATORIO. userChrome.css es una hoja de ORIGEN USUARIO,
 *    y en el cascade de CSS las declaraciones normales de usuario pierden
 *    frente a las de autor (el CSS propio de Zen). Solo con !important gana
 *    el usuario. Sin esto, el fichero se carga y no hace absolutamente nada.
 *
 * 2. Zen DERIVA su paleta de una sola variable. En zen-theme.css:
 *      --zen-colors-primary: color-mix(in srgb, var(--zen-primary-color) 20%,
 *                                      var(--zen-branding-bg) 80%);
 *    Redefinir las derivadas es inútil: Zen las recalcula. Se toca la raíz
 *    y él genera el resto, que además es más robusto ante actualizaciones.
 */

:root {
  /* Las dos raíces de las que Zen deriva todo lo demás */
  --zen-primary-color: {{ accent }} !important;
  --zen-branding-dark: {{ background }} !important;
  --zen-branding-paper: {{ light_foreground }} !important;

  /* Base estándar de Firefox */
  --lwt-accent-color: {{ background }} !important;
  --lwt-accent-color-inactive: {{ dark_background }} !important;
  --lwt-text-color: {{ foreground }} !important;
  --lwt-tab-line-color: {{ accent }} !important;
  --lwt-sidebar-highlight-background-color: {{ selection }} !important;
  --lwt-sidebar-highlight-text-color: {{ bright_foreground }} !important;

  --toolbar-bgcolor: {{ background }} !important;
  --toolbar-color: {{ foreground }} !important;
  --toolbar-field-background-color: {{ lighter_background }} !important;
  --toolbar-field-color: {{ foreground }} !important;
  --toolbar-field-border-color: {{ selection }} !important;
}
