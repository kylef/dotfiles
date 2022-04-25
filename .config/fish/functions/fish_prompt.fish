function fish_prompt
    if test -n "$REGION"
        set_color FF69B4
        echo -n "[$REGION] "
    end

    if not test $status -eq 0
        set_color $fish_color_error
    else if test -n "$SSH_TTY"
        set_color FF69B4
    else
        set_color $fish_color_cwd
    end

    echo -n '$ '
    set_color normal
end

