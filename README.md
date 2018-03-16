# rndfibseq
This routine shows the surprising behaviour of a random Fibonacci sequences.
As reported by Divakar Viswanath - "RANDOM FIBONACCI SEQUENCES
AND THE NUMBER 1:13198824..." - in MATHEMATICS OF COMPUTATION, 1999;
69(231): 1131-1155:
"For the familiar Fibonacci sequence (defined by f1 = f2 = 1, and fn = fn1
+ fn2 for n > 2), fn increases exponentially with n at a rate given by the
golden ratio (1 + sqrt(5))/2 = 1:61803398.... But for a simple
modification with both additions and subtractions - the random Fibonacci
sequences defined by t1 = t2 = 1, and for n > 2, tn = ±tn-1 ±tn-2, where
each ± sign is independent and either + or - with probability 1/2 - it is
not even obvious if |tn| should increase with n. Our main result is that:
|tn|^(1/n) -> 1:13198824... as n->Inf 
with probability 1."

Example rndfibseq shows two plots:
the first one is a semilog plot of |ti| and a red dashed line of equation
y=1.13198824^n;
the second one is a plot of |ti|^(1/n) and a red dashed line of equation
y=1.13198824

          Created by Giuseppe Cardillo
          giuseppe.cardillo-edta@poste.it

To cite this file, this would be an appropriate format:
Cardillo G. (2007) Random Fibonacci Sequences: the surprising behaviour
of a random Fibonacci sequences. 
http://www.mathworks.com/matlabcentral/fileexchange/14568

