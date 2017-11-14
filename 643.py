import math
import numpy as np

T = 1000
N = 10000
P = 0.5
S = 0.1
A = []
R = 0.0
Cn = 0.0

for k in range(0,T):
	C = 1.0
	X = np.random.binomial(1,P,size=N)
	for i in range(3,N):
		Pn = np.mean(X[:i])
		#In = math.sqrt(math.log(2/S)/(2*i)) #a)		
		#In = math.sqrt((math.log(i*(i+1))+math.log(2/S))/(2*i)) #b)
		In = math.sqrt((math.log(math.log(i))+math.log(2/S))/(2*i)) #c)
		Lo = Pn-In
		Hi = Pn+In
		print(Lo, Hi)
		if abs(Pn-P) > In:
			C = 0.0
			break
	Cn = Cn+C
	#A.append(C/i)
print "Count: %.4f" % (Cn)
print "Proportion: %.4f" % (Cn/T)
#print "Max.Proportion: %.4f" % (max(A))
#print "Min.Proportion: %.4f" % (min(A))
#print "Avg.Proportion: %.4f" % (sum(A)/len(A))
#print "Len.of A: %.4f" % (len(A))
#print "Number of times (out of %i) all intervals contained P=1/2: %i" % (T,R)
#print "Proportion: %.4f" % (R/T)
