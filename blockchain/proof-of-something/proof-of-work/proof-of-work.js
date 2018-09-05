// Author: Vladyslav Moisieienkov
// NodeJS: 8.4.0

const crypto = require('crypto');

// max value of nonce
const maxNonce = 99999999;

// zero that we will be searching for
const zero = '0';

// Simple 'block'
const block = {
    data: 'Data to hash, could be transaction or anything else',
    timestamp: Date.now()
};

function proofOfWork(block, difficulty) {
    console.log("[*] Start PoW with difficulty: ", difficulty);
    var nonce = 0;
    var isBlockMined = false;

    // set count of zeros based on difficulty
    const searchFor = zero.repeat(difficulty);

    console.time("Time");
    while(!isBlockMined) {
        const hash = crypto.createHash('sha256');
        hash.update(block.data + block.timestamp + nonce);

        var calculatedHash = hash.digest('hex');

        if(calculatedHash.indexOf(searchFor) === 0) {
            isBlockMined = true;
            console.log("- required hash found: ", calculatedHash);
            console.log("- nonce: ", nonce);
            console.timeEnd("Time");
        }
        nonce += 1;
        if (nonce > maxNonce) {
            console.log("[!] nonce value is more than allowed max...");
            isBlockMined = true;
        }
    }
    console.log("==============================");
    console.log();
}

proofOfWork(block, 1);
proofOfWork(block, 2);
proofOfWork(block, 3);
proofOfWork(block, 4);
proofOfWork(block, 5);
proofOfWork(block, 6);

