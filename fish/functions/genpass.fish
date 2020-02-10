function genpass
  if count $argv > /dev/null
    pwgen -Bs $argv 1
  else
    pwgen -Bs 20 1
  end
end
