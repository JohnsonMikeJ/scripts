alias n='nautilus `pwd` &' # open the working dir in nautilus

alias g='git' # as i use git so much

alias e='emacs -nw'
alias v='vim -c start'

alias xc='xclip -selection c' # copy stdin to x clipboard

alias nano='nano -c' # show line numbers

#alias f='find . -name' # quick find
alias f='find | grep' # quick find

alias phplint="find . -name '*.php' -exec php -l {} \; | grep -v 'No syntax errors detected'" # lint all php files in dir

# search wikipedia
function wiki () {
COLUMNS=`tput cols`
dig +short txt "${*}".wp.dg.cx | sed -e 's/" "//g' -e 's/^"//g' -e 's/"$//g' -e 's/ http:/\n\nhttp:/' #| fmt -w $COLU$
}

alias ack='ack-grep' # http://betterthangrep.com/

alias hl='ack --passthru' # highlight

alias myip='/sbin/ifconfig | grep "inet addr" | awk "{print \$2}" | sed s/addr://g | grep -v 127\.0\.0\.1' # get all local ip addresses

# serve current directory on port 8000
alias httpserver='myip && python -m SimpleHTTPServer' 

# see what hosts respond to pings on your /24 network
alias nmap24='nmap -sP `myip`/24 | grep report | awk " { print \$5 } "' 

# make a ssh tunnel from port 2222 on remote host to 22 on your machine
# usage: ssh-tunnel <user@host>
alias ssh-tunnel='ssh -f -N -C -R 2222:127.0.0.1:22'

# quick ref
# sed -i "s/find/replace/g" filename.txt
# find -name '*.txt' -exec sed -i "s/find/replace/g" {} \; -print

#google search
goo () { w3m http://gog.is/"$*"; }

# google text to speech
say(){ mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=en&q=$(echo $* | sed 's#\ #\+#g')" > /dev/null 2>&1 ; }



# go up a number of directories
# usage: cdup == "cd .."; cdup 5 == "cd .." x 5
# from picklepete
cdup() {
  levels=${1-1}
  while ((levels--)); do
        cd ..
  done
}

# old "go up a dir" alias
# alias ..='cd ..' # go up a dir
alias ..='cdup' # go up x dirs
