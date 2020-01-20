function mpw_sites
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l green (set_color -o green)
    set -l normal (set_color normal)
    cat $HOME/.mpw.d/$MPW_FULLNAME.mpsites.json | jq  -r '.sites | keys[] as $k |  "\($k) \t counter=\(.[$k].counter) type=\(.[$k].type)"' | 
        sed "s/counter=/$yellow/" | 
        sed "s/type=16/$red x$normal/" |
        sed "s/type=20/$green b$normal/" 

   
end

