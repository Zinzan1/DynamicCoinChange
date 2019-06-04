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

    %setUpMemoize(x);
    %numCoins = memoizeVariant(x,denoms);
    
    numCoins = noRecursion(x, denoms);
end

% Recursive function with memoization
function numCoins = memoizeVariant(x, denoms)
    % Temporary variable for saving potential candidates for memoizing
    temp = Inf;
    
    % Setting default value for numCoins
    numCoins = Inf;
    
    % Base case for recursion
    if (x == 0)
        numCoins = 0;
        return
    end
    
    % Get memoized value if calculated
    if (getGlobalMem(x) ~= 0)
        numCoins = getGlobalMem(x);
        return 
    end
           
    % Calculate value from scratch if not memoized
    for i = denoms
        
        % Base case
        if (i == x)
            numCoins = 1;
            setGlobalMem(x, 1);
            return
        % Recurse if there exists a denomination smaller than x        
        elseif (i < x)
            temp = 1 +  memoizeVariant(x - i, denoms);
            
            % Save the value only if it is the minimum
            if (temp < numCoins)
                numCoins = temp;
            end
        else
        end
    end
    
    % Memoize the smallest value
    setGlobalMem(x, numCoins);
    
    % Set return value
    numCoins = getGlobalMem(x);
    return
end

% Helper function for setting up initial state of memoize array
function setUpMemoize(size)
global memoisedNumCoins;
memoisedNumCoins =  zeros(size,1);
end

% Helper function for setting a global value in memoize array
function setGlobalMem(index, value)
global memoisedNumCoins
memoisedNumCoins(index) = value;
end

% Helper function for getting the value at an index in memoize array
function r = getGlobalMem(index)
    global memoisedNumCoins;
    r = memoisedNumCoins(index);
end



















% No recursion variant for better performance
% Takes advantage of ordering of problem
%
%   Less memory
%   Faster
%   Cleaner code (sort of)
%
% Name: Zinzan Zhao       UPI: zzha440
function numCoins = noRecursion(x, denoms)

table = zeros(x,1) + Inf;

    function r = getTable(index)
        if (index == 0)
            r = 0;
        else
            r = table(index);
        end
    end

% Get number of denominations of coins
N = size(denoms,2);

% Loops through all denominations of coins
for i = 1:N
    % Loops through all amounts of change from denomination to x
    for j = denoms(i):x
        
      % Calculates the tentative solution
      temp2 = 1 + getTable(j - denoms(i));
      
      % Adds tentative solution only if it is better than previous value
      if (temp2 < getTable(j))
        table(j) = temp2;
      end
    end
end

numCoins = getTable(x);

return 
end


