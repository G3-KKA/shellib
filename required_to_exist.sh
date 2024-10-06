#! //bin/sh
#######################################
#G3-KKA shell library#
#######################################
#######################################
# Exits if given file not exist
#
# Arguments:
#   One -- existance of this file will be checked, if it is not exist default message will be printed
#   OR
#   Two or more -- first will be checked as file or, if it is not exist all other arguments will be printed as error mesages before exiting (77)
#   OR
#   Zero - will result in early `return 1`
#     without checking actual file existence
#     message of missused function will be printed
# Usage:
#   required_to_exist ${WORKSPACE}/mario
#   required_to_exist $(pwd)../luigi [FATAL] luigi should be set otherwise mario will be upset!
# Exits (77) if:
#   - ARG_1 does not exist
#######################################
required_to_exist(){
    if [ $# -eq 0 ]; then
        echo "[INFO] required_to_exist called without arguments!"
        return 1 
    fi
    if [ ! -e $1 ]; then
        if [ $# -gt 1 ]; then
            shift 
            for message in "$@" ; do
                echo $message
            done
            exit 77
        fi
        echo "[FATAL] $1 does not exist!"
        exit 77
    fi

    return 0

}