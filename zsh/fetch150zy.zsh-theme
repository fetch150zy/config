# Author: fetch150zy

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

local current_dir='${PWD/#$HOME/~}'

YS_VCS_PROMPT_PREFIX1=" %{$fg[magenta]%}\uE0A0%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✗ "
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}✔ "

local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

PROMPT="
%{$terminfo[bold]$fg[blue]%}ζ%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${hg_info}\
${git_info} \
%{$fg[blue]%}☁ %*
%{$terminfo[bold]$fg[brightgreen]%}# %{$reset_color%}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}ζ%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${hg_info}\
${git_info} \
%{$fg[blue]%}☁ %*
%{$terminfo[bold]$fg[brightgreen]%}# %{$reset_color%}"
fi

# ➦ ⚑ ▴ ☁ ⚡ ➜ ➭ ❯ ✗ ➤ ✈ ✱ λ ❯❯❯ ♥  ❮❮❮ ➟ ⬅ ✹ ✘ § ✔
