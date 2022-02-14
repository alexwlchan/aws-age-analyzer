#!/usr/bin/env python

import sys
import json

icons = json.load(open('icons.json'))

icons[sys.argv[1]] = open(sys.argv[2]).read()

with open('icons.json', 'w') as outfile:
    outfile.write(json.dumps(icons, indent=2, sort_keys=True))