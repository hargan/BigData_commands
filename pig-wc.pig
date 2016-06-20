/*
pig-wc.pig
word count for input folder
*/
A1 = load '/mypig/wordcount/input' as (line:chararray);
A2 = foreach A1 generate TOKENIZE(line) as tokens;
A3 = foreach A2 generate flatten(tokens) as words;
A4 = group A3 by words;
A5 = foreach A4 generate group, COUNT(A3);
A6 = order A5 by $1 desc;
dump A6;
--store A6 into '/mypig/wordcount/output';

