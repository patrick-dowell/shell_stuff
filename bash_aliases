activator_suffix="bin/activate"

# Searches entire pwd for activate.sh
function activate_global_cd {
    ROOT="$PWD"
	package=$(echo $PWD | awk '{n = split($0,a,"/"); print n }')
    for (( $package; package>0; package-- ))
    do
        activator="${ROOT}/$activator_suffix"
		python_binary="${ROOT}/bin/python"
	
        if [ -f "$activator" ]
        then
            if [ -f "$python_binary" ]
            then 
                echo "sourcing $activator"
                source "$activator"
            fi
        fi
		ROOT="$ROOT/.."
    done
    
}

# Searches only the arguments directories for activate.sh
function activate_cd {
    found=0
	
    ROOT="$PWD"
	package=$(echo $PWD | awk '{n = split($0,a,"/"); print n }')
    for (( $package; package>0; package-- ))
    do
        activator="${ROOT}/$activator_suffix"
		python_binary="${ROOT}/bin/python"
	
        if [ -f "$activator" ]
        then
            if [ -f "$python_binary" ]
            then 
                found=1
            fi
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
        activator="${ROOT}/$activator_suffix"
		python_binary="${ROOT}/bin/python"
	
        if [ -f "$activator" ]
        then
            if [ -f "$python_binary" ]
            then 
                echo "sourcing $activator"
                source "$activator"
                found2=1
            fi
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
