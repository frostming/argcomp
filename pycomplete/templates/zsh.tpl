#compdef %{script_name}

%{function}()
{
    local state com cur

    cur=${words[${#words[@]}]}

    # lookup for command
    for word in ${words[@]:1}; do
        if [[ $word != -* ]]; then
            com=$word
            break
        fi
    done

    if [[ ${cur} == --* ]]; then
        state="option"
        opts=(%{opts})
    elif [[ $cur == $com ]]; then
        state="command"
        coms=(%{coms})
    fi

    case $state in
        (command)
            _describe 'command' coms
        ;;
        (option)
            case "$com" in

%{command_list}

            esac

            _describe 'option' opts
        ;;
        *)
            # fallback to file completion
            _arguments '*:file:_files'
    esac
}

%{function} "$@"
%{compdefs}
