setxkbmap -layout us,ua -model pc105 -option grp:win_space_toggle
setxkbmap -option caps:ctrl_modifier
export XZ_OPT="-9 --threads=0"
#setxkbmap -layout "us,ua,ru"
#setxkbmap -option grp:win_space_toggle
export GO111MODULE=on


if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
    export QT_QPA_PLATFORMTHEME="qt5ct"
    #export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/
fi


export PYTHONDONTWRITEBYTECODE=y
#export TERM=terminator
export TERMINAL="terminator -x"
export DOWNGRADE_FROM_ALA=1
alias xclipb='xclip -selection clipboard'
alias xclipb='xclip -selection clipboard'

