// Author: Vladyslav Moisieienkov
// NodeJS: 8.4.0

const crypto = require('crypto');
const bcrypt = require('bcrypt');

const userPasswordToHash = 'StrongUserPassword1369:)';

function bryptHash(rounds) {
    console.log('- bcrypt with', rounds, 'round(s)');
    console.time('time');
    bcrypt.hashSync(userPasswordToHash, rounds);
    console.timeEnd('time');
    console.log();
}

console.log('[*] Start sha256 hash function on password');
console.time('time');
const hash = crypto.createHash('sha256');
hash.update(userPasswordToHash);
hash.digest('hex');
console.timeEnd('time');
console.log('[*] Starting bcrypt tests:');

bryptHash(1);
bryptHash(2);
bryptHash(5);
bryptHash(8);
bryptHash(10);
bryptHash(12);
bryptHash(15);
// bryptHash(20); -> takes about 70000ms
