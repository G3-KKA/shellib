#! //bin/sh


#######################################
##       G3-KKA shell library        ##
## https://github.com/G3-KKA/shellib ##
#######################################
# Check that argument(s) are set  
# Arguments:
#   One or more ENV variables -- all will be checked
#   OR
#   Zero -- will result in early `return 1`
#     without checking actual range of command line args
#     message of missused function will be printed
# Usage:
#    
#   required_to_be_set REDIS_ADDRESS
#
# Description:
#   Call once on every required ENV variable
#   This way you do not need to write multiple if [[]] fi on every ENV
#   ! Downside: prints defult message if ENV is not set
#   Which is not enough verbose in some cases 
#
# Exits (45) if:
#   One of ENV variables is not set
#######################################
required_to_be_set() {
    if [ $# -eq 0 ]; then
        echo "[INFO] required_to_be_set called without arguments-env to check!"
        return 1 
    fi

    if [  -z "${!1}"  ]; then
        if [ $# -gt 1 ]; then
            shift 
            for message in "$@" ; do
                echo $message
            done
            exit 45
        fi
        echo "[FATAL] $1 not set!"
        exit 45
    fi
}