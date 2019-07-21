#!/usr/bin/env python3

import sys, struct

with open(sys.argv[1], 'rb') as fp:
    data = fp.read()
    data = struct.pack('<I', len(data)) + data
    s = "\""
    for c in data:
        s += "\\x"
        s += hex(c)[2:]
    s += "\""
    print(s)
