function _pure_prompt_symbol \
    --description 'Print prompt symbol' \
    --argument-names exit_code \
    --argument-names last_pipestatus

    set --local prompt_symbol (_pure_get_prompt_symbol)
    set --local symbol_color_success (_pure_set_color $pure_color_prompt_on_success)
    set --local symbol_color_error (_pure_set_color $pure_color_prompt_on_error)
    set --local command_succeed 0

    set --local symbol_color $symbol_color_success # default pure symbol color
    if test $exit_code -ne $command_succeed
        set symbol_color $symbol_color_error # different pure symbol color when previous command failed

        if test "$pure_separate_prompt_on_error" = true
            set symbol_color "$symbol_color_error$prompt_symbol$symbol_color_success"
        end
    end

    set --local prompt_status (_pure_print_pipestatus $exit_code "[" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) (string split ' ' "$last_pipestatus"))

    echo "$prompt_status$symbol_color$prompt_symbol"
end
