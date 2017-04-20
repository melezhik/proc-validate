pid_file=$(config pid_file)

#if test "${pid_file}"; then
#  echo pid_file - $pid_file
#else
#  echo need pid file
#  exit 1
#fi


if test "${pid_file}"; then
  echo check by pid file
  if test -f $pid_file; then
    echo -n pid found at $pid_file:; cat $pid_file
    ps ho pid,cmd,etime -p `cat $pid_file`
  else
    echo pid file $pid_file does not exist
  fi
else
  ps ho pid,cmd,etime
fi


