#!/usr/bin/env python3

import sys, struct, os, os.path

def process_one(fn):
    with open(fn, 'rb') as fp:
        data = fp.read()
        data = struct.pack('<I', len(data)) + data
        s = "\""
        for c in data:
            s += "\\x"
            s += hex(c)[2:].zfill(2)
        s += "\""
        print(s)

infile = sys.argv[1]
if os.path.isdir(infile):
    files = [f for f in os.listdir(infile)]
    for fn in files:
        process_one(os.path.join(infile, fn))
else:
    process_one(infile)
