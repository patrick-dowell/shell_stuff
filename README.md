shell_stuff
===========

virtualenv_cd_alias
-------------

This file will modify your currently existing cd to detect whether the pwd is a child directory within a Python VirtualEnv directory. If so, it will activate the virtualenv, switching the paths for python, pip, and easy_install, similar to how RVM works with .rvmrc files. Inspired by this blog post: http://thadeusb.com/weblog/2011/8/17/manage_python_virtualenv.

### Installation:

1. `cat virtualenv_cd_alias >> ~/.bash_aliases`
2. In ~/.bashrc, add:

        source ~/.bash_aliases
3. In ~/.bash_profile, add:

        if [ -f ~/.bashrc ]; then
             source ~/.bashrc
        fi
4. Restart your bash shell.
5. `cd /path/to/your/virtualenv/`