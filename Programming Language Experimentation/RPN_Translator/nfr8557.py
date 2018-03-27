#Nima Rahimzadeh
#1000988557
#Wednesday, October 25 2017
#Ubuntu

class Stack:               #Creating custom stack class to assist in converting algebraic > RPN
    def __init__(self):
        self.items = []

    def push(self, item):
        self.items.insert(0,item)

    def pop(self):
        return self.items.pop(0)

    def insert(self, index, item):
        return self.items.insert(index, item)

    def isEmpty(self):
        return self.items == []

    def peek(self):
        return self.items[0]

def isNumber(x): #to return true if input is a number
    try:
        float(x)
        return True
    except ValueError:
        pass

def algeToRPN(algeExpression):	#Function to convert algebraic expression to RPN
    operator = {}		#list for operator functions
    operatorStack = Stack()	#custom Stack instance for the operators
    RPN_Array = []  #Array to contain the converted RPN
    tokenArray = algeExpression.split() #Splitting the algebraic expression and storing it in tokenArray
    operator["("] = 0		#assigning precedant to operators
    operator["+"] = 1		#assigning precedant to operators
    operator["-"] = 1		#assigning precedant to operators
    operator["*"] = 2		#assigning precedant to operators
    operator["/"] = 2		#assigning precedant to operators
    operator["^"] = 3		#assigning precedant to operators

    for token in tokenArray:	#loops for each token in tokenArray
        if isNumber(token):	#calls custom function to check if token is a number
            RPN_Array.append(token)	#appends number to RPN array
        elif token == '(':		#else if token is a (
            operatorStack.push(token)	#push (
        elif token == ')':		#else if token is a )
            topToken = operatorStack.pop()	#pop top of operator stack
            while topToken != '(':		#while the popped token is a (
                RPN_Array.append(topToken)	#push topToken to RPN_Array
                topToken = operatorStack.pop()  #pop top of operator stack and store it in topToken again
        else:
            while (not operatorStack.isEmpty()) and \		
               (operator[operatorStack.peek()] >= operator[token]):
                  RPN_Array.append(operatorStack.pop())
            operatorStack.push(token)
            
    while not operatorStack.isEmpty():
        RPN_Array.append(operatorStack.pop())
    return RPN_Array

def solveRPN(RPNExpression):	#Given a string RPN expression, returns solution
    solution = 0	#sets return value to 0
    numberStack = []	#new classic python stack called numberStack
    for x in RPNExpression:	#iterates through all tokens in RPNExpression
        if isNumber(x):		#checks if x is a number
            numberStack.insert(0, x)	#inserts X at beginning of numberStack
        else:
            a = float(numberStack.pop(1))	#pops 2nd value of numberStack and stores is as a float into a
            b = float(numberStack.pop(0))	#pops 2nd value of numberStack and stores is as a float into b
            if x == '*':			#checks if op is *
                solution = a*b			#performs op
            elif x == '/':			#checks if op is /
                solution = a/b			#performs op
            elif x == '+':			#...
                solution = a+b			#...
            elif x == '-':			#...
                solution = a-b			#...
            numberStack.insert(0, str(solution))	#inserts solution as a string in beginning of numberStack
    return str(solution)	#returns solution


f = open('input_RPN.txt', 'r') #opens file to read
algeExpArray = f.readlines()   #reads each line and stores them into a 3d array of characters
count = 0			#sets iterator to 0
for i in algeExpArray:		#iterates through all strings in algeExpArray
    inputAlge = algeExpArray[count]	#gets inputted algebraic expression from array of strings at index count
    inputRPN = algeToRPN(inputAlge)	#converts to RPN expression
    print("")				#newline
    print("Input to RPN: " + " ".join(inputRPN))  #prints converted RPN expression
    print("Solution: " + solveRPN(inputRPN))	#prints solution to RPN expression
    count = count+1		#iterates count by 1
