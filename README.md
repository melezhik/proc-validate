# SYNOPSIS

Simple Linux/UNIX process validator.

Check if process set by PID taken from pid file exists.


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


# Advanced usage

Sometimes you need to verify that process data taken from `ps`  matches some 
regular expression, use footprint parameter for this:

    $ sparrow plg run proc-validate --param pid_file=/var/run/nginx --param footprint='nginx.*master'

Or via sparrowdo:


    task_run  %(
      task => 'check my process,
      plugin => 'proc-validate',
      parameters => %(
        pid_file => '/var/run/nginx.pid',
        footprint => 'nginx.*master'
      )
    );


# Sample output


    /tmp/.outthentic/31667/home/vagrant/my/proc-validate/story.t ..
    # [/home/vagrant/my/proc-validate]
    # pid_file - /var/run/nginx.pid
    # pid file exists
    # pid:31645
    # process footprint: 31645 nginx: master process /usr/       00:03
    ok 1 - output match /pid_file - \S+/
    ok 2 - output match 'pid file exists'
    ok 3 - output match /pid:\d+/
    ok 4 - output match /process footprint:/
    ok 5 - 'process footprint: 31645 nginx: master process /usr/       00:03' match /nginx.*master/
    1..5
    ok
    All tests successful.
    Files=1, Tests=5,  0 wallclock secs ( 0.02 usr  0.00 sys +  0.11 cusr  0.01 csys =  0.14 CPU)
    Result: PASS
        
# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
