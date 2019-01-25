# -*- coding: utf-8 -*-
"""
Created on Thu Jan 24 06:29:29 2019

@author: Katica Ristic
"""


'''
Problem 1 - Paying Debt off in a Year


Write a program to calculate the credit card balance after one year 
if a person only pays the minimum monthly payment required by 
the credit card company each month.

The following variables contain values as described below:

balance - the outstanding balance on the credit card

annualInterestRate - annual interest rate as a decimal

monthlyPaymentRate - minimum monthly payment rate as a decimal

For each month, calculate statements on the monthly payment and 
remaining balance. At the end of 12 months, print out the remaining balance. 
Be sure to print out no more than two decimal digits of accuracy - so print

Remaining balance: 813.41

'''


balance = 3329
annualInterestRate = 0.2
monthlyPaymentRate = 0.04

# Result Your Code Should Generate Below:
# Remaining balance: 31.38

'''
            Month 1 Remaining balance: 40.99
            Month 2 Remaining balance: 40.01
            Month 3 Remaining balance: 39.05
            Month 4 Remaining balance: 38.11
            Month 5 Remaining balance: 37.2
            Month 6 Remaining balance: 36.3
            Month 7 Remaining balance: 35.43
            Month 8 Remaining balance: 34.58
            Month 9 Remaining balance: 33.75
            Month 10 Remaining balance: 32.94
            Month 11 Remaining balance: 32.15
            Month 12 Remaining balance: 31.38
'''

for i in range(0,12) :
    
    minpayment = balance * monthlyPaymentRate # the amout you must pay
    unpaidBalance = balance - minpayment # the balance devresed by the amount that I paid
    interest = unpaidBalance * annualInterestRate / 12.0 
    balance = unpaidBalance + interest
    
    print('Month ' + str(i+1) + ' Remaining balance: ' + str(round(balance,2)))
    
print('Remaining balance: ' + str(round(balance,2)))





'''
Problem 2 - Paying Debt Off in a Year



Now write a program that calculates the minimum fixed monthly payment needed 
in order pay off a credit card balance within 12 months. 
By a fixed monthly payment, we mean a single number which does not change 
each month, but instead is a constant amount that will be paid each month.
In this problem, we will not be dealing with a minimum monthly payment rate.
The following variables contain values as described below:

balance - the outstanding balance on the credit card

annualInterestRate - annual interest rate as a decimal

The program should print out one line: the lowest monthly payment that 
will pay off all debt in under 1 year, for example:

Lowest Payment: 180 

'''


balance = 3329
annualInterestRate = 0.2
payment = 10

while payment < balance :
    lbalance = balance
    for i in range(0,12):
        
        unpaidBalance = lbalance - payment # the balance devresed by the amount that I paid
        interest = unpaidBalance * annualInterestRate / 12.0 
        lbalance = unpaidBalance + interest
        
        
    if lbalance <= 0:
        print('Lowest Payment: ' + str(payment))
        break
    else: 
        payment += 10
        
        

'''

Problem 3 - Using Bisection Search to Make the Program Faster


You'll notice that in Problem 2, 
your monthly payment had to be a multiple of $10. 
Why did we make it that way? 
You can try running your code locally 
so that the payment can be any dollar and 
cent amount (in other words, the monthly payment is 
a multiple of $0.01). Does your code still work? 
It should, but you may notice that your code runs more slowly, 
especially in cases with very large balances and interest rates. 
(Note: when your code is running on our servers, 
there are limits on the amount of computing time 
each submission is allowed, so your observations 
from running this experiment on the grading system might be 
limited to an error message complaining about too much time taken.)

Well then, how can we calculate a more accurate fixed monthly payment 
than we did in Problem 2 without running into the problem of slow code? 
We can make this program run faster using a technique introduced in lecture 
- bisection search!
The following variables contain values as described below:

balance - the outstanding balance on the credit card

annualInterestRate - annual interest rate as a decimal

To recap the problem: we are searching for the smallest monthly payment 
such that we can pay off the entire balance within a year. 
What is a reasonable lower bound for this payment value? 
$0 is the obvious anwer, but you can do better than that. 
If there was no interest, the debt can be paid off by monthly payments 
of one-twelfth of the original balance, 
so we must pay at least this much every month. 
One-twelfth of the original balance is a good lower bound.

What is a good upper bound? Imagine that instead of paying monthly, 
we paid off the entire balance at the end of the year. 
What we ultimately pay must be greater than what we would've paid 
in monthly installments, because the interest was compounded 
on the balance we didn't pay off each month. 
So a good upper bound for the monthly payment would be 
one-twelfth of the balance, after having its interest 
compounded monthly for an entire year.

In short:

Monthly interest rate = (Annual interest rate) / 12.0
Monthly payment lower bound = Balance / 12
Monthly payment upper bound = (Balance x (1 + Monthly interest rate)12) / 12.0

Write a program that uses these bounds and bisection search 
(for more info check out the Wikipedia page on bisection search) 
to find the smallest monthly payment to the cent (no more multiples of $10) 
such that we can pay off the debt within a year. 
Try it out with large inputs, and notice how fast it is 
(try the same large inputs in your solution to Problem 2 to compare!). 
Produce the same return value as you did in Problem 2.

'''

balance = 999999
annualInterestRate = 0.18
payment = 0
lower = balance/12.0
upper = (balance*(1+annualInterestRate/12)**12)/12.0
lbalance = 0

while payment < balance :
    
    oldbalance = lbalance
    lbalance = balance
    payment = round((lower + upper)/2,3)
    
    #print(payment)
    #print(lower)
    #print(upper)
    
    for i in range(0,12):
        
        unpaidBalance = lbalance - payment # the balance devresed by the amount that I paid
        interest = unpaidBalance * annualInterestRate / 12.0 
        lbalance = unpaidBalance + interest
        
    #print(lbalance)    
    if round(lbalance,2) == 0 or oldbalance == lbalance:
        print('Lowest Payment: ' + str(payment))
        break
    elif lbalance > 0 :
        lower = payment
    else:
        upper = payment



























