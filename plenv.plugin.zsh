GITHUB="https://github.com"

[[ -z "${PLENV_HOME}" ]] && export PLENV_HOME="${HOME}/.plenv"
[[ -z "${PLENV_PLUGINS}" ]] && export PLENV_PLUGINS="${PLENV_HOME}/plugins"

_zsh_plenv_install() {
    echo "Installing plenv..."
    git clone "${GITHUB}/tokuhirom/plenv.git" "${PLENV_HOME}"
}

_zsh_plenv_install_perl_build() {
    echo "Install perl build.."
    git clone "${GITHUB}/tokuhirom/Perl-Build.git" "${PLENV_PLUGINS}/perl-build"
}

_zsh_plenv_load() {
    export PATH="${PLENV_HOME}/bin:${PATH}"
    eval "$(plenv init -)"
}

# First check if installed, if not, install.
[[ ! -d "${PLENV_HOME}" ]] && _zsh_plenv_install
[[ ! -d "${PLENV_PLUGINS}/perl-build" ]] && _zsh_plenv_install_perl_build

# Then always check again to load, otherwise it may not load upon first install.
[[ -d "${PLENV_HOME}" ]] && _zsh_plenv_load

