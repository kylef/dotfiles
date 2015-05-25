function fish_prompt
    if test -n "$SSH_TTY"
        set_color FF69B4
    else
        set_color $fish_color_cwd
    end

    echo -n '$ '
    set_color normal
end

