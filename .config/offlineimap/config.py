#!/usr/bin/env python3

import sys
import subprocess


def get_op_item(item, field):
    return subprocess.check_output(
        ['op', 'get', 'item', item, '--fields', field]
    ).decode('utf-8')


def get_op_username(item):
    return get_op_item(item, 'username')


def get_op_password(item):
    return get_op_item(item, 'password')
