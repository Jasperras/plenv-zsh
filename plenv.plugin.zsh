GITHUB="https://github.com"

[[ -z "${PLENV_HOME}" ]] && export PLENV_HOME="${HOME}/.plenv"

_zsh_plenv_install() {
    echo "Installing plenv..."
    git clone "${GITHUB}/tokuhirom/plenv.git" "${PLENV_HOME}"
}

_zsh_plenv_load() {
    export PATH="${PLENV_HOME}/bin:${PATH}"
    eval "$(plenv init -)"
}

# First check if installed, if not, install.
[[ ! -d "${PLENV_HOME}" ]] && _zsh_plenv_install

# Then always check again to load, otherwise it may not load upon first install.
[[ -d "${PLENV_HOME}" ]] && _zsh_plenv_load

