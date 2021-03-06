## Utility functions used to include other configuration files:

try_to_source() {
    local file="${1}"

    [[ -f "${file}" && -r "${file}" ]] && . "${file}"
}

source_everything_in() {
    local dir="${1}"

    if [[ -d "${dir}" && -r "${dir}" && -x "${dir}" ]]; then
        for file in "${dir}"/*; do
           try_to_source "${file}"
        done
    fi
}

has() {
    hash "$@" &>/dev/null
}

# Include individual bash configuration files.
source_everything_in ~/.bashrc.d

# Include host-specific .bashrc file.
# This is done last to allow for host-specific overrides of defaults.
try_to_source ~/".bashrc.$(hostname -s)"

# Allow direnv to override the environment
has direnv && eval "$(direnv hook bash)"
