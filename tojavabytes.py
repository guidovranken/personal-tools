#!/usr/bin/env python

import sys
import re
import random

COLUMN_SIZE = 8
def toJavaBytes(data):
    out = ""
    out += "byte[] payload = {\n"
    j = COLUMN_SIZE
    if j <= len(data) + COLUMN_SIZE - 1:
        while True:
            out += "    "
            out += ",".join(["(byte)0x{:02X}".format(ord(c)) for c in data[j-COLUMN_SIZE:j]])
            out += ",\n"
            j += COLUMN_SIZE
            if j > len(data) + COLUMN_SIZE - 1:
                break
    out += "};"
    numcommas = out.count(',')
    if numcommas != len(data):
        print numcommas, len(data)
        print out
        exit()
    return out
with open(sys.argv[1], 'rb') as fp:
    data = fp.read()
    print toJavaBytes(data)

# test
#while True:
#    data = [chr(random.randint(0, 255))for c in xrange(random.randint(0, 20))]
#    toJavaBytes(data)
