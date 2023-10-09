#!/usr/bin/env python3

from facefusion import core
import os
if __name__ == '__main__':
    os.system('export GRADIO_SERVER_NAME=0.0.0.0')
    core.cli()
    