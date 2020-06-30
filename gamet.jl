A = [3 2; 2 1]
B = transpose([-2 3; 2 0])
strategies = ['a','b','c','d']
# strictly dominant:
# A:

function dominatee(whatt)
    res = []
    for i = 1:size(whatt,1)
        for j = 1:size(whatt,1)
            if (sum(whatt[i,:].>whatt[j,:]) == size(whatt,1)) && i != j
                append!(res, i)
                print("A strictly dominant: ", whatt[i,:], " strategy ",strategies[i])
            end
        end
    end

    return res
end

function dominatee_weak(whatt)
    res = []
    for i = 1:size(whatt,1)
        for j = 1:size(whatt,1)
            if (sum(whatt[i,:].>=whatt[j,:]) == size(whatt,1)) && i != j
                append!(res, i)
                print("A weakly dominant: ", whatt[i,:], " strategy ",strategies[i])
            end
        end
    end

    return res
end

dominant_sA = dominatee(A)

# B:

dominant_sB = dominatee(B)

# weakly dominant:
# A:

dominant_wA = dominatee_weak(A)

# B:

dominant_wB = dominatee_weak(B)

# strictly dominated:
# A:

print("\nDominated strategies: \n")

print("\nA is strictly dominated by: ", dominant_sB, strategies[dominant_sB])

# B:

print("\nB is strictly dominated by: ", dominant_sA, strategies[dominant_sA])

# weakly dominated:
# A:

print("\nA is weakly dominated by: ", dominant_wB, strategies[dominant_wB])

# B:

print("\nB is weakly dominated by: ", dominant_wA, strategies[dominant_wA])

if (!isempty(dominant_sA)&&!isempty(dominant_sB))
    print("\n The dominant equilibrium is: ", dominant_sA[1] , dominant_sB[1])
end
