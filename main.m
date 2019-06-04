% Runner script for optimalCoinChange

% Declaration of global variable to check array in workspace
global memoisedNumCoins;

% Set the amount of change (in cents)
x = 1000;

% Set the denomination amounts
denoms = [8,11,17,43];

% Call the method
optimalCoinChange(x, denoms)
