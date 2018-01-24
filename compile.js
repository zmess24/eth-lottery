// Native Node Modules
const path = require('path');
const fs = require('fs');
// Solidity Compiler
const solc = require('solc');

// Grab Source Code
const lotteryPath = path.resolve(__dirname, 'contracts', 'Lottery.sol');
const source = fs.readFileSync(lotteryPath, 'utf8');

module.exports = solc.compile(source, 1).contracts[':Lottery'];