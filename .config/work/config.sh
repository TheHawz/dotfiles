# shellcheck shell=bash
# Sourced by startwork. Paths are the existing checkouts that own worktrees.

WORK_ROOT="${HOME}/repos"

# Canonical alias is the folder name under the ticket and the tmux window name.
# Extra names on the left are CLI aliases.

work_lookup() {
  case "$1" in
    marketing | trinity-analytics-marketing)
      printf '%s\t%s\t%s\n' \
        "${HOME}/repos/trinity-analytics-marketing" \
        "main" \
        "marketing"
      ;;
    containers | trinity-analytics-containers)
      printf '%s\t%s\t%s\n' \
        "${HOME}/repos/toolkit_to_containers_migration/trinity-analytics-containers" \
        "main" \
        "containers"
      ;;
    *)
      return 1
      ;;
  esac
}

work_known_repos() {
  echo "marketing (trinity-analytics-marketing)"
  echo "containers (trinity-analytics-containers)"
}
