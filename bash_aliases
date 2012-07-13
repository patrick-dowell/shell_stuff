activator="activate.sh"

# Searches entire pwd for activate.sh
function activate_global_cd {
    # Change IFS temporarily for iterating through directories
    OLD_IFS="$IFS"
    IFS="/"

    ROOT=""

    # Actually change directory
    cd "$1"

    _dfiles="`pwd`"

    for token in $_dfiles
    do
        ROOT="$ROOT$token/"
        activator="${ROOT}activate.sh"

        if [ -f "$activator" ]
        then
            echo "sourcing $activator"
            source "$activator"
        fi
    done

    # Restore IFS to its original state
    IFS="$OLD_IFS"
}

# Searches only the arguments directories for activate.sh
function activate_cd {
    found=0
	
    ROOT="$PWD"
	package=$(echo $PWD | awk '{n = split($0,a,"/"); print n }')
    for (( $package; package>0; package-- ))
    do
        activator="${ROOT}/activate.sh"

        if [ -f "$activator" ]
        then
            found=1
        fi
		ROOT="$ROOT/.."
    done
 	

    # Actually change directory
    cd "$1"

    found2=0
	
    ROOT="$PWD"
	package=$(echo $PWD | awk '{n = split($0,a,"/"); print n }')
    for (( $package; package>0; package-- ))
    do
        activator="${ROOT}/activate.sh"

        if [ -f "$activator" ]
        then
            echo "sourcing $activator"
            source "$activator"
            found2=1
        fi
		ROOT="$ROOT/.."
    done

    if [[ $found -eq 1 && $found2 -eq 0 ]];then
		deactivate
    fi

}

alias cd='activate_cd'

# Always do a global search when starting a new terminal instance.
activate_global_cd
