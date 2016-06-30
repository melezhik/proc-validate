pid_file=$(config pid_file)

if test "${pid_file}"; then
  echo pid_file - $pid_file
else
  echo need pid file
  exit 1
fi


if test -f $pid_file; then
  echo pid file exists
else
  echo pid file does not exist
  exit 1
fi
