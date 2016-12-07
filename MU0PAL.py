#!/usr/bin/python

import sys

OUTPUT = []

HEADER = ';#py'
COMMENT = ';'
END_MARK = HEADER + 'END'
SEQ_MARK = HEADER + 'SEQ'
LNK_MARK = HEADER + 'LNK'

ENB = False
MOD = 0

if __name__ == '__main__':

    if 'light' in sys.argv:
        with open('alpha.s', 'r') as source:
            for line in source.readlines():
                if not line.startswith(COMMENT) and line.split():
                    for j, c in enumerate(line):
                        if c == ';':
                            print line[0:j]
                            break

    if 'marker' in sys.argv:
        with open('pytest.s', 'r') as source:
            for i, line in enumerate(source.readlines()):
                if line.startswith(HEADER):
                    print i, line

    if 'clear' in sys.argv:
        with open('pytest.s', 'r') as source:
            for i, line in enumerate(source.readlines()):
                if line.startswith(END_MARK):
                    print i, line,
                    ENB = False
                    MOD = 0

                if not ENB:
                    OUTPUT.append(line)

                if line.startswith(SEQ_MARK):
                    print i, line,
                    ENB = True
                    MOD = 1

                if line.startswith(LNK_MARK):
                    print i, line,
                    ENB = True
                    MOD = 2

        with open('pytest.s', 'w') as rewrite:
            rewrite.writelines(OUTPUT)
