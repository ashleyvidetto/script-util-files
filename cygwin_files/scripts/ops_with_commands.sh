#!/bin/sh
# POSIX

die() {
    printf '%s\n' "$1" >&2
    exit 1
}

# Initialize all the option variables.
# This ensures we are not contaminated by variables from the environment.
env=test
build_ui=false

while :; do
    case $1 in
        -u|-\?|--ui)
            build_ui=true    # Rebuild the existing UI
            exit
            ;;
        -e|--env)       # use the environment listed
            if [ "$2" ]; then
                env=$2
                shift
            else
                die 'ERROR: "--env" requires a non-empty option argument.'
            fi
			;;
        --)              # End of all options.
            shift
            break
            ;;
        -?*)
            printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
            ;;
        *)               # Default case: No more options, so break out of the loop.
            break
    esac

    shift
done

# if --env was provided list it
if [ "$env" ]; then
    echo "Using the environment: $env" 
else
    echo "No env given."
fi

if [ "$build_ui" = true ] ; then
    echo 'build_ui is true'
else
	echo "build_ui is false"
fi
