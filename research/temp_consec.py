def irange(start, stop, step=1):            # This is an inclusive range function, so that I don't have to remember
    if step == 1:                           # that range() leaves out the last value. 
        return range(start, stop+1)         #
    elif step < 0:                          #
        return range(start, stop-1, step)   #
    else:                                   #
        return range(start, stop+1, step)   #

def indeces(somelist):              #returns a list of numbers from 0 to len(somelist), so I can easily iterate with
    return range(len(somelist))     #  reference to the index of each element in the list

def numlen(somenumber):
    return len(str(somenumber))     #returns the number of characters in a number, for formatting purposes

def nicestring(stringinput):
    stringinput=stringinput.lower() #puts the string in all lowercase
    stringinput=stringinput.strip() #removes whitespace from the string
    stringinput=stringinput.translate(None, string.punctuation) #removes all punctuation from the string
    return stringinput

import matplotlib.pyplot as plt          # this is the
                                         # plot library
    
import numpy as np                       # not strictly necessary
                                         # but useful
    
from IPython.display import Latex
    
#import scipy, scipy.special, scipy.stats
    
#%matplotlib inline                       
                                         # displays plots in the notebook
                                         # instead of popup windows
import math

import random

human_readable=True

primes=[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349]

p=2
p_i=0

print "p, \tq, \tconsecutive primes count"
if human_readable==False: print "[",

while True:
    #=============================SETTINGS===========================
    #p=7          #By convention, we choose p to be the smaller prime
    q=71
    maxpower=1000   #Maximum value of alpha and beta
    #================================================================
    #
    a=[]
    for i in irange(0,maxpower):        #Evaluates the elements of {a_n}
        for j in irange(0,maxpower):    #
            a.append((p**i*q**j,i,j))   #
    a.sort(key=lambda tup: tup[0])      #Sorts {a_n} in increasing order
    #
    #print a        #uncomment to debug
    #
    orderplot_a=[]                         #Strips out only the values of alpha and beta from the above list, in 
    for i in a:                            # preparation for plotting.
        orderplot_a.append((i[1],i[2]))    #
    #   
    #print orderplot_a         #uncomment to debug                   
    #
    plotting = 'off'
    #
    if plotting == 'on' and maxpower<=25: #If maxpower > 25, the figure is illegible, so it is disabled.
        plt.plot(zip(*orderplot_a)[0],zip(*orderplot_a)[1]);  #
        fig=plt.gcf()                                         #Plots the figure. The line connects the powers corres-
        fig.set_size_inches(5,5)                              #ponding to elements of {a_n} in sequence.   
        ax=fig.add_subplot(111)                               # 
        ax.set_xlabel('alpha')                                #
        ax.set_ylabel('beta');                                #
    #
    #zip(*orderplot_a)        #uncomment to debug
    #
    #A Critical Pair is a pair of terms in {a_n} where one is a power of p, and the other is a power of q.
    # This part finds all the critical pairs which have been calculated, and adds the to the list 'critical_pairs'.
    critical_pairs=[]
    for i in indeces(orderplot_a):
        if (orderplot_a[i][0]==0 or orderplot_a[i][1]==0) and not (orderplot_a[i][0]==0 and orderplot_a[i][1]==0):
            if orderplot_a[i+1][0]==0 or orderplot_a[i+1][1]==0:
                critical_pairs.append((orderplot_a[i],orderplot_a[i+1]))
    #
    if human_readable==True: print str(p)+",\t", str(q)+",\t", len(critical_pairs)
    if human_readable==False: print "["+str(p)+", "+str(q)+", "+str(len(critical_pairs))+"],"
    #           
    #for i in indeces(critical_pairs):
    #    print critical_pairs[i]
    #
    #for i in indeces(critical_pairs):
    #    if i==0: print "Critical Pair", "\t|", "pq(n)", "\t"*2, "\t|", "pq(n+2)/pq(n+1)"
    #    for j in indeces(critical_pairs[i]):
    #        if critical_pairs[i][j][0] <> 0: print str(p)+"^"+str(critical_pairs[i][j][0]),
    #        if critical_pairs[i][j][1] <> 0: print str(q)+"^"+str(critical_pairs[i][j][1]),
    #        #print 2**critical_pairs[i][j][0]*3**critical_pairs[i][j][1],
    #    print "\t|",
    #    pqn = str(p**critical_pairs[i][0][0]*q**critical_pairs[i][0][1]*p**critical_pairs[i][1][0]*q**critical_pairs[i][1][1])
    #    print pqn[:29], " "*(29-len(pqn))+"|",
    #    if i <(len(critical_pairs)-2):
    #        ratio = str((p**critical_pairs[i+2][0][0]*q**critical_pairs[i+2][0][1]*p**critical_pairs[i+2][1][0]*q**critical_pairs[i+2][1][1])/(p**critical_pairs[i+1][0][0]*q**critical_pairs[i+1][0][1]*p**critical_pairs[i+1][1][0]*q**critical_pairs[i+1][1][1]))
    #        print ratio[:29],
    #    print 
    p_i += 1
    p = primes[p_i]     
    if p>=q:
        break
if human_readable==False: print "]"
