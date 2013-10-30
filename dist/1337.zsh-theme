PROMPT='%{$fg[red]%}‹$(~/.rvm/bin/rvm-prompt v)›%{$reset_color%} %m:%{$fg[blue]%}%(!.%1~.%~)$(git_prompt_info) %{${fg[default]}%}%(!.#.❯)%{$reset_color%} '

PROMPT='%{$reset_color%}%m:%{$fg[blue]%}%(!.%1~.%~)$(git_prompt_info) %{${fg[default]}%}%(!.#.❯)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{${fg[default]}%}|%{${fg[red]}%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
