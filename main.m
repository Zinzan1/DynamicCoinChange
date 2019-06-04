% Runner script for optimalCoinChange

% Declaration of global variable to check array in workspace
global memoisedNumCoins;

% Set the amount of change (in cents)
x = 100;

% Set the denomination amounts
denoms = [1,3,4,8,11];

% Call the method
optimalCoinChange(x, denoms)
