import csv, sys

# This script filters a csv file by the value in a specified column.
# The output file does not quote columns and uses the pipe delimiter.
# Command line as follows:
# python CleanCSV.py <input file name> <output file name> <col number> <filter value>
# The purpose of this script is to change the CSV into a pipe-delimited file. The issue is
# that the data may contain pipe characters and this script does not take that into account.
# There are also issues with the unknown characters due to an unknown character set provided 
# in the file.  All character sets were tested and they all threw errors. Instead the open() 
# command has an ignore errors parameter passed and this works fine.


inputfile, outputfile = sys.argv[1], sys.argv[2]
if len(sys.argv) > 3:
	filtercol=(int) (sys.argv[3])
	filterval=sys.argv[4]
	filter=True
else:
	filtercol = 0
	filterval = '*'
	filter = False

writecount, readcount, fldnum = 0, 0, 0

print("Input File :", inputfile)
print("Output File:", outputfile)

#replace pipe characters in source file with spaces since we use pipe as a delimiter
fin = open(inputfile, 'r', errors='ignore')
fout = open("temp.csv","wt")
for line in fin:
   fout.write(line.replace('|',' '))
fin.close()
fout.close()  

inputfile="temp.csv"
print("Input File :", inputfile)

with open(inputfile, errors="ignore", mode='r') as csvinfile, \
	 open(outputfile, mode='w', newline='') as csvoutfile:
	datawriter = csv.writer(csvoutfile, delimiter='|', quoting=csv.QUOTE_NONE, escapechar='\\')
	datareader = csv.reader(csvinfile)
	for row in datareader:
		readcount += 1
		if readcount == 1: # skip the header record
			continue
		elif readcount % 100000 == 0:
			print("Records read:   ", readcount, "\nRecords written:", writecount)
		elif filter: 
			if (row[filtercol] == filterval):
				datawriter.writerow(row)
				writecount += 1
		else:
			datawriter.writerow(row)
			writecount += 1

print("Records read:   ", readcount, "\nRecords written:", writecount)
