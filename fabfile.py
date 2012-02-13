import os
from tempfile import mkdtemp

from subprocess import Popen, PIPE

from fabric.api import *
from fabric.contrib.files import exists
from fabric.contrib.project import rsync_project

class tempdir:
    def __enter__(self):
        self.dir = mkdtemp()
        return self.dir

    def __exit__(self, type, value, traceback):
        local('rm -r %s' % self.dir)
        pass

@task
def sync():
    with tempdir() as d:
        local('git checkout-index --all --prefix=%s/' % d)

        # Loop over the submodules and check them out also
        modules = Popen("git submodule --quiet foreach 'pwd'", shell=True, stdout=PIPE).stdout.read().splitlines()

        for module in modules:
            relpath = os.path.relpath(module)
            local('cd %s && git checkout-index --all --prefix=%s/' % (module, os.path.join(d, relpath)))

        # Build a manifest so we can delete everything later

        # We don't want to include files including "authorized" in them in our
        # manifest. The reason for this is so we dont lock ourselfs out when
        # we delete a ssh authorized_keys
        local('cd %s && find . -type f | grep -v authorized > .MANIFEST' % d)

        reset()

        rsync_project(remote_dir='~', local_dir=(d + '/'))

@task
def reset():
    """
    Delete everything in our MANIFEST file
    """

    if exists('~/.MANIFEST'):
        run('xargs rm < ~/.MANIFEST')

