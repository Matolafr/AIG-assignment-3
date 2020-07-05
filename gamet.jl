print("----")

A = [5 5 2; 2 1 1]
B = transpose([-2 1 1; -2 1 1])
size(B)
kaikkai = [A,B]
a = ['a','b']
b = ['c','d','e']
strategies = [a,b]
matriisi = kaikkai
# strictly dominant:
# A:
function app(matriisi,strategies)
size(matriisi)
function dominatee(whatt,strat)
    res = 0
    for i = 1:size(whatt,1)
        tick = 0
        for j = 1:size(whatt,1)
            #print("\n",sum(whatt[i,:].>whatt[j,:]))
            if (sum(whatt[i,:].>whatt[j,:]) == size(whatt,2)) && i != j
                tick = tick + 1
                #print("\n", "A strictly dominant: ", whatt[i,:], " strategy ",strat[i])
                #return i
            end
        end
        #print(tick)
        if (tick == size(whatt,1)-1)
            #append!(res, i)
            res = i
            print("\n", "A strictly dominant: ", whatt[i,:], " strategy ",strat[i])
        end
    end
    return res
end

function dominatee_weak(whatt,strat,dom)
    res = []
    for i = 1:size(whatt,1)
        tick = 0
        for j = 1:size(whatt,1)
            if (sum(whatt[i,:].>=whatt[j,:]) == size(whatt,2)) && i != j
                tick = tick + 1
            end
        end
        if ((tick == size(whatt,1)-1) && (i != dom))
            append!(res, i)
            #res = int(i)
            print("\n", "A weakly dominant: ", whatt[i,:], " strategy ",strat[i])
        end
    end
    return res
end

dom = zeros(size(matriisi,1))
#dom = []
#print(dom)

for i = 1:size(matriisi,1)
    print("\n", "Player ", i, ":")
    apu = dominatee(matriisi[i],strategies[i])
    #print("\n", "tyyy", apu[1], "sdfds")
    dom[i] = apu
    #append!(dom, dominatee(matriisi[i],strategies[i]))
end
#print("\nhjhj",dom,"sdgfgf\n")
#dominant_sA = dominatee(A)

# B:

#dominant_sB = dominatee(B)

#dom_w = zeros(size(matriisi,1))
#dom_w = []
dom_w = Array{Any,1}(undef,2)
#apu_2 = 0
#inds = []
for i = 1:size(matriisi,1)
    #if dom[i] != 0
        #apu_2 = dominatee_weak(matriisi[i],strategies[i],dom[i])
        print("\n", "Player ", i, ":")
        dom_w[i] = dominatee_weak(matriisi[i],strategies[i],dom[i])
        #append!(dom_w,apu_2)
        #if apu_2 != []
        #    append!(inds,i)
        #end
        #apu_2 = 0
        #append!(dom_w, dominatee_weak(matriisi[i],strategies[i],dom[i]))
    #else append!(dom_w, dominatee_weak(matriisi[i],strategies[i],0))
    #end
end

# weakly dominant:
# A:

#dominant_wA = dominatee_weak(A)

# B:

#dominant_wB = dominatee_weak(B)

# strictly dominated:
# A:
print("\n")
for a = 1:size(matriisi,1)
    print("\n", "Strictly dominated strategies for player ",a,":\n")
    for i = 1:size(matriisi[a],1)
        if (i != dom[a]) && (dom[a] != 0)
            print(strategies[a][i], "\n")
        end
    end
end

for a = 1:size(matriisi,1)
    print("\n", "Weakly dominated strategies for player ",a,":\n")
    for i = 1:size(matriisi[a],1)
        if (i != dom[a]) && !(i in dom_w[a]) && size(dom_w[a],1) != 0
            print(strategies[a][i], "\n")
        end
    end
end

#print("\nA is strictly dominated by: ", dominant_sB, strategies[dominant_sB])

# B:

#print("\nB is strictly dominated by: ", dominant_sA, strategies[dominant_sA])

# weakly dominated:
# A:

#print("\nA is weakly dominated by: ", dominant_wB, strategies[dominant_wB])

# B:

#print("\nB is weakly dominated by: ", dominant_wA, strategies[dominant_wA])

if (dom[1] != 0 && dom[2] != 0)
    print("\n The dominant equilibrium is: ", strategies[1][Int(dom[1])] ," ", strategies[2][Int(dom[2])])
end
end

print("\n --- \n")
app(kaikkai,strategies)
