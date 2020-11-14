# https://github.com/blinks zsh theme modified

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

function prompt_jobs() {
	local jobs=$(jobs -l | wc -l)
	for i in $(seq 0 $jobs); do
		echo -n ">"
	done
}

DIRTY="%{%F{red}%}✗%{%f%k%b%}"
CLEAN="%{%F{green}%}✔︎%{%f%k%b%}"

ZSH_THEME_GIT_PROMPT_PREFIX="[%{%B%F{white}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%B%F{white}%}] ${DIRTY}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%B%F{white}%}] ${CLEAN}"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE=${CLEAN}
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=${DIRTY}
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=${DIRTY}
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=${DIRTY}

PROMPT='%{%B%F{red}%K{${bkg}}%}$(hostname) %{%B%F{yellow}%K{${bkg}}%}$(prompt_jobs) %{%B%F{blue}%K{${bkg}}%}%~ %{%B%F{white}%}$(git_prompt_info) $(git_remote_status)%{%B%F{darkgrey}%K{${bkg}}%} %E%{%f%k%b%}
%(?.%B%F{white}.%B%F{red})#%{%f%k%b%} '

RPROMPT='!%!%{%f%k%b%}'
