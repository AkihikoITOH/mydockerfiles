#!/bin/python
# -*- coding: utf-8 -*-

# Dockerfile.base内の'INCLUDE'記述を、実際のコンポーネントに置き換えてDockerfileを生成するスクリプト

import os
import sys

if __name__=="__main__":
    argvs = sys.argv

    cwd = os.path.abspath(os.path.dirname(__file__))
    dockerfile_base = os.path.join(cwd, argvs[1].strip())
    dockerfile =  os.path.join(cwd, "Dockerfile")

    str_dockerfile = ""

    with open(dockerfile_base, "r") as f:
        line = f.readline()
        while line:
            if line.startswith("INCLUDE"):
                sys.stdout.write("%s included.\n" % line.split(" ")[1].strip())
                dockerfile_partial =  open(os.path.join(cwd, line.split(" ")[1].strip()), "r")
                str_dockerfile += dockerfile_partial.read()
            else:
                str_dockerfile += "%s\n" % line.strip()

            line = f.readline()

    with open(dockerfile, "w") as f:
        f.write(str_dockerfile)

    sys.stdout.write("Concatenated into %s\n" % dockerfile)

