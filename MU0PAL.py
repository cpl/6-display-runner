#!/usr/bin/python

import random
import sys

OUTPUT = []  # Store lines from given file and rewrite initial file.

HEADER = ';#py'             # Python marker HEADER
COMMENT = ';'               # Assembly comment
END_MARK = HEADER + 'END'   # END any start tag
SEQ_MARK = HEADER + 'SEQ'   # SEQ start SEQUENCE writing
LNK_MARK = HEADER + 'LNK'   # LNK start LINKING the SEQUENCE

NEW_LINE = '\n'             # New line char

SEQ_MAX = 6                 # The number of SEQUENCES
ENB = False                 # Enable write/read lines

POSITIONS = {0: 'top', 1: 'mid', 2: 'bot'}


def random_position():
    return POSITIONS[random.randrange(0, 3)]


def make_sequence():
    for i in range(SEQ_MAX):
        OUTPUT.append('car' + str(i+1) + NEW_LINE)
        OUTPUT.append('LDA ' + random_position() + NEW_LINE)
        OUTPUT.append('STA dp0' + NEW_LINE)
        OUTPUT.append('JMP nsq' + NEW_LINE)


def make_linking():
    for i in range(SEQ_MAX):
        OUTPUT.append('JMP car' + str(i+1) + NEW_LINE)


if __name__ == '__main__':

    ''' Take any .s file and return a light version with
        no comments, empty lines, etc...
    '''
    if 'light' in sys.argv:
        with open('alpha.s', 'r') as source:
            for line in source.readlines():
                if not line.startswith(COMMENT) and line.split():
                    for j, c in enumerate(line):
                        if c == COMMENT:
                            print line[0:j]
                            break

    ''' Return the positions of all Python markers '''
    if 'marker' in sys.argv:
        with open('pytest.s', 'r') as source:
            for i, line in enumerate(source.readlines()):
                if line.startswith(HEADER):
                    print i, line

    ''' Clear the SEQ and LNK blocks from the given file '''
    if 'clear' in sys.argv:
        with open('pytest.s', 'r') as source:
            for i, line in enumerate(source.readlines()):
                if line.startswith(END_MARK):
                    ENB = False

                if not ENB:
                    OUTPUT.append(line)

                if line.startswith(SEQ_MARK):
                    ENB = True

                if line.startswith(LNK_MARK):
                    ENB = True

        with open('pytest.s', 'w') as rewrite:
            rewrite.writelines(OUTPUT)

    if 'sequence' in sys.argv:
        with open('pytest.s', 'r') as source:
            for i, line in enumerate(source.readlines()):
                if line.startswith(END_MARK):
                    ENB = False

                if not ENB:
                    OUTPUT.append(line)

                if line.startswith(SEQ_MARK):
                    ENB = True
                    make_sequence()

                if line.startswith(LNK_MARK):
                    ENB = True
                    make_linking()

        with open('pytest.s', 'w') as rewrite:
            rewrite.writelines(OUTPUT)
