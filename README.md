shell_stuff
===========

bash_aliases
-------------

This file will modify your currently existing cd to detect whether the pwd is a child directory within a Python VirtualEnv directory. If so, it will activate the virtualenv, switching the paths for python, pip, and easy_install.

### Installation:

1. cat bash_aliases >> ~/.bash_aliases
2. In ~/.bashrc, add:

    > source ~/.bash_aliases
3. In ~/.bash_profile, add:

    > if [ -f ~/.bashrc ]; then
    
    >     source ~/.bashrc
    
    > fi