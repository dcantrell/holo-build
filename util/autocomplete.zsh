#compdef holo-build

(( $+functions[_holo_build_formats] )) || _holo_build_formats()
{
    local -a _commands
    _commands=(
        'alpine:APK package (suitable for Alpine and derivatives)'
        'debian:Debian package (suitable for Debian, Ubuntu and derivatives)'
        'pacman:Pacman package (suitable for Arch and derivatives)'
        'rpm:RPM package (suitable for Fedora, Suse, Mageia and derivatives)'
    )
    _describe -t commands 'output format' _commands
}

(( $+functions[_holo_build_zsh_comp] )) || _holo_build_zsh_comp()
{
    _arguments -s -S : \
        '--help[Print short usage information.]' \
        '(-V --version)'{-V,--version}'[Print a short version string.]' \
        '(-f --force)'{-f,--force}'[Overwrite target file if it exists]' \
        '--format=[Generate given package format instead of current distribution'\''s default.]: :_holo_build_formats' \
        '(-o --output)'{-o,--output=}'[Path to target file, or "-" for standard input]: :_files' \
        '--suggest-filename[Only print the suggested filename for this package]' \
        '::input file:_files'
    return 0
}

_holo_build_zsh_comp "$@"
