# SYNOPSIS

Simple Linux/UNIX process validator


# INSTALL

    $ sparrow plg install proc-validate


# USAGE

## Manually

    $ sparrow plg run proc-validate --param pid_file=/var/run/nginx

## Via Sparrowdo

    $ cat sparrowfile

    use v6;
    
    use Sparrowdo;
    
    task_run  %(
      task => 'check my process,
      plugin => 'proc-validate',
      parameters => %(
        pid_file => '/var/run/foo.pid'
      )
    );


    
# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
