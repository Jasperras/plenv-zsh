GITHUB="https://github.com"

[[ -z "${PLENV_HOME}" ]] && export PLENV_HOME="${HOME}/.plenv"

_zsh_plenv_install() {
    echo "Installing plenv..."
    git clone "${GITHUB}/tokuhirom/plenv.git ${PLENV_HOME}"
}

_zsh_plenv_load() {
    export PATH="${PLENV_HOME}/bin:${PATH}"
    eval "$(plenv init -)"
}

if [[ -f "${PLENV_HOME}" ]]; then
    _zsh_plenv_load
else
    _zsh_plenv_install
fi

