// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./Review.sol";

struct Proof {
    string url;
    address author;
    PROOF_RESULT result;
}

enum PROOF_RESULT {
    UNINIT,
    PROVES,
    DISPROVES,
    INCONCLUSIVE
}
