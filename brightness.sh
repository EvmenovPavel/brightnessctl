#! /bin/bash

brightFolder="/sys/class/backlight/amdgpu_bl0/"
currentBright=$(cat $brightFolder"brightness")
maxBright=$(cat $brightFolder"max_brightness")
minBright=$((maxBright / 20))

function fun_status() {
    echo "current_bright: $currentBright"
    echo "max_bright: $maxBright"
    echo "min_bright: $minBright"
}

if [ -z "$1" ]; then
    echo "WAT command?!"
else
    case $1 in
    "status")
        fun_status
        ;;
    *)
        str="$1"
        code="${str:0:1}"
        value="${str:1}"

        if [ "$code" == "+" ] || [ "$code" == "-" ]; then
            if [ "$code" == "+" ]; then
                value=$((currentBright + value))
            elif [ "$code" == "-" ]; then
                value=$((currentBright - value))
            fi

            if (($value > $maxBright)); then
                value=$maxBright
            elif (($value < $minBright)); then
                value=$minBright
            fi

            echo $value | sudo tee $brightFolder"brightness"
        else
            echo "WAT command?!"
        fi
        ;;
    esac
fi
