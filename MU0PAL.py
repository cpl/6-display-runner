import sys

if __name__ == '__main__':
    if 'lines' in sys.argv:
        count = 0
        with open('alpha.s', 'r') as source:
            for line in source.readlines():
                if not line.startswith(';') and line.split():
                    print line
                    count = count + 1
        print count
    if 'marker' in sys.argv:
        with open('alpha.s', 'r') as source:
            for i, line in enumerate(source.readlines()):
                if line.startswith(';#pythonmark'):
                    print i, line
