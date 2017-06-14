. @out@/etc/profile

shopt -s cdspell checkwinsize cmdhist dotglob extglob histappend nocaseglob

set -o notify
set -o noclobber
set -o ignoreeof

shopt -u mailwarn

# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify

export SHELL_SESSION_HISTORY=0

# if [ -z "$INSIDE_EMACS" ] || [ "$EMACS_BASH_COMPLETE" = "t" ]; then
#     # Check whether we're running a version of Bash that has support for
#     # programmable completion. If we do, enable all modules installed in
#     # the system (and user profile).
#     if shopt -q progcomp &>/dev/null; then
#       nullglobStatus=$(shopt -p nullglob)
#       shopt -s nullglob
#       for m in "@out@/etc/bash_completion.d/"* "@out@/share/bash-completion/completions/"*; do
#             . $m
#       done
#       eval "$nullglobStatus"
#       unset nullglobStatus p m
#     fi
# fi

# prompt
BLUE="\[$(/usr/bin/tput setaf 4)\]"
RESET="\[$(/usr/bin/tput sgr0)\]"
export PS1="${BLUE}\w $ ${RESET}"
