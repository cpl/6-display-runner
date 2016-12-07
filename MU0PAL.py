import sys

HEADER = ';#py'
COMMENT = ';'
END_MARK = HEADER + 'END'
SEQ_MARK = HEADER + 'SEQ'
LNK_MARK = HEADER + 'LNK'

ENB = False
MOD = 0

if __name__ == '__main__':

    if 'lines' in sys.argv:
        count = 0
        with open('alpha.s', 'r') as source:
            for line in source.readlines():
                if not line.startswith(COMMENT) and line.split():
                    print line,
                    count = count + 1
        print 'TOTAL LINES', count

    if 'marker' in sys.argv:
        with open('alpha.s', 'r') as source:
            for i, line in enumerate(source.readlines()):
                if line.startswith(HEADER):
                    print i, line

    if 'generate' in sys.argv:
        with open('pytest.s', 'r') as source:
            for line in source.readlines():
                if line.startswith(END_MARK):
                    ENB = False
                    MOD = 0
                if line.startswith(SEQ_MARK):
                    ENB = True
                    MOD = 1
                if line.startswith(LNK_MARK):
                    ENB = True
                    MOD = 2
