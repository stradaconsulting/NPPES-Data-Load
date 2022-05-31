import csv, sys

# This script filters a csv file by the value in a specified column.
# The output file does not quote columns and uses the pipe delimiter.
# Command line as follows:
# python CleanCSV.py <input file name> <output file name> <col number> <filter value>
# The purpose of this script is to change the input CSV file into a pipe-delimited file. The
# issue is that the data may contain pipe characters and this script does not take that into 
# account. There are also issues with the unknown characters due to an unknown character set 
# provided  in the file.  All character sets were tested and they all threw errors. Instead 
# the open() command has an ignore errors parameter passed and this works fine. The character
# set issue will be addressed later.

# This is a general purpose file and the interim file that gets creatd with the stripped
# piped characters will be named temp_transformed.csv


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
intermediatefile = ".\data\\temp_transformed.csv"  #need to use \\t to avoid interpretation as a special character

print("Input File :", inputfile)
print("Intermediate File:", intermediatefile)
print("Output File:", outputfile)


print("Transorming Input file to Intermediate...")
#replace pipe characters in source file with spaces since we use pipe as a delimiter
#by reading inputfile and writing into intermediatefile
fin = open(inputfile, 'r', errors='ignore')
fout = open(intermediatefile,"wt")
for line in fin:
   readcount += 1
   writecount += 1
   fout.write(line.replace('|',' '))
   if readcount % 100000 == 0:
      print("Records read:   ", readcount, "\nRecords written:", writecount)
fin.close()
fout.close()  


print("Tranfsorming Intermediate File to Output...")
#transform CSV file into file with no header row and delimited by pipe character
#by reading intermediate file and writing into outputfile
writecount, readcount, fldnum = 0, 0, 0  #reinitialize since we used it in the for loop above
with open(intermediatefile, errors="ignore", mode='r') as csvinfile, \
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
