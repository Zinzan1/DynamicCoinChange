function numCoins = optimalCoinChange(x, denoms)
% Function finds the minimum number of coins required to change a monetary
% amount.
% Inputs:
% x = amount of money to be given in coins, given as an INTEGER, in cents.
%           e.g. $1.35 is input as 135
% denoms = denominations of coins available, in INTEGER cents, 
%           given as a ROW VECTOR.
%
% Output:
% numCoins = optimal number of coins used to find x
%
% YOUR NAME AND USERNAME GOES HERE
% Name: Zinzan Zhao       UPI: zzha440

    setUpMemoize(x);
    numCoins = memoizeVariant(x,denoms);
end

function numCoins = memoizeVariant(x, denoms)
% Function finds the minimum number of coins required to change a monetary
% amount.
% Inputs:
% x = amount of money to be given in coins, given as an INTEGER, in cents.
%           e.g. $1.35 is input as 135
% denoms = denominations of coins available, in INTEGER cents, 
%           given as a ROW VECTOR.
%
% Output:
% numCoins = optimal number of coins used to find x
%
% YOUR NAME AND USERNAME GOES HERE
% Name: Zinzan Zhao       UPI: zzha440
    temp = Inf;
    numCoins = Inf;

    if (x == 0)
        numCoins = 0;
        return
    end
    
    if (getGlobalMem(x) ~= 0)
        numCoins = getGlobalMem(x);
        return 
    end
           
    for i = denoms
        if (i == x)
            numCoins = 1;
            setGlobalMem(x, 1);
            return
                
        elseif (i < x)
            temp = 1 +  memoizeVariant(x - i, denoms);
            if (temp < numCoins)
                numCoins = temp;
            end
        else
        end
    end
    
    setGlobalMem(x, numCoins);
    
    numCoins = getGlobalMem(x);
    return
end

function setUpMemoize(size)
global memoisedNumCoins;
memoisedNumCoins =  zeros(size,1);
end

function setGlobalMem(index, value)
global memoisedNumCoins
memoisedNumCoins(index) = value;
end

function r = getGlobalMem(index)
    global memoisedNumCoins;
    r = memoisedNumCoins(index);
end