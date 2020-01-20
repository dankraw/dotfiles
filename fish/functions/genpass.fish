function genpass
  if count $argv > /dev/null
    pwgen -Bs $argv 1 | pbcopy
  else
    pwgen -Bs 20 1 | pbcopy
  end
end
