#!/usr/bin/env python3
import subprocess
import math

# global vals
banks = 0x80

# Modified from https://github.com/pret/poketcg/blob/master/tools/progress.py

def reportINCROMs(incromDir):
	grepProc = subprocess.Popen(['grep', '-wr', 'dr', incromDir], stdout=subprocess.PIPE)
	targetLines = grepProc.communicate()[0].decode().split('\n')
	totalBytes = banks * 0x4000
	incromBytes = [0]*banks
	incromByteTotal = 0
	for line in targetLines:
		line = line.lower() # ignore case

		# ignore the actual definition of the macro
		if 'macro' in line:
			continue

		# ignore anything in tools
		if '/tools/' in line:
			continue

		# ignore anything in git
		if '/.git/' in line:
			continue

		# ignore binary files in case swp's exist
		if 'binary file' in line:
			continue

		# find the last two hex location values
		splitLine = line.split("$")

		# not sure what the line is, but it's not working so skip
		if len(splitLine) < 3:
			continue

		incEnd = int(splitLine[-1],16)
		incStart = int(splitLine[-2].split(",",1)[0],16)
		incBank = math.floor(incStart / 0x4000)
		diff = incEnd - incStart
		incromBytes[incBank] += diff
		incromByteTotal += diff

	percentage = ((totalBytes - incromByteTotal) / totalBytes) * 100
	print("Total: %d bytes included (%.2f%% complete)" % (incromByteTotal, percentage))
	print("Included bytes: ")
	for i in range(0, banks):
		if incromBytes[i] == 0:
			continue

		bankName= "bank" + format(i,"02x") + ": "
		if i == 0:
			bankName = "home:   "
		bytesString = str(incromBytes[i])
		formattingStrings = " " *(8-len(bytesString)) 
		print(bankName + bytesString + formattingStrings + "bytes")

reportINCROMs("../")
