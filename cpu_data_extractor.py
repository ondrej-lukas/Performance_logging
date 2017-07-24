#Author Ondrej Lukas - lukasond@fel.cvut.cz, ondrej.lukas95@gmail.com
import sys
import re
import numpy as np

def parse_float_from_string(string):
	try:
		f = float(string)
		return f
	except ValueError:
		return None

if __name__ == '__main__':
	#print "Extracting data from:{}".format(sys.argv[1])
	with open(sys.argv[1], 'r') as f:
		counter = 0
		used = []
		for line in f:
			splitl_line =  line.split(" ")
			p = filter(None,map(parse_float_from_string, splitl_line))
			for item in p:
				used.append(p[0])				
		print "Mean: {}".format(np.mean(used))
		print "Min: {}".format(np.amin(used))
		print "25 percentil: {}".format(np.percentile(used,25))
		print "Median: {}".format(np.median(used))
		print "75 percentil: {}".format(np.percentile(used,75))
		print "Max: {}".format(np.amax(used))
