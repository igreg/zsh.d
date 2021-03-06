if [ ! -f /usr/bin/ssh-copy-id ]; then
  function ssh-copy-id {
    ID_FILE="${HOME}/.ssh/id_rsa.pub"

    if [ "-i" = "$1" ]; then
      shift
      # check if we have 2 parameters left, if so the first is the new ID file
      if [ -n "$2" ]; then
        if expr "$1" : ".*\.pub" ; then
          ID_FILE="$1"
        else
          ID_FILE="$1.pub"
        fi
        shift         # and this should leave $1 as the target name
      fi
    else
      if [ x$SSH_AUTH_SOCK != x ] ; then
        GET_ID="$GET_ID ssh-add -L"
      fi
    fi

    if [ -z "`eval $GET_ID`" ] && [ -r "${ID_FILE}" ] ; then
      GET_ID="cat ${ID_FILE}"
    fi

    if [ -z "`eval $GET_ID`" ]; then
      echo "$0: ERROR: No identities found" >&2
      return 1
    fi

    if [ "$#" -lt 1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
      echo "Usage: $0 [-i [identity_file]] [user@]machine" >&2
      return 1
    fi

    { eval "$GET_ID" ; } | ssh $1 "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys" || exit 1

    echo Now try logging into the machine, with "ssh '$1'", and check in:
    echo
    echo  .ssh/authorized_keys
    echo
    echo to make sure we haven't added extra keys that you weren't expecting.
  }
fi

alias rssh=/usr/bin/ssh

function ssh {
  local title="$1"
  echo -ne "\e]1;$title\a"
  rssh -o "StrictHostKeyChecking no" -F ~/.zsh.d/config/ssh $*
}
