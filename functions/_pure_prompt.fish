function _pure_prompt \
    --description 'Print prompt symbol' \
    --argument-names exit_code \
    --argument-names last_pipestatus

    set --local jobs (_pure_prompt_jobs)
    set --local virtualenv (_pure_prompt_virtualenv) # Python virtualenv name
    set --local vimode_indicator (_pure_prompt_vimode) # vi-mode indicator
    set --local pure_symbol (_pure_prompt_symbol $exit_code "$last_pipestatus")

    echo (_pure_print_prompt $jobs $virtualenv $vimode_indicator $pure_symbol)
end
