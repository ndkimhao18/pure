function _pure_pipestatus_with_signal --description "Print arguments from \$pipestatus replacing values with signal names where appropriate"
    for pstat in $argv
        _pure_status_to_signal $pstat
    end
end
