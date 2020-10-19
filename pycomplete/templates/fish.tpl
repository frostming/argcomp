function __fish%{function}_no_subcommand
    for i in (commandline -opc)
        if contains -- $i %{cmds_names}
            return 1
        end
    end
    return 0
end

# global options
%{opts}

# commands
%{cmds}

# command options

%{cmds_opts}
