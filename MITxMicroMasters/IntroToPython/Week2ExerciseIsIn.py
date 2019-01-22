# -*- coding: utf-8 -*-
"""
Created on Tue Jan 22 16:49:17 2019

@author: Katica
"""

def isIn(char, aStr):
    '''
    char: a single character
    aStr: an alphabetized string
    
    returns: True if char is in aStr; False otherwise
    '''
    
    if char == aStr :
        return True
    elif len(aStr) == 1 and char > aStr : 
        return False 
    elif char == aStr[len(aStr)//2] :
        return True
    elif char < aStr[len(aStr)//2] :
        return isIn(char, aStr[:len(aStr)//2])
    elif char > aStr[len(aStr)//2]: 
        return isIn(char, aStr[len(aStr)//2:])