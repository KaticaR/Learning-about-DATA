# -*- coding: utf-8 -*-
"""
Created on Sat Jan 19 15:06:43 2019

@author: Katica Ristic
"""

# problem 1

# Assume s is a string of lower case characters.
# Write a program that counts up the number of vowels 
# contained in the string s. Valid vowels are: 
# 'a', 'e', 'i', 'o', and 'u'. 
# For example, if s = 'azcbobobegghakl', your program should print:

# Number of vowels: 5

s = 'azcbobobegghtzaklbob'
count = 0 
for st in s :
    if st=='a' or st=='e' or st=='i' or st=='o' or st=='u' :
        count += 1
print('Number of vowels: ' + str(count))




    
# problem 2

# Assume s is a string of lower case characters.
# Write a program that prints the number of times 
# the string 'bob' occurs in s. For example, 
# if s = 'azcbobobegghakl', then your program should print

# Number of times bob occurs is: 2

count = 0

for index in range(len(s)) :
    if s[index:index+3] == 'bob' :
        count +=1
print('Number of times bob occurs is: ' + str(count))






# problem 3

# Assume s is a string of lower case characters.
# Write a program that prints the longest substring 
# of s in which the letters occur in alphabetical 
# order. For example, if s = 'azcbobobegghakl', 
# then your program should print

# Longest substring in alphabetical order is: beggh

# In the case of ties, print the first substring. 
# For example, if s = 'abcbcd', then your program should print

# Longest substring in alphabetical order is: abc

# Note: This problem may be challenging. 
# We encourage you to work smart. If you've spent 
# more than a few hours on this problem, we suggest 
# that you move on to a different part of the course. 
# If you have time, come back to this problem after 
# you've had a break and cleared your head.


ind =0
total =0

for index in range(len(s) - 2) :
        
    i=0
    count = 0
    while s[index+i] <= s[index+i+1] :
        count += 1
        i += 1
        if index+i+1 == len(s) :
            break
    if count > total :
        total = count
        ind = index
        
        
print('Longest substring in alphabetical order is: ' + s[ind:ind+total+1])