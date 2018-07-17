#!/usr/bin/env python

from setuptools import setup

setup(
    name='<name>',
    version='<version>',
    url='<url>',
    author='Kyle Fuller',
    author_email='kyle@fuller.li',
    packages=('<package>',),
    install_requires=(),
    entry_points={
        'console_scripts': (
            'cli = module',
        )
    },
)
