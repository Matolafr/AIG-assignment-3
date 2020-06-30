using CSV, DataFrames, Plots, Random, MLBase, Statistics

# variables
vars = [0,0,0]
# a b c
# possibilities
a = [1,2,3,5]
b = [5,10,100]
c = [-2,0,4,8]

a = [1,21]
b = [109,20,100]
c = [19,20]

mat = [a,b,c]
sizes = [size(a,1),size(b,1),size(c,1)]
# constraint: 6 < sum(vars) < 20

summa = 0
j = 1
tick = 1

function solver(vars)

    global summa = 0
    for i = 1:size(vars,1)
        if vars[i] != 0
            global summa = summa + mat[i][vars[i]]
        end
    end
    #print(vars,'\n')
    if (summa > 6) && (summa < 20)
        return true
    end
    last = 1
    while tick == 1
    for i = j:size(vars,1)
        if (sizes[i] > vars[i]) && (summa + mat[i][vars[i]+1] < 20)
            global vars[i] = vars[i] + 1
            last = i
            print(vars,'\n')
            if solver(vars) == true
                #print("Solution found")
                return true
            end
        elseif j < size(vars,1)
             global j = j + 1
        end

        #print(j,'\n')

    end

    global j = last + 1
    vars[last] = vars[last]-1
    if vars[last] < 0
        return false
    end

    print(vars)
    global summa = 0
    for k = 1:size(vars,1)
        if vars[k] != 0
            global summa = summa + mat[k][vars[k]]
        end
    end
    if j == size(vars,1)+1
        #print("Solution not found")
        return false
    end

    end

end

apu = solver(vars)

print(apu)
