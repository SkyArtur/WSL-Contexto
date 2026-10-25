export PROJECTS_DIR="$HOME/Projects"

# Atalho para navegar até um projeto: cproj api ou cproj cliente/web.
cproj() {
    local project_path="$PROJECTS_DIR${1:+/$1}"
    if [[ -d $project_path ]]; then
        # shellcheck disable=SC2164
        cd -- "$project_path"
    else
        printf 'Projeto não encontrado: %s\n' "$project_path" >&2
        return 1
    fi
}
