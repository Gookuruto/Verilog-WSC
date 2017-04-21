import filecmp


if(filecmp.cmp('input.txt', 'result.txt')):
    print("Dobrze")
else:
    print("Zle")
    
