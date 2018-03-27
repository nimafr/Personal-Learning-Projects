#Nima Rahimzadeh
#1000988557
#11/9/2017
#Ubuntu

f = open('input.txt', 'r')  #create file reader object

data = f.readlines() #Reading the txt file into a list of strings
bracket_Count=0      #Setting bracket count iterator
slash_Count = 0      #Setting slash count iterator
for line in data:       #looping through all strings in data
    slash_Count = 0     #resetting slash count
    for token in line:      #looping through all tokens in each line
        if token is '/':        #if token is /
            slash_Count += 1                    #slash_Count += 1
        elif token is '{' and slash_Count is 0: #else if token is { and slash count is 0
            bracket_Count=bracket_Count+1       #increase bracket count
            line = str(bracket_Count) + line    #input bracket count at beginning of line
            
        elif token is '}' and slash_Count is 0: #else if token is } and slash count is 0
            bracket_Count=bracket_Count-1       #increase bracket count
            line = str(bracket_Count) + line    #input bracket count at beginning of line
    slash_Count = 0     #resetting slash count
    print(line),        #print line

    