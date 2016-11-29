
count = 0
with open('alpha.s', 'r') as source:
	for line in source.readlines():
		if not line.startswith(';') and line.split():
			print line
			count = count + 1
print count
